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

2. Basic Data Exploration:
Generated summary statistics, concise data summary, checked for missing values, duplicate rows, and unique values in each column.

3. Handling Missing Values:
Filled missing values in the 'PURPOSE' column using forward fill method.

4. Converting Date Columns:
Converted 'START_DATE' and 'END_DATE' columns to datetime format.

5. Extracting Date and Time Components:
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


**Exploratoty Data Analysis :**

**Travel Patterns by Category :**

<img width="273" height="188" alt="image" src="https://github.com/user-attachments/assets/ade60b82-5f58-49fc-bac2-86bb68d0eb22" /> <img width="508" height="178" alt="image" src="https://github.com/user-attachments/assets/f8459634-09c2-4b02-a68d-8154932de40e" />

1. Uber trips are dominated by the Business category, accounting for 93% of total trips.
2. The average distance and duration of trips are longer during weekends, especially for personal trips, with an average distance of 44.5 km and an average duration of 31.7 minutes.

**Action Items for Bussiness Insight:**
1. Maximize campaigns targeting Business customers by offering exclusive business membership programs.
2. Develop weekend personal trip packages, such as round-trip deals or discounts for long-distance travel.
3. Cross-selling premium services: for personal trips on weekends that are long distance and duration


**Peak Hours :**

<img width="318" height="183" alt="image" src="https://github.com/user-attachments/assets/64408672-224c-4c8b-b0a9-2f1eaf8f6344" />  <img width="318" height="183" alt="image" src="https://github.com/user-attachments/assets/4f07e94f-4170-497d-8830-df446cdf7c04" />  <img width="262" height="183" alt="image" src="https://github.com/user-attachments/assets/3fa17a6a-b832-4fa6-9314-55f7da7aaab2" />

1. On weekdays, peak hours occur between 11:00 AM and 3:00 PM, peaking at 1:00 PM, mainly due to lunch breaks, meetings, and business trips.
2. On weekends, peak hours occur around 2:00 PM and 6:00 PM.
3. Of all days, Friday at 11:00 and 13:00 recorded the highest totals.

**Action Items for Bussiness Insight : **
1. For drivers: Provide bonus points or incentives for those active during peak hours.
2. For pricing: Offer discounts before peak hours to balance demand or increase fares during peak times to regulate trip requests.

**Trip Efficiency :**

<img width="256" height="230" alt="image" src="https://github.com/user-attachments/assets/de609762-3af7-4084-ab68-8c4acf3d31c9" />  <img width="256" height="230" alt="image" src="https://github.com/user-attachments/assets/8fb078b2-983e-4a7a-a277-657858250246" />

Weekdays                                                                                                                            Weekends  
<img width="462" height="129" alt="image" src="https://github.com/user-attachments/assets/26f920f2-3f5b-42d7-a267-bf1067903595" />  <img width="462" height="129" alt="image" src="https://github.com/user-attachments/assets/8dc24196-748b-489e-a3d7-ace660d34652" />
<img width="476" height="62" alt="image" src="https://github.com/user-attachments/assets/48b7ea3b-3d1b-4ca0-94ad-f05d66507085" />   <img width="476" height="62" alt="image" src="https://github.com/user-attachments/assets/68c445da-0a50-43d4-bb8a-113e1b18d2b6" />

1. Weekdays and weekends are both predominantly efficient (73%), but weekdays are slightly less efficient (9.2% vs 7.2%).
2. Weekends have a higher proportion of moderate-efficiency trips (19.8% compared to 18.4% on weekdays).
3. Overall, the efficiency pattern remains relatively stable across both day categories.
4. On weekdays, the highest inefficiency occurs at 13:00 (14.8%) and 16:00 (17.4%), which aligns with peak hours (lunch time and end of workday). The most common destinations are Temporary Sites and Meals/Entertainment, indicating that business-related trips during busy hours are more prone to congestion.
5. On weekends, inefficiency peaks at 13:00 (23.1%) and 15:00 (14.8%) and is dominated by Errand/Supplies and Meeting trips, suggesting that even though leisure trips increase, business-related travel remains high and becomes a source of inefficient trips.
