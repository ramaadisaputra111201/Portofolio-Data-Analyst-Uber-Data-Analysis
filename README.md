# Portofolio-Data-Analyst-Uber-Data-Analysis
Uber Ride Data Analysis Project

Project Overview
Uber is a technology company that provides on-demand transportation services through its app. As a leader in the ride-hailing industry, efficiency and travel experience are key operational focuses. 

The data analysis will be conducted as follows:
1. Describing general travel patterns using metrics such as total trips, daily average, duration, and distance traveled, based on user category and day of the week (weekday/weekend).
2. Identifying peak hours to understand service demand patterns.
3. Evaluating travel efficiency based on average speed to identify potential bottlenecks and congestion.

Files in the Project
UberDatasetCleaned.csv: The cleaned dataset after preprocessing.
Dashboard.png: An image file showing the dashboard visualizing the analysis results.


Analysis Steps :
1. Loading the Dataset:
Loaded the Uber dataset from a CSV file and displayed the first 10 rows to understand its structure.

2.Basic Data Exploration:
Generated summary statistics, concise data summary, checked for missing values, duplicate rows, and unique values in each column.

3.Handling Missing Values:
Filled missing values in the 'PURPOSE' column using forward fill method.

4. Converting Date Columns:
Converted 'START_DATE' and 'END_DATE' columns to datetime format.

5.Extracting Date and Time Components:
Extracted date, time, month, and year from 'START_DATE' and 'END_DATE' columns and added these as new columns.

6. Dropping Original Date Columns:
Dropped 'START_DATE' and 'END_DATE' columns and rearranged the remaining columns.

7. Handling Missing Values in 'Month' and 'Year' Columns:
Filled missing values in the 'month' and 'year' columns using the mode and converted them to integer type.

8. Extracting Hour and Minute Components:
Extracted hours and minutes from 'start_time' and 'end_time' columns and added them as new columns.

9. Calculating Duration:
Calculated the duration of each trip in minutes and added it as a new column.

10. Plotting Data:
Visualized the data using various plots like heatmap for correlations, count plots, bar plots, and distribution plots to understand the patterns and distributions in the data.

11. Saving Cleaned Data:
Saved the cleaned and processed DataFrame to a new CSV file.


<img width="405" height="237" alt="image" src="https://github.com/user-attachments/assets/551f4ca5-013c-4cd8-ab32-67e9e98523ad" />

Travel Patterns by Category:

<img width="273" height="144" alt="image" src="https://github.com/user-attachments/assets/ade60b82-5f58-49fc-bac2-86bb68d0eb22" /> <img width="508" height="178" alt="image" src="https://github.com/user-attachments/assets/f8459634-09c2-4b02-a68d-8154932de40e" />




1. Uber trips are dominated by the Business category, accounting for 93% of total trips.
2. The average distance and duration of trips are longer during weekends, especially for personal trips, with an average distance of 44.5 km and an average duration of 31.7 minutes.

Action Items for Bussiness Insight:
1. Maximize campaigns targeting Business customers by offering exclusive business membership programs.
2. Develop weekend personal trip packages, such as round-trip deals or discounts for long-distance travel.
3. Cross-selling premium services: for personal trips on weekends that are long distance and duration

















Dashboard Insights
The dashboard visualizes key insights from the analysis:
1. Count of CATEGORY by CATEGORY: Shows the distribution of rides by business and personal categories.
2. Count of Month by Month: Displays the number of rides each month.
3. Count of Month and Sum of MILES by Month: Combines the count of rides and the total miles traveled each month.
4. Count of Day by Day: Shows the distribution of rides across different days of the week.
5. Count of PURPOSE by PURPOSE and CATEGORY: Displays the purpose of rides and categorizes them by business and personal use.
6. Sum of MILES by Day Time: Shows the total miles traveled during different times of the day.

Recommendations
Based on the analysis, the following recommendations are made:
1. Optimize Ride Allocation During Peak Months.
2. Target Marketing Campaigns by Purpose.
3. Improve Services During Peak Hours.
4. Monitor and Reduce Trip Duration.
5. Enhance Services in High-Demand Categories.
6. Seasonal Promotions.
7. Analyze High-Mileage Trips.
8. Focus on Popular Routes and Destinations.
9. Customer Feedback Integration.
10. Driver Training Programs.
By implementing these recommendations, Uber can enhance its operational efficiency, improve customer satisfaction, and increase overall ridership.
