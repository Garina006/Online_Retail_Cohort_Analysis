SELECT
    CAST(Cohort AS STRING) AS Cohort
    , COUNT(DISTINCT Customer_ID) as num_customers
FROM online-retail-rfm-cohort.online_retail.clean_customer
GROUP BY Cohort

UNION ALL

SELECT
    'Total' AS Cohort,
    COUNT(DISTINCT Customer_ID) AS num_customers
FROM online-retail-rfm-cohort.online_retail.clean_customer

ORDER BY Cohort;
