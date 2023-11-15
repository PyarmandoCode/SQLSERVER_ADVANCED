/*2.-Obtener el total de pedidos por cliente */
ALTER PROCEDURE pa_obtenertotalpedidosporcliente
--Procedimiento almacenado que devuelve los pedidos de clientes
/*
Este Procedimiento se ejecuta desde un Job desde el agente de sql server
que esta en el servidor de desarrollo --lo utiliza el area de QA
*/
@CustomerId VARCHAR(5),
@TotalPedidos INT OUTPUT
AS
BEGIN
 SELECT @TotalPedidos =COUNT(OrderID)
 FROM Orders
 where customerid=@CustomerId;
END;

DECLARE @TotalPedidosCliente INT; --APP
EXEC pa_obtenertotalpedidosporcliente @customerid='ANTON' , 
  @TotalPedidos=@TotalPedidosCliente OUTPUT;
PRINT 'Total de pedidos para el cliente ANTON:' + 
  CAST(@TotalPedidosCliente AS VARCHAR(5));

sp_helptext 'pa_obtenertotalpedidosporcliente'