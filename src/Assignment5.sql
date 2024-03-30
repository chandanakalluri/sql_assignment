--1)	create a table named sales_data with columns: product_id, sale_date, and  quantity_sold.
--2)	insert some sample data into the table:
--dataset: 
--(1, '2022-01-01', 20),
--   		(2, '2022-01-01', 15),
--   		(1, '2022-01-02', 10),
--    		(2, '2022-01-02', 25), 
--    		(1, '2022-01-03', 30),
--    		(2, '2022-01-03', 18),
--    		(1, '2022-01-04', 12),
--    	(2, '2022-01-04', 22)
--3)	Assign rank by partition based on product_id and find the latest product_id sold
--4)	Retrieve the quantity_sold value from a previous row and compare the quantity_sold.
--5)	Partition based on product_id and return the first and last values in ordered set.
CREATE TABLE sales_data(product_id int, sale_date date,  quantity_sold int);
INSERT INTO sales_data VALUES(1, '2022-01-01', 20),(2, '2022-01-01', 15),
   		(1, '2022-01-02', 10),
    		(2, '2022-01-02', 25),
    		(1, '2022-01-03', 30),
    		(2, '2022-01-03', 18),
    		(1, '2022-01-04', 12),
    	(2, '2022-01-04', 22);
		
SELECT product_id, sale_date, quantity_sold,RANK() OVER (PARTITION BY product_id ORDER BY sale_date DESC) AS product_rank
FROM sales_data;

SELECT *,
FIRST_VALUE(quantity_sold)OVER(PARTITION BY product_id ORDER BY sale_date),
LAST_VALUE(quantity_sold)OVER(PARTITION BY product_id ORDER BY sale_date)
FROM sales_data;

SELECT
    product_id,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_quantity,
    LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS last_quantity
FROM
    sales_data;
