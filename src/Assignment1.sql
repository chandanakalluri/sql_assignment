--1. create database ecommerce;
use ecommerce;
-- Creating tables
create table gold_member_user(userid varchar(30),
   signup_date DATE);

--creating2 nd table:

create table sales (userid varchar(20),creatd_date date,product_id int);
--ALTER table sales add product_id int;
--creating 3 table:

create table uers(userid varchar(20) , signup_date date);
--alter table uers drop column product_id;

--creating 4 table:

create table product(product_id varchar(20),product_name varchar(20),price int);

--3. Inserting values into the tables
 
INSERT INTO gold_member_user VALUES('John','09-22-2017'), ('Mary','04-21-2017');
INSERT INTO uers VALUES('John','09-02-2014'), ('Michel','01-15-2015'), ('Mary','04-11-2014');
INSERT INTO sales VALUES('John','04-19-2017',2), ('Mary','12-18-2019',1), 
('Michel','07-20-2020',3), ('John','10-23-2019',2),
('John','03-19-2018',3), ('Mary','12-20-2016',2), 
('John','11-09-2016',1), ('John','05-20-2016',3), 
('Michel','09-24-2017',1), ('John','03-11-2017',2), 
('John','03-11-2016',1), ('Mary','11-10-2016',1), 
('Mary','12-07-2017',2);
INSERT INTO product VALUES(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330);

 --4. showing all the tables using one query

SELECT * FROM INFORMATION_SCHEMA.tables;

--5. showing all table recrdsusing single query
 SELECT
    (SELECT COUNT(*) FROM gold_member_user) AS gold_member_users_count,
    (SELECT COUNT(*) FROM uers) AS users_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;
--6. the total amount each customer spent on ecommerce company

SELECT
    sales.userid,
	sum(product.price)as total_amount
	from
	sales join product on sales.product_id=product.product_id
	group by
	sales.userid;

--the distinct dates of each customer visited the website

SELECT DISTINCT creatd_date, userid from sales

--8. first product purchased by each customer using 3 tables(users, sales, product)


SELECT sales.userid, MIN(sales.creatd_date) AS first_purchase_date, product_name
FROM uers
JOIN sales ON uers.userid = sales.userid
JOIN product ON sales.product_id = product.product_id
GROUP BY sales.userid, product_name;

--9. the most purchased item of each customer and how many times the customer has purchased it

SELECT userid, COUNT(product_name)as count_item
FROM sales
join product on product.product_id=sales.product_id
GROUP BY userid;

--11. the amount spent by each customer when he was the gold_member user

SELECT g.userid, SUM(p.price) AS total_amount_spent
FROM gold_member_user g
JOIN sales s ON g.userid = s.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY g.userid;

--12.Find the Customers names whose name starts with M

select * from uers where userid like 'm%';

 --13. Find the Distinct customer Id of each customer

 select DISTINCT userid from uers;

 --14. Change the Column name from product table as price_value from price

 EXEC sp_rename 'product.price', 'price_value','column'

--15. Change the Column value product_name – Ipad to Iphone from product table

UPDATE product set product_name='Iphone'
WHERE product_name='Ipad';

--16. Change the table name of gold_member_users to gold_membership_users

EXEC sp_rename 'gold_member_user','gold_membership_users';

--17. Create a new column as Status in the table crate above gold_membership_users  the Status values should
-- be 2 Yes and No if the user is gold member, then status should be Yes else No.
 
 ALTER TABLE gold_membership_users
ADD Status VARCHAR(3) DEFAULT 'No';

UPDATE gold_membership_users
SET Status = 'Yes';

--18. Delete the users_ids 1,2 from users table and roll the back 
--changes once both the rows are deleted one by one mention the result when performed roll back

BEGIN TRANSACTION;
DELETE FROM  uers WHERE userid='John';
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM uers WHERE userid='Mary'
ROLLBACK;

--19. Insert one more record as same (3,'Laptop',330) as product table

INSERT INTO product VALUES(3,'Laptop',330);

--20. Write a query to find the duplicates in product table

SELECT product_id, COUNT(*) AS duplicates
FROM product
GROUP BY product_id
HAVING COUNT(*) > 1; 
