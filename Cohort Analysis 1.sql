
-- Created a new temporary table from the Online Retail
-- Where CustomerID is not null
-- Where Quantity and Unit Price is positive
-- Removed Duplicate Records from the table
with cte as 
							(select * from dbo.[Online Retail] where CustomerID is not null),	
				cte1 as (select * from cte where Quantity>0 and UnitPrice>0),	
				cte2 as (select *, ROW_NUMBER() over (partition by InvoiceNo, StockCode, Quantity order by InvoiceDate) as dupl_check from cte1)
				select * into #online_retail_main from cte2 where dupl_check=1;
-- 392,669 are the cleaned rows


-- Clean Date
--Begin Cohort Analysis
--My main Table
select * from #online_retail_main;

-- Unique Identifier(Customer ID)
-- Initial Start date (First Invoice Date)
-- Created a new column Cohort Date where I extracted Year,Month from the first date of purchase
 
Select CustomerID,
						MIN(InvoiceDate) as first_purchase_date,
						DATEFROMPARTS(YEAR(MIN(InvoiceDate)),
						MONTH(MIN(InvoiceDate)),1) Cohort_Date into #Cohort from #online_retail_main group by CustomerID;

-- Cohort with CustomerID, first_purchase_date, Cohort_Date
select * from #Cohort order by first_purchase_date;

-- Create Cohort Index
-- Join #Online_retail_main and #Cohort 
-- Created new column Year_Diff where I subtracted  Cohort year from Invoice year
-- Created new column Month_Diff where I subtracted Cohort month from Invoice month
-- Created new column Cohort_Index 
-- 1 is added to make the first event of the cohort start at index 1 rather than 0.

with mm as 
				(select m.*, c.Cohort_Date,
								YEAR(m.InvoiceDate) Invoice_year,
								MONTH(m.InvoiceDate) Invoice_month,
								YEAR(c.Cohort_Date) cohort_year,
								MONTH(c.Cohort_Date) cohort_month from #online_retail_main m
left join #Cohort c
							on m.CustomerID = c.CustomerID)
,mmm as
				(select mm.*, year_diff = Invoice_year-cohort_year, Month_Diff = Invoice_month - cohort_month from mm)
				select mmm.*,Cohort_Index = (year_diff * 12) + (month_diff) + 1into #Cohort_Retention from mmm;

-- Created new Temporary table Cohort Retention
select * from #Cohort_Retention;

-- To show the distinct CustomerID, Cohort Date and Cohort Index
select distinct CustomerID,Cohort_Date,Cohort_Index from #Cohort_Retention;

-- To show the distinct Cohort Index
select distinct Cohort_Index from #Cohort_Retention order by Cohort_Index;

-- Grouping Customers by Cohort Index
-- Pivot Data to group customers by their Cohort Index and count the number of customers in each cohort over time

-- To get the distinct Cohort_Index
select distinct Cohort_Index from #Cohort_Retention order by Cohort_Index

with cte as (
select distinct CustomerID,Cohort_Date,Cohort_Index from #Cohort_Retention)
select * into #Cohort_Pivot from cte pivot(count(CustomerID) for Cohort_Index in ([1],
		[2],
		[3],
		[4],
		[5],
		[6],
		[7],
		[8],
		[9],
		[10],
		[11],
		[12],
		[13] ) )
		as Pivot_Table;

-- Created temporary table for #Cohort_Pivot
select * from #Cohort_Pivot order by Cohort_Date;

-- To get the Cohort Index pivot in percentage
		select Cohort_Date,
			1.0*[1]/[1]*100 as [1],	
			1.0*[2]/[1]*100 as [2],
			1.0*[3]/[1]*100 as [3],
			1.0*[4]/[1]*100 as [4],
			1.0*[5]/[1]*100 as [5],
			1.0*[6]/[1]*100 as [6],
			1.0*[7]/[1]*100 as [7],
			1.0*[8]/[1]*100 as [8],
			1.0*[9]/[1]*100 as [9],
			1.0*[10]/[1]*100 as [10],
			1.0*[11]/[1]*100 as [11],
			1.0*[12]/[1]*100 as [12]
from #Cohor_Pivot order by Cohort_Date;