# 📉 Telco Customer Churn & Revenue Impact Analysis

## 📌 Project Overview
This project delivers an end-to-end data analytics solution designed to combat customer attrition in the telecommunications sector. By transforming raw customer data into actionable business intelligence, this project identifies critical churn drivers and quantifies the exact financial impact of lost subscribers.

## 🛠️ Tech Stack
* **Data Engineering:** MySQL (Data ingestion, cleaning, and feature engineering)
* **Visualization:** Power BI (Interactive reporting and KPI dashboarding)
* **Languages:** SQL (Data manipulation), DAX (Metric calculation)

## 💡 Key Business Insights
As demonstrated in the project dashboard, the company faces significant financial exposure:
* **Revenue Hemorrhage:** Churned customers account for **$139,130.85** in lost monthly recurring revenue, totaling over **$2.86M** in historical revenue impact.
* **Contract Vulnerability:** Month-to-month contracts serve as the primary churn risk factor.
* **Early-Stage Attrition:** Customers with tenure under 12 months show the highest propensity to leave, suggesting a critical need for targeted onboarding retention campaigns.

## 📂 Repository Structure
* `/data/`: Contains the original `telco_churn.csv` dataset.
* `/sql/`: Contains the complete data pipeline:
    * `01_create_table.sql`: Schema definition and data ingestion.
    * `02_cleaning.sql`: Data cleaning and feature engineering (e.g., Tenure Groups, Senior Citizen labeling).
    * `03_analysis.sql`: Business logic and KPI extraction.
* `/dashboard/`: Contains the Power BI file (`churn_dashboard.pbix`).

## 🚀 How to Replicate
1. **Database:** Import the dataset into MySQL Workbench using the Table Data Import Wizard.
2. **Execution:** Run the SQL scripts in numerical order to prepare the data.
3. **Visualization:** Connect Power BI to your local MySQL instance using the MySQL Connector/NET and load the prepared table.

*Created by Devanshu Chotiya*
