USE churn_analysis;

-- 1. Overall Churn Rate
SELECT 
    COUNT(customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS churn_rate_percentage
FROM telco_churn;

-- 2. Churn Rate by Contract Type (Month-to-month usually highest)
SELECT 
    Contract,
    COUNT(customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 3. Churn by Tenure Group (When are they leaving?)
SELECT 
    tenure_group,
    COUNT(customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS churn_rate
FROM telco_churn
GROUP BY tenure_group
ORDER BY MIN(tenure); -- Orders chronologically by the lowest tenure in that bin

-- 4. Churn by Payment Method
SELECT 
    PaymentMethod,
    COUNT(customerID) AS total_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customerID)) * 100, 2) AS churn_rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- 5. Revenue Impact (How much money is walking out the door?)
SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue_lost,
    ROUND(SUM(TotalCharges), 2) AS total_historical_revenue_lost
FROM telco_churn
WHERE Churn = 'Yes';