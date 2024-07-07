DROP TABLE IF EXISTS `online-retail-rfm-cohort.online_retail.clean_customer`;
CREATE TABLE `online-retail-rfm-cohort.online_retail.clean_customer` AS
with temp AS
(SELECT
  DISTINCT *
  , DATE(InvoiceDate) as Date
  , CAST(CAST(CustomerID AS INT64) AS STRING) as Customer_ID
  , Quantity * UnitPrice AS Amount
FROM
  `online-retail-rfm-cohort.online_retail.customer`
WHERE CustomerID is NOT NULL
AND Quantity > 0
AND UnitPrice > 0),
temp1 AS (
    SELECT
        Date
        , InvoiceNo
        , StockCode
        , Description
        , Quantity
        , UnitPrice
        , Amount
        , Customer_ID
        , Age
        , Gender
        , Income
        , Country
        , CASE 
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2010-12-01') AND DATE('2010-12-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 1
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-01-01') AND DATE('2011-01-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 2
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-02-01') AND DATE('2011-02-28')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 3
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-03-01') AND DATE('2011-03-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 4
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-04-01') AND DATE('2011-04-30')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 5
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-05-01') AND DATE('2011-05-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 6
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-06-01') AND DATE('2011-06-30')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 7
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-07-01') AND DATE('2011-07-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 8
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-08-01') AND DATE('2011-08-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 9
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-09-01') AND DATE('2011-09-30')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 10
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-10-01') AND DATE('2011-10-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 11
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-11-01') AND DATE('2011-11-30')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 12
            WHEN MIN(Date) OVER (PARTITION BY Customer_ID) BETWEEN DATE('2011-12-01') AND DATE('2011-12-31')
            AND RANK() OVER (PARTITION BY Customer_ID ORDER BY Date) = 1 
            THEN 13
            ELSE 0 
            END as Cohort
    FROM temp
    ORDER BY Date),
temp2 AS (
    SELECT
    temp1.Cohort
    , temp1.Customer_ID
  FROM
    temp1
  WHERE
    temp1.Cohort != 0
  GROUP BY
    temp1.Cohort
    , temp1.Customer_ID )
SELECT
    Date
    , InvoiceNo
    , StockCode
    , Description
    , Quantity
    , UnitPrice
    , Amount
    , temp1.Customer_ID
    , Age
    , Gender
    , Income
    , Country
    , temp2.Cohort
FROM temp1
LEFT JOIN temp2 ON temp1.Customer_ID=temp2.Customer_ID
   ;
