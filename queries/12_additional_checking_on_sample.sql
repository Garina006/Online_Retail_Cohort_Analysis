SELECT
  InvoiceDate
  , StockCode
  , UnitPrice
FROM
  `online-retail-rfm-cohort.online_retail.customer`
WHERE StockCode = '22423'
order by InvoiceDate;
