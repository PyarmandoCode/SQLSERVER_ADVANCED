/* Uso de Funciones Estadisticas*/
use northwind
/*1.-Contar la cantidad de productos por categoria*/

Select 
C.CategoryName,COUNT(P.ProductID) as TotalProducts
from Categories C
join Products P on C.CategoryID = P.CategoryID
GROUP BY C.CategoryName

/*2.-Calcular el promedio de precios de productos por proveedor*/
Select SupplierID,Avg(UnitPrice) as PromPrecios
from Products
GROUP BY SupplierID

/*Encontrar el producto mas caro y el mas barato*/
Select TOP 1 ProductName,UnitPrice 
from Products
ORDER BY UnitPrice DESC --Producto Mas Caro

Select TOP 1 ProductName,UnitPrice 
from Products
ORDER BY UnitPrice --Producto Mas Barato

/*Calcular la suma total de ventas por cliente */
Select C.CustomerID,C.ContactName,
SUM(OD.Quantity*OD.UnitPrice) AS TOTALSALES
From Customers C
Join Orders O ON C.CustomerID=O.CustomerID
Join [Order Details] OD ON O.OrderID=OD.OrderID
GROUP BY C.CustomerID,C.ContactName
ORDER BY C.CustomerID

/*Determinar el porcentaje de productos en stock por categoria*/
SELECT C.CategoryName,
 COUNT(P.ProductID) AS TotalProducto,
 SUM(CASE WHEN P.UnitsInStock >0 THEN 1 ELSE 0 END) AS ProductsInstock,
(SUM(CASE WHEN P.UnitsInStock >0 THEN 1 ELSE 0 END) *100.0) / COUNT(P.Productid) 
 as PorcentajeinStock
   FROM Categories C
   JOIN Products P ON C.CategoryID=P.CategoryID
   GROUP BY C.CategoryName


