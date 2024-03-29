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
