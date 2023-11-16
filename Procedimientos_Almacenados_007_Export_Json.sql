use northwind

EXEC PA_ExportarJSON
Create Procedure PA_ExportarJSON
as
begin
    declare @jsondata NVARCHAR(MAX)
	select @jsondata = (
	select 
	  P.ProductID,
	  P.ProductName,
	  C.CategoryName
	  from Products P 
	  Join Categories C ON P.CategoryID=C.CategoryID
	  FOR JSON AUTO
  );
     PRINT @jsondata;
end;


