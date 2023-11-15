/*7.-Crear un Pivot para totalizar las ventas 
por categoria y año */

CREATE TABLE #PivotData
 (
    CategoryName varchar(50),
	Year INT,
	TotalSales MONEY
 );
 INSERT INTO #PivotData (CategoryName,Year,TotalSales)
 SELECT 
     c.CategoryName, 
	 YEAR(o.OrderDate) as Year ,
	 SUM(od.Quantity * (od.Unitprice - od.Discount )) as TotalSales
   FROM Orders O
   JOIN [Order Details] od on o.OrderID=od.OrderID
   JOIN Products p on od.ProductID = p.ProductID
   JOIN Categories c on p.CategoryID = C.CategoryID
   WHERE 
    O.OrderDate is not null
   GROUP BY
    c.Categoryname,YEAR(o.OrderDate)

--Realizar la operacion Pivot
Select
  *
FROM (SELECT Categoryname,Year,Totalsales FROM #PivotData) as SourceTable

PIVOT
 (
  sum(Totalsales)
  FOR Year in ([1996],[1997],[1998])
 )as PivotTable

 --Eliminar Tabla temporal
 DROP TABLE #PivotData