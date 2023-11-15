/*Como Utilizar IF */

IF (SELECT COUNT(*) FROM Products WHERE UnitsInStock>50)>0
    SELECT ProductName,UnitsInStock ,'Stock Insuficiente' as StockStatus
	FROM Products 
	WHERE UnitsInStock>50;
ELSE
    SELECT ProductName,UnitsInStock,'Stock Bajo' as StockStatus
	FROM Products
	WHERE UnitsInStock <=50;

/*Utilizar CASE WHEN */
SELECT
  ProductName,
  UnitsInStock,
  CASE 
     WHEN UnitsInStock >50 THEN 'STOCK INSUFICIENTE'
	 ELSE 'STOCK BAJO'
  END AS StockStatus
  FROM Products

select * from products where ProductName='Tunnbröd'
update products set UnitsInStock=10 where ProductID=23