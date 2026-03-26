-- QUERIES TO EXPLORE DATASET

select * from stg_Churn

 
-- 1.  SHOW TOTAL ROWS & COLS IN DATA

select
     (select count (*) from stg_Churn) as rows,
     (select count (*) from INFORMATION_SCHEMA.columns where TABLE_NAME= 'stg_Churn')as columns;

-- 2.  GENDER CONTRIBUTION

select Gender, count(Gender)as TotalCount,
      round((count(Gender) * 100.0 / (select count(*) from stg_Churn)),2) as Percentage
from stg_Churn
group by Gender;

-- 3.  FOR CONTRACT COLUMN

select Contract, count(Contract)as TotalCount,
      round((count(Contract)*100.0 / (select count(*) from stg_Churn)),2)as Percentage
from stg_Churn
group by Contract;

-- 4.  CUSTOMER_STATUS COLUMNS

select Customer_Status, count(Customer_Status)as TotalCount,
       round((count(Customer_Status)*100.0 /(select count(*) from stg_Churn)),0)as Status_Percentage,
       round(sum(Total_Revenue),2) as TotalRev,
       round((sum(Total_Revenue)*100 / (select sum(Total_Revenue) from stg_Churn)),2) as Rev_Percentage
from stg_Churn
group by Customer_Status;

-- 5.   STATE CONTRIBUTION

select State, count(State)as TotalCount,
       round((count(State)*100.0 / (select count(*) from stg_Churn)),2) as Percentage
from stg_Churn
group by State
order by Percentage Desc;

-- 6.  COLUMN CONTAINS HOW MANY DIFFERENT ITEMS?

 select distinct Internet_Type 
 from stg_Churn;

