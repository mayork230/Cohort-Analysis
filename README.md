# Online Retail Cohort-Analysis Documentation
## Table of Contents
- [Overview](#Overview)
- [Data Source](#data-source)
- [Cohort Retention Dashboard](#cohort-retention-dashboard)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [License](#license)
- [Conclusion](#conclusion)
## Overview
This project involves performing Cohort Analysis to understand customer retention over time. The analysis helps identify patterns in customer behavior, track retention rates, and guide data-driven decisions for improving user engagement and reducing churn.

The dashboard visualizes both Cohort Retention Rates and Cohort Tables, helping businesses see how customer retention evolves month by month across different cohorts.
## Data Source
I got this dataset from UCI Machine Learning Repository. The dataset is an Online Retail Store which contains 13 columns. InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice. The original data contains 541,909 rows which after cleaning reduced to 392,669 rows. SQL was used to clean the dataset to remove inconsistencies and irrelevant data. Tableau was used to visualize the final results in chart to derive insights.
## Tools Used
- SQL Server - Cleaning and Data Analysis
- Tableau - Data Visualization
## Data Cleaning/Preparation
In the initial data preperation phase, we performed the following tasks:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.
## Exploratory Data Analysis
The business problem we're addressing in this project revolves around customer retention. 
Specifically:
- Challenge: Many businesses experience significant customer drop-off shortly after acquisition. Retaining customers over the long term is crucial for driving sustainable growth.
- Objective: To identify patterns in customer engagement and retention rates over time, helping the business understand where and why customers are disengaging, and how to re-engage them effectively.
  
# Here are the steps:
- Step 1
  
Identify the First Purchase Date

Select the CustomerID and the first InvoiceDate.

Create a new column Cohort_Date representing the year and month of the first purchase.

- Step 2
  
Create Cohort Index

To track customer behavior over time, we need to create a Cohort_Index, which shows the time elapsed since the customer's first purchase.

Join Data and Create the Index

Add Cohort_Date to the main table by joining it with #Cohort

Calculate the year and month differences between the purchase date and the cohort date.

Create the Cohort_Index,  where 1 represents the first event in the cohort.

- Step 3

Pivot Data for Cohort Analysis

To visualize the retention, we group customers by their Cohort_Index.

Group and Pivot Data

Use the PIVOT function to count the number of customers in each cohort over time.



