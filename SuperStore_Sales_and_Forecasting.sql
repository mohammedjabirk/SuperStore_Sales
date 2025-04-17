create database Project1;

select * from superstore_sales_and_forecasting;
DESCRIBE superstore_sales_and_forecasting;
SELECT * FROM superstore_sales_and_forecasting LIMIT 10;
SELECT COUNT(*) FROM superstore_sales_and_forecasting;

-- Total Sales per Region
SELECT Region, SUM(Sales) AS Total_Sales FROM superstore_sales_and_forecasting
GROUP BY Region ORDER BY Total_Sales DESC;

-- Top 5 Best-Selling Products
SELECT Product_Name, SUM(Sales) AS Total_Sales FROM superstore_sales_and_forecasting
GROUP BY Product_Name ORDER BY Total_Sales DESC LIMIT 5;

-- Customer Segmentation by Revenue
SELECT Segment, SUM(Sales) AS Total_Revenue FROM superstore_sales_and_forecasting
GROUP BY Segment ORDER BY Total_Revenue DESC;

-- Overall Profit
SELECT SUM(Sales) AS TOTAL_SALES FROM superstore_sales_and_forecasting; 

-- Top 5 customers based on sales
SELECT Customer_Name, SUM(Sales) AS Total_Sales FROM superstore_sales_and_forecasting 
GROUP BY Customer_Name ORDER BY Total_Sales DESC LIMIT 5;

-- Change Order_Date and Ship_Date to DATE format
ALTER TABLE superstore_sales_and_forecasting MODIFY COLUMN Order_Date DATE, MODIFY COLUMN Ship_Date DATE;

-- Updating Order_Date and Ship_Date to proper DATE format
UPDATE superstore_sales_and_forecasting  
SET Order_Date = STR_TO_DATE(Order_Date, '%d/%m/%Y'),
Ship_Date = STR_TO_DATE(Ship_Date, '%d/%m/%Y');

-- Summarize monthly sales in chronological order
SELECT YEAR(Order_Date) AS Year, MONTHNAME(Order_Date) AS Month, MONTH(Order_Date) AS Month_Number,
SUM(Sales) AS Monthly_Sales FROM superstore_sales_and_forecasting GROUP BY Year, Month, Month_Number ORDER BY Year, Month_Number;

-- Get the customer with the highest total sales 
SELECT Customer_Name, SUM(Sales) AS Total_Sales FROM superstore_sales_and_forecasting
GROUP BY Customer_Name ORDER BY Total_Sales DESC LIMIT 1;

-- Add a new column for Profit if it doesn't exist
ALTER TABLE superstore_sales_and_forecasting 
ADD COLUMN Profit DECIMAL(10,2);




