--Crear una FUNCION ESCALAR (FDU) calcular el descuento
--total por pedido

CREATE FUNCTION FNC_CALCULO_DES(@ORDERid INT)
RETURNS DECIMAL(10,2)
AS
 BEGIN
   DECLARE @DescuentoTotal DECIMAL(10,2);
   SELECT @DescuentoTotal =SUM(UnitPrice *Quantity * (1 - Discount))
      FROM [Order Details]
	  WHERE OrderID=@ORDERid
	  RETURN @DescuentoTotal
 END;
 
 --Reutilizar la Funcion
 SELECT OrderID, dbo.FNC_CALCULO_DES(OrderID) as DescuentoTotal
 FROM Orders


