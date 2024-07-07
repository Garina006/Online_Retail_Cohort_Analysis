with temp as
(SELECT
  *
FROM
  `online-retail-rfm-cohort.online_retail.customer`
WHERE
  UnitPrice = 0 and CustomerID is not NULL)
select
  c.InvoiceDate
  , c.StockCode
  , c.UnitPrice
  , temp.InvoiceDate
  , temp.StockCode
  , temp.UnitPrice
from `online-retail-rfm-cohort.online_retail.customer` c
left join temp on c.StockCode=temp.StockCode
where c.StockCode in (select distinct StockCode from temp)
and date(c.InvoiceDate)=date(temp.InvoiceDate)
and c.UnitPrice != 0
order by c.StockCode;
