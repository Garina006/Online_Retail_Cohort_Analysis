SELECT
  DISTINCT CustomerID
FROM
  `online-retail-rfm-cohort.online_retail.customer`
WHERE
  InvoiceNo IN (
  SELECT
    InvoiceNo
  FROM
    `online-retail-rfm-cohort.online_retail.customer`
  WHERE
    CustomerID IS NULL);
