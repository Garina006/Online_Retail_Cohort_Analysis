SELECT
  min(InvoiceDate) as min_date
  , max(InvoiceDate) as max_date
  , min(Quantity) as min_qty
  , max(Quantity) as max_qty
  , min(UnitPrice) as min_price
  , max(UnitPrice) as max_price
  , min(Income) as min_income
  , max(Income) as max_income
FROM
  `online-retail-rfm-cohort.online_retail.customer`;
