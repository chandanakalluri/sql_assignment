--Write a query to find gmail accounts with latest and first signup date and difference between both the dates and also write the query to replace null value with ‘1970-01-01’
--Column names: (id, email_id, signup_date)
--Data:
--(1, 'Rajesh@Gmail.com', '2022-02-01'),
--(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
--(3, 'Hitest@Gmail.com', '2020-09-08'),
--(4, 'Salil@Gmmail.com', '2019-07-05'),
--(5, 'Himanshu@Yahoo.com', '2023-05-09'),
--(6, 'Hitesh@Twitter.com', '2015-01-01'),
--(7, 'Rakesh@facebook.com', null);

use ecommerce
SELECT*FROM email_signups;
SELECT 
    count(*)as count_gmail,
	MAX(signup_date)AS Latest_gmail_account,
	MIN(signup_date)AS First_gmail_accunt,
	DATEDIFF(DAY, MIN(signup_date), MAX(signup_date))
	FROM
	email_signups
	WHERE 
	LOWER(email_id)like '%gmail.com';
	UPDATE email_signups
	SET signup_date = COALESCE(signup_date, '1970-01-01');
