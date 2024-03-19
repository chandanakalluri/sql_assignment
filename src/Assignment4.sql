use ecommerce
--Write a query to find gmail accounts with latest and first signup date and difference between
-- both the dates and also write the query to replace null value with ‘1970-01-01’
CREATE TABLE email_signups (id INT, email_id VARCHAR(30), signup_date DATE);
INSERT INTO email_signups VALUES(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);
SELECT MAX(signup_date), min(signup_date) FROM 
email_signups;