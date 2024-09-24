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
I got this dataset from UCI Machine Learning Repository. The dataset is an Online Retail Store which contains 13 columns. InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice. The original data contains 541,909 rows which after cleaning reduced to *392,669* rows. SQL was used to clean the dataset to remove inconsistencies and irrelevant data. Tableau was used to visualize the final results in chart to derive insights.
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
  
## Here are the steps:
**Step 1**
  
Identify the First Purchase Date

Select the CustomerID and the first InvoiceDate.

Create a new column Cohort_Date representing the year and month of the first purchase.

**Step 2**
  
Create Cohort Index

To track customer behavior over time, we need to create a Cohort_Index, which shows the time elapsed since the customer's first purchase.

Join Data and Create the Index

Add Cohort_Date to the main table by joining it with #Cohort

Calculate the year and month differences between the purchase date and the cohort date.

Create the Cohort_Index,  where 1 represents the first event in the cohort.

**Step 3**

Pivot Data for Cohort Analysis

To visualize the retention, we group customers by their Cohort_Index.

Group and Pivot Data

Use the PIVOT function to count the number of customers in each cohort over time.

**Step 4**

View the Pivot Table

Now that the cohort pivot table is created, you can visualize it.

**Step 5**

Calculate Retention in Percentage

To better understand the retention rate, convert the pivot table values into percentages.

## Results/Findings

Here is the Dashboard: 

![The Dashboard](https://github.com/mayork230/Cohort-Analysis/blob/main/Dashboard%201(1).png)

The Cohort Analysis Dashboard provides a visual representation of customer retention rates over time.

The dashboard is divided into two sections: **Cohort Retention Rate** and **Cohort Table**.

Let's break down the insights from each part:

1. **Cohort Retention Rate**
- Cohort Period:

This represents the month when a cohort of customers made their first purchase.
- Cohort Index:

This represents the months since the first purchase (Cohort Index 1 is the first month, Index 2 is the second month, and so on).

- Retention Rates:

The percentage of customers from a cohort who returned in subsequent months.

**Observation:**

The retention rate starts at 100% for the first month as all customers in the cohort made a purchase in that month.

As time progresses, retention declines across all cohorts, with some showing sharper drops, while others have relatively steady retention patterns.

The 2010–12 cohort shows significant retention in later months, with a spike in the 12th month to 50%, while most cohorts after 2011–04 show a drop to less than 10% after 6 months.

2. **Cohort Table**

The Cohort Table shows the number of customers in each cohort, with the same cohort period and cohort index as the Retention Rate table. It provides the actual number of customers rather than percentages.

**Observation:**

For the 2010–12 cohort, the number of customers gradually decreases from *885* in the first month to *235* by the 13th month, showing steady retention.

Other cohorts, especially after 2011–04, experience a much sharper decline in customer numbers, with the number of retained customers dropping below 50 after 6 months for many cohorts.

**Recommendations**

Based on the findings from the cohort retention analysis, we recommend the following strategies:

**Improve Onboarding:**

The first month sees the highest drop-off. A more engaging onboarding experience, including personalized support and tutorials, could improve early retention.

**Re-engagement Campaigns:**

Cohorts from 2010-12 to 2011-02 show a retention boost in later months. Re-engagement campaigns targeting dormant users could help revitalize usage.

**Product Iteration:**

Analyzing user feedback and making iterative changes to product features could address the needs of users in lower-retention cohorts (e.g., those from mid-2011).

**Limitations**
Cohort analysis is primarily based on the timing of user acquisition or action. It does not account for other user characteristics such as demographics, preferences, or behavior patterns that may provide deeper insights into retention and engagement.










