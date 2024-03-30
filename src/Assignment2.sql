 use ecommerce
create table product_detail(sell_date date, product varchar(20));
INSERT INTO product_detail VALUES('2020-05-30', 'Headphones'),
('2020-06-01','Pencil'),
('2020-06-02','Mask'),
('2020-05-30','Basketball'),
('2020-06-01','Book'),
('2020-06-02', ' Mask '),
('2020-05-30','T-Shirt');
--query to find for each date the number of different products sold and their names.

SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       (SELECT STRING-AGG(DISTINCT product,',') AS product_list
		FROM product_details
GROUP BY sell_date
ORDER BY sell_date;


