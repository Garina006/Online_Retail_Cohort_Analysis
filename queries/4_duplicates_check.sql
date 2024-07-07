SELECT
  InvoiceDate
  , InvoiceNo
  , StockCode
  , Description
  , Quantity
  , UnitPrice
  , CustomerID
  , Income
  , COUNT(*) AS duplicates
FROM
  `online-retail-rfm-cohort.online_retail.customer`
GROUP BY
  InvoiceDate
  , InvoiceNo
  , StockCode
  , Description
  , Quantity
  , UnitPrice
  , CustomerID
  , Income
HAVING
  COUNT(*) > 1;
