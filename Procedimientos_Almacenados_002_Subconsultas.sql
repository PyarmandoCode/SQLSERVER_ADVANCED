/*1.-Obtener los productos por categoria */
CREATE PROCEDURE pa_ObtenerproductosporCategoria
  @CategoryName varchar(15) 
AS
 BEGIN
 select  ProductID, 
        ProductName, 
		SupplierID, 
		CategoryID, 
		QuantityPerUnit, 
		UnitPrice, 
		UnitsInStock, 
		UnitsOnOrder, 
		ReorderLevel, 
		Discontinued
from [dbo].[Products] WHERE CategoryID=(Select CategoryID FROM
  Categories where CategoryName=@CategoryName)
 END;


Exec pa_ObtenerproductosporCategoria 'Beverages'
