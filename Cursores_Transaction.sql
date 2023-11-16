/*
Actualizar los precios de los producros aplicando un 10%
Almacenar los detalles de la actualizacion en una nueva tabla temporal
*/

Create Table ProductosActualizados(
   IDProducto int,
   Nombre NVARCHAR(50),
   PrecioAnterior Decimal(10,2),
   NuevoPrecio Decimal(10,2)
)

DELETE FROM ProductosActualizados
SELECT * FROM ProductosActualizados

--DECLARACION DE LAS VARIABLES
DECLARE @IDProducto INT
DECLARE @Nombre NVARCHAR(50)
DECLARE @PrecioAnterior DECIMAL(10,2)
DECLARE @NuevoPrecio DECIMAL(10,2)

--DECLARACION DEL CURSOR Y RECORRER LOS PRODUCTOS
DECLARE productos_cursor CURSOR FOR
SELECT [ProductID],[ProductName],[UnitPrice] FROM Products

BEGIN TRY
  BEGIN TRANSACTION
--Abrir el Cursor
	OPEN productos_cursor
	--Obtenemos el Primer registro 
	FETCH NEXT FROM productos_cursor INTO @IDProducto,@Nombre,@PrecioAnterior
	--Recorrer el cursor mientras haya registros
	WHILE @@FETCH_STATUS =0
		BEGIN
			SET @NuevoPrecio =@PrecioAnterior *1.1

			--Actualizar la tabla products
			UPDATE Products set UnitPrice=@NuevoPrecio WHERE ProductID=@IDProducto

			--Insertar los detalles actualizados en la tabla temporal
			INSERT INTO ProductosActualizados(IDProducto,Nombre,PrecioAnterior,
			NuevoPrecio)
			VALUES(@IDProducto,@Nombre,@PrecioAnterior,@NuevoPrecio)
			--Obtener el Siguiente registro
			FETCH NEXT FROM productos_cursor INTO @IDProducto,@Nombre,@PrecioAnterior
		END
--Cerrar y Liberamos recursos del cursor
CLOSE productos_cursor
DEALLOCATE productos_cursor
--Si todas las transacciones son exitosas
COMMIT TRANSACTION
END TRY
BEGIN CATCH
 --EN CASO DE ERROR REVERTIR LA TRANSACCION
   IF @@TRANCOUNT>0
      ROLLBACK TRANSACTION
   --MOSTRAR INFORMACION DEL ERROR
      SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

SELECT * FROM ProductosActualizados
select * from Products

