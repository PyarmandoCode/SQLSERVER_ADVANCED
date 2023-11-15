/*6-Crear Una Transaccion
	a.-Creacion de un Nuevo Pedido
	b.-Actualizacion de las Cantidades
	c.-Insercion de Registros en las tablas relacionadas
*/
Alter Procedure pa_CrearNuevoPedido
   @CustomerID VARCHAR(10),
   @ProductID INT,
   @Quantity INT,
   @UnitPrice MONEY
as
   BEGIN
    --Iniciar la Transaccion
	BEGIN TRANSACTION
	 BEGIN TRY
	  --Insertar Un Nuevo Pedido
		  INSERT INTO Orders(CustomerID,OrderDate)
		  VALUES (@CustomerID,GETDATE());
	  --Obtener el ID del Ultimo Pedido Insertado
		  DECLARE @OrderID INT;
		  SET @OrderID=SCOPE_IDENTITY();
	  --Insertar los detalles del pedido
		  INSERT INTO [Order Details] ([OrderID],[ProductID],
		  [Quantity],[UnitPrice])
		  VALUES(@OrderID,@ProductID, @Quantity,@UnitPrice);
	  --Actualizar las cantidades de productos
		  UPDATE Products
		  SET UnitsInStock=UnitsInStock-@Quantity
		  WHERE ProductID=@ProductID; 
      --Confirma la Transaccion 
		  COMMIT;
      END TRY 
	  BEGIN CATCH
	       --Revertir la transaccion en caso de un error
		   ROLLBACK;
		   --PROPAGAS EL ERROR personalizas
			--THROW 50001, 'Este es un error personalizado',1;
           --Manejar el Error
		    SELECT ERROR_MESSAGE() AS ErrorMessage; 
      END CATCH;
   END;

--Ejecutar el Store Procedure
EXEC pa_CrearNuevoPedido 
     @CustomerID='CHOPS',
	 @ProductID=2,
	 @Quantity=2,
	 @UnitPrice=12.00;

--Query Testin QA

SELECT * FROM ORDERS O 
	INNER JOIN [dbo].[Order Details] OD ON O.[OrderID]=OD.OrderID
	INNER JOIN [dbo].[Products] P ON OD.ProductID=P.ProductID
WHERE O.CustomerID='CHOPS' AND P.ProductID=2
