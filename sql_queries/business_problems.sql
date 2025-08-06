-- payment methods: 
SELECT DISTINCT payment_method
FROM walmart;

-- number of transactions:
SELECT payment_method, COUNT(*) AS total_transactions
FROM walmart
GROUP BY payment_method;

-- identify the highest-rated category in each branch, dispalying the branch, category and average rating
SELECT * FROM
(	SELECT
		branch,
		category,
		AVG(rating) AS avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS position
	FROM walmart
	GROUP BY branch, category
) AS ranked_categories
WHERE position=1;

-- identify the busiest day for each branch based on the number of transactions
SELECT *
FROM
(	SELECT
		branch,
		DAYNAME(STR_TO_DATE(`date`,'%d/%m/%y')) AS day_name,
		COUNT(*) AS no_of_transactions,
		RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS position
	FROM walmart
	GROUP BY branch, day_name
) AS ranked_days
WHERE position= 1;

-- calculate the total quantity of items sold per payment method. list payment_method and total_quantity. 
SELECT 
	payment_method,
    SUM(quantity) AS total_quantity
FROM walmart 
GROUP BY payment_method;

-- determine the average, minimum, and maximum rating of category for each city. list the city, avg_rating, min_rating and max_rating. 
SELECT
	City, category,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM walmart 
GROUP BY City,category;

-- Calculate the total profit for each category by considering total profit as (unit_price * quantity * profit_margin).
--    List category and total profit, ordered from highest to lowest profit.
SELECT
	category,
    SUM(total) AS total_revenue,
    SUM(total * profit_margin) AS profit
FROM walmart 
GROUP BY category;

-- Determine the most common payment method for each Branch. Display Branch and the preferred_payment_method.
SELECT * FROM
(	SELECT
		Branch,
		payment_method,
		COUNT(*) AS total_transaction,
		RANK() OVER(PARTITION BY Branch ORDER BY COUNT(*)DESC) AS position
	FROM walmart
	GROUP BY Branch, payment_method
) AS preferred_payment_method
WHERE position=1;

-- Categorise sales into 3 groups MORNING, AFTERNOON, EVENING
-- Find out each of the shift and number of invoices
SELECT 
	Branch,
	CASE 
		WHEN HOUR(CAST(`time` AS TIME)) < 12 THEN 'Morning'
        WHEN HOUR(CAST(`time` AS TIME)) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
	END AS time_of_day,
    COUNT(*) AS invoices
FROM walmart
GROUP BY Branch, time_of_day
ORDER BY Branch, invoices DESC;

-- 	Identify 5 branch with highest decrease ratio in revenue
-- compare to last year(current year 2023 and last year 2022) 
-- rdr = last_rev-curr_rev/last_rev*100
WITH revenue_2022
AS
(
	SELECT
		Branch,
		SUM(total) as revenue
	FROM walmart 
	WHERE YEAR(STR_TO_DATE(`date`,'%d/%m/%y'))=2022
	GROUP BY Branch
),
revenue_2023
AS
(
	SELECT
		Branch,
		SUM(total) as revenue
	FROM walmart 
	WHERE YEAR(STR_TO_DATE(`date`,'%d/%m/%y'))=2023
	GROUP BY Branch
)
SELECT 
	last.Branch,
    last.revenue as last_year_revenue,
    curr.revenue as curr_year_revenue,
    ROUND(
		(last.revenue - curr.revenue)/last.revenue * 100,
	2) AS rev_dec_ratio
FROM revenue_2022 AS last
JOIN
revenue_2023 AS curr
ON last.Branch = curr.Branch
WHERE 
	last.revenue > curr.revenue
ORDER BY 4 DESC
LIMIT 5;
