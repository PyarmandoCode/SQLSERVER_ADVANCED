--Productos mas vendidos por categoria
	--Productname,Categoryname,SUM(Quantity)

WITH ProductosMasVendidosxCategoria AS(

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