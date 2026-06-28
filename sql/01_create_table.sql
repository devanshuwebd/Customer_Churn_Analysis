-- 1. Temporarily disable strict mode to force the import through
SET SESSION sql_mode = '';

USE churn_analysis;

-- 2. Completely reset the table to ensure we have exactly 21 columns
DROP TABLE IF EXISTS telco_churn;

CREATE TABLE telco_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges VARCHAR(20), 
    Churn VARCHAR(5)
);

-- 3. Load the data 
-- ==============================================================================
-- DATA IMPORT INSTRUCTIONS FOR GITHUB USERS
-- ==============================================================================
-- Due to MySQL's secure_file_priv settings, you cannot load data directly from 
-- the /data/ folder in this repository using a relative path.
--
-- OPTION 1: Use the MySQL Workbench Table Data Import Wizard and select the 
--           telco_churn.csv file from the /data/ folder in this repository.
--
-- OPTION 2: Move the telco_churn.csv file to your MySQL Uploads folder and 
--           run the command below (update the file path to match your system).
-- ==============================================================================

/*
LOAD DATA INFILE 'C:/path/to/your/mysql/Uploads/telco_churn.csv'
INTO TABLE telco_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
*/

-- 4. Verify the data loaded
SELECT COUNT(*) AS Total_Rows_Imported FROM telco_churn;
SELECT * FROM telco_churn LIMIT 10;