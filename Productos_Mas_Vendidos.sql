--Productos mas vendidos por categoria
	--Productname,Categoryname,SUM(Quantity)

WITH ProductosMasVendidosxCategoria AS(	SELECT 		P.ProductName,		C.CategoryName,		SUM(OD.Quantity) AS Total,	    ROW_NUMBER() OVER (PARTITION BY C.CategoryName ORDER BY SUM(OD.Quantity) DESC) AS RowNum	FROM 	Products P	JOIN Categories C ON P.CategoryID = C.CategoryID	JOIN [Order Details] OD ON OD.ProductID = P.ProductID	GROUP BY C.CategoryName, P.ProductName)SELECT     ProductName,    CategoryName,    TotalFROM     ProductosMasVendidosxCategoriaWHERE     RowNum = 1;

--5 Clientes que mas han gastado


Select TOP 5
C.CustomerID,
C.ContactName,
SUM(od.Unitprice * od.Quantity) as total
from Customers c
INNER JOIN Orders o ON C.CustomerID=O.CustomerID
INNER JOIN [Order Details] od on O.OrderID=OD.OrderID
GROUP by C.CustomerID,C.ContactName 
ORDER BY total DESC