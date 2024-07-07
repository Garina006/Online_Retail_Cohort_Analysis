SELECT
  *
FROM
  `online-retail-rfm-cohort.online_retail.customer`
  WHERE InvoiceNo in ('539475', '554992')
  AND StockCode in ('21579', '22617')
UNION ALL
SELECT
  *
FROM
  `online-retail-rfm-cohort.online_retail.customer`
  WHERE InvoiceNo = 'C543290';
