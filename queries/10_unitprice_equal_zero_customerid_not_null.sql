SELECT
  *
FROM
  `online-retail-rfm-cohort.online_retail.customer`
  WHERE UnitPrice = 0 AND CustomerID is NOT NULL;
