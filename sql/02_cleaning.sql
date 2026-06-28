USE churn_analysis;

-- 1. Fix the TotalCharges empty string issue
-- Kaggle data represents 0 tenure customers with blank spaces (' ')
UPDATE telco_churn
SET TotalCharges = NULL
WHERE TotalCharges = ' ' OR TotalCharges = '';

-- 2. Safely convert TotalCharges to a numeric data type
ALTER TABLE telco_churn
MODIFY COLUMN TotalCharges DECIMAL(10, 2);

-- 3. Feature Engineering: Create Tenure Bins for Power BI visuals
ALTER TABLE telco_churn
ADD COLUMN tenure_group VARCHAR(20);

UPDATE telco_churn
SET tenure_group = CASE 
    WHEN tenure <= 12 THEN '0-12 Months'
    WHEN tenure <= 24 THEN '13-24 Months'
    WHEN tenure <= 36 THEN '25-36 Months'
    WHEN tenure <= 48 THEN '37-48 Months'
    WHEN tenure <= 60 THEN '49-60 Months'
    ELSE '61+ Months'
END;

-- 4. Standardize SeniorCitizen to Yes/No text (Much better for dashboard filtering)
ALTER TABLE telco_churn
ADD COLUMN SeniorCitizen_Text VARCHAR(3);

UPDATE telco_churn
SET SeniorCitizen_Text = IF(SeniorCitizen = 1, 'Yes', 'No');