WITH
  purchases AS (
  SELECT
    InvoiceNo
    , date(InvoiceDate) as date
    , CustomerID
    , StockCode
    , UnitPrice
    , Quantity
  FROM
    `online-retail-rfm-cohort.online_retail.customer`
  WHERE
    Quantity > 0),
  returned AS (
  SELECT
    InvoiceNo
    , date(InvoiceDate) as date
    , CustomerID
    , StockCode
    , UnitPrice
    , Quantity
  FROM
    `online-retail-rfm-cohort.online_retail.customer`
  WHERE
    Quantity < 0)
SELECT
  p.InvoiceNo
  , p.date
  , r.InvoiceNo
  , r.date
  , p.CustomerID
  , p.StockCode
  , r.StockCode
  , p.UnitPrice
  , p.Quantity AS purchase_qty
  , r.Quantity AS returned_qty
FROM
  purchases p
LEFT JOIN
  returned r
ON
  p.CustomerID=r.CustomerID
  AND p.StockCode=r.StockCode
  AND p.UnitPrice=r.UnitPrice
WHERE
  r.Quantity IS NOT NULL
  AND ABS(r.Quantity) = p.Quantity;
