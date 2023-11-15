 /*3.-Crear un PA que intente eliminar un pedido de la tabla orders*/
 CREATE PROCEDURE PA_ELIMINARPEDIDO
   @ORDER INT
AS
BEGIN
   BEGIN TRY
	   --Intentar eliminar el pedido
	   DELETE FROM Orders WHERE OrderID=@ORDER
	   PRINT 'PEDIDO ELIMINADO CORRECTAMENTE';
   END TRY
   BEGIN CATCH
       --MANEJO DE ERRORES
	   PRINT 'Error al eliminar el pedido . Detalles ' +ERROR_MESSAGE();
   END CATCH
END;
EXEC PA_ELIMINARPEDIDO 10248;