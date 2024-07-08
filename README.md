# Online_Retail_Cohort_Analysis

### Description:
Project Overview
This project focuses on analyzing key product metrics for buyers segmented into cohorts based on the date of their first order. A cohort refers to a group of users who share common characteristics such as their date of registration, first purchase, interests, and engagement channels. Cohort analysis involves tracking these groups over time to uncover patterns and understand recurring behaviors such as purchases, engagement levels, and spending amounts.

### Dataset and Data Preparation
The dataset used in this project spans over a period of 1 year. Prior to analysis, thorough data pre-validation and cleaning processes were performed to ensure data integrity and reliability.

### Key Metrics Calculated
The analysis includes the computation of several important metrics to assess product performance and user behavior:

- Monthly Active Customers (MAU)
- Monthly Purchase Count
- Monthly Usage Frequency
- Monthly Average Order Value (AOV)
- Monthly Revenue
- Cumulative Revenue
- Average Revenue Per User (ARPU)
- Lifetime Value (LTV)

### Technologies Used
The project utilizes the following technologies for data analysis and presentation:

- Google BigQuery: Used as the primary database for querying and analyzing large datasets efficiently.
- Jupyter Notebook: Employed for presenting analysis results in an interactive and readable format, leveraging its integration with Google BigQuery.
- SQL: Data analysis is predominantly conducted using SQL queries, leveraging its robust capabilities for dataset manipulation and aggregation.
- Python: Used for connecting to Google BigQuery, creating custom functions, and integrating data analysis workflows.

### Query Management and Execution
For enhanced readability and manageability of SQL queries, all queries are organized into separate .sql files within a dedicated "requests" folder. A decorator function, get_query, has been implemented to streamline query execution. This function reads SQL queries from files and passes them to a decorated select function, which executes the queries using the Google BigQuery client and returns the results as Pandas DataFrames.

This project aims to provide comprehensive insights into user behavior and product performance through rigorous cohort analysis and metric evaluation.

### Dataset:
[The dataset used in this project is available here](https://www.kaggle.com/datasets/bilalozgur/online-retail-rfm-and-cohort-analysis-customer-seg)

