---Buscar productos cuyos nombres continen una secuencia

DECLARE @SecuenciaBusqueda nvarchar(50);
SET @SecuenciaBusqueda = 'Chef';
select 
  ProductID,
  ProductName
from Products
WHERE CHARINDEX(@SecuenciaBusqueda,ProductName)>0;


select ProductName
 from Products
  WHERE CHARINDEX(
     SUBSTRING(ProductName,1,LEN(ProductName)/2),
	 SUBSTRING(ProductName,LEN(ProductName)/2 +1 ,LEN(ProductName))
    )>0
  AND LEN(ProductName)>2

SELECT * FROM Products



   

