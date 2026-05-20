SELECT COUNT(*) 
FROM customers;
SELECT *
FROM customers
LIMIT 10;
SELECT *
FROM customers
WHERE Income_Category IS NULL;
SELECT CLIENTNUM, COUNT(*)
FROM customers
GROUP BY CLIENTNUM
HAVING COUNT(*) > 1;
SELECT Gender,
       COUNT(*) AS Total_Customers
FROM customers
GROUP BY Gender;
SELECT AVG(Credit_Limit) AS Avg_Credit_Limit
FROM customers;
SELECT CLIENTNUM,
       Total_Trans_Amt
FROM customers
ORDER BY Total_Trans_Amt DESC
LIMIT 10;
select gender, 
count(*) as total_customers 
from customers
group by gender;
SELECT income_category,
       AVG(total_trans_amt) AS avg_spend
FROM customers
GROUP BY income_category
ORDER BY avg_spend DESC;
select clientnum,
total_trans_amt,
case 
when total_trans_amt > 10000 then 'High Value'
when total_trans_amt > 5000 then  ' Medium Value' 
else 'Low Value'
end as customer_segment
from customers;
SELECT 

    CASE
        WHEN total_trans_amt > 10000 THEN 'High Value'

        WHEN total_trans_amt > 5000 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS customer_segment,

    COUNT(*) AS total_customers

FROM customers

GROUP BY customer_segment

ORDER BY total_customers DESC;
SELECT 

    CASE
        WHEN total_trans_amt > 10000 THEN 'High Value'

        WHEN total_trans_amt > 5000 THEN 'Medium Value'

        ELSE 'Low Value'

    END AS customer_segment,

    COUNT(*) AS total_customers

FROM customers
GROUP BY customer_segment

ORDER BY total_customers DESC;
SELECT clientnum,
       credit_limit,
       avg_utilization_ratio,
       attrition_flag
FROM customers
WHERE avg_utilization_ratio > 0.8
   OR attrition_flag = 'Attrited Customer';
   SELECT clientnum,
       credit_limit,
       avg_utilization_ratio,
       attrition_flag,
       CASE
          WHEN Avg_Utilization_Ratio > 0.8
             THEN 'High Risk'

        WHEN Avg_Utilization_Ratio > 0.5
             THEN 'Medium Risk'

        ELSE 'Low Risk'
        
    END AS Risk_Level
FROM customers;
create view risk_summary as 
select 
case
when avg_utilization_ratio > 0.8 
then 'High Risk'
when avg_utilization_ratio >0.5
then  'Medium Risk'
else 'Low Risk'
end as Risk_level,
count(*) as Total_customers, 
avg(credit_limit) as avg_credit_limit,
avg(total_trans_amt) as avg_spending
from customers
group by Risk_Level;

SELECT * FROM risk_summary ;
SELECT 

    Attrition_Flag,

    COUNT(*) AS Total_Customers,

    AVG(Credit_Limit) AS Avg_Credit_Limit,

    AVG(Total_Trans_Amt) AS Avg_Spending

FROM customers

GROUP BY Attrition_Flag ;


SELECT 

    Income_Category,

    COUNT(*) AS Total_Customers,

    AVG(Total_Trans_Amt) AS Avg_Spending,

    AVG(Credit_Limit) AS Avg_Credit_Limit

FROM customers

GROUP BY Income_Category

ORDER BY Avg_Spending DESC;