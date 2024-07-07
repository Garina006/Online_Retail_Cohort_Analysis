WITH MonthlyData AS (
SELECT 
    Cohort
    , COUNT(DISTINCT Customer_ID) AS num_customers
    , DATE_TRUNC(Date, MONTH) AS first_day_of_month
    , COUNT(DISTINCT InvoiceNo) AS num_sales
    , ROUND(AVG(Amount), 2) AS avg_check
FROM
    `online-retail-rfm-cohort.online_retail.clean_customer` 
GROUP BY 
    Cohort
    , first_day_of_month
),
Resume AS (
SELECT 
  Cohort
  , FORMAT_DATE('%Y_%m', first_day_of_month) AS formatted_first_day_of_month
  , ROUND(SUM(avg_check * num_customers) OVER (PARTITION BY Cohort ORDER BY first_day_of_month) / 
      FIRST_VALUE(num_customers) OVER (PARTITION BY Cohort ORDER BY first_day_of_month) * 
      num_sales / num_customers, 2) AS ltv
FROM
  MonthlyData
ORDER BY
  formatted_first_day_of_month
)
SELECT
  *
FROM
  Resume
PIVOT (
  SUM(ltv) FOR formatted_first_day_of_month IN (
    '2010_12', '2011_01', '2011_02', 
    '2011_03', '2011_04', '2011_05',
    '2011_06', '2011_07', '2011_08',
    '2011_09', '2011_10', '2011_11',
    '2011_12'
  )
)
ORDER BY Cohort;

