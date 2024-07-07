SELECT
  COUNT(*)
  , COUNT(InvoiceDate) AS InvoiceDate
  , COUNT(InvoiceNo) AS InvoiceNo
  , COUNT(StockCode) AS StockCode
  , COUNT(Description) AS Description
  , COUNT(Quantity) AS Quantity
  , COUNT(UnitPrice) AS UnitPrice
  , COUNT(CustomerID) AS CustomerID
  , COUNT(Age) AS Age
  , COUNT(Gender) AS Gender
  , COUNT(Income) AS Income
  , COUNT(Country) AS Country
FROM
  `online-retail-rfm-cohort.online_retail.customer`;
