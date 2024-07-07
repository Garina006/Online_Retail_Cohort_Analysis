WITH data AS (
SELECT 
    Cohort
    , FORMAT_DATE('%Y_%m', DATE_TRUNC(Date, MONTH)) AS first_day_of_month
    , COUNT(DISTINCT InvoiceNo) AS num_sales
FROM
    `online-retail-rfm-cohort.online_retail.clean_customer`
GROUP BY 
    Cohort
    , first_day_of_month
ORDER BY
    first_day_of_month
)
SELECT
  *
FROM
  data
PIVOT (
  SUM(num_sales) FOR first_day_of_month IN (
    '2010_12', '2011_01', '2011_02', 
    '2011_03', '2011_04', '2011_05',
    '2011_06', '2011_07', '2011_08',
    '2011_09', '2011_10', '2011_11',
    '2011_12'
  )
)
ORDER BY Cohort;
