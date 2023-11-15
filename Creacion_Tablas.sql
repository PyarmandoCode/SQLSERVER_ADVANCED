create database empresadb
use empresadb
/* Crear un objeto de BD Tabla */

Create Table Clientes (
     ClienteId INT Primary key,
	 NombreCliente VARCHAR(100),
	 EmailCliente VARCHAR(150)
   );

Insert Into Clientes(ClienteId,NombreCliente,EmailCliente)
Values 
   (1,'Armando','aruiz@gmail.com'),
   (2,'Oscar','oscar@gmail.com'),
   (3,'Maria','maria@gmail.com'),
   (4,'Pedro','pedro@gmail.com'),
   (5,'Monica','monica@gmail.com')

select * from Clientes

Create Table  Productos (
    ProductoId INT Primary Key,
	NombreProducto Varchar(100),
	Precio Decimal (10,2)
);

Insert Into Productos(ProductoId,NombreProducto,Precio)
Values 
   (1,'Laptop',1200.90),
   (2,'USB',21.20),
   (3,'Teclado',32.00),
   (4,'Monitor',70.90),
   (5,'Parlante',24.81)

select * from productos;

Create Table Pedidos (
   PedidoID INT Primary Key,
   ClienteId INT,
   FechaPedido DATE,
   FOREIGN KEY (ClienteId) REFERENCES Clientes(ClienteId),
 );

Insert Into Pedidos(PedidoID,ClienteId,FechaPedido)
Values 
   (1091,6,'2023-11-13'),
   (1092,1,'2023-11-13'),
   (1093,2,'2023-11-14'),
   (1094,2,'2023-11-14'),
   (1095,2,'2023-11-15'),
   (1096,3,'2023-11-15'),
   (1097,3,'2023-11-16'),
   (1098,4,'2023-12-13')
 
select * from Pedidos

Create Table Detalle_Pedidos(
   DetalleID INT PRIMARY KEY,
   PedidoID INT,
   ProductoId INT,
   Cantidad INT,
   FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
   FOREIGN KEY (ProductoId) REFERENCES Productos(ProductoId))

Insert Into Detalle_Pedidos(DetalleID,PedidoID,ProductoId,Cantidad)
Values 
   (101,1091,1,1),
   (102,1091,2,3),
   (103,1091,3,2),
   (104,1091,4,1),
   (105,1092,1,4),
   (106,1092,2,4),
   (107,1092,3,2),
   (108,1092,4,1),
   (109,1093,1,1),
   (110,1093,2,3),
   (111,1094,3,2),
   (112,1094,4,1),
   (113,1095,1,4),
   (114,1095,2,4),
   (115,1096,3,2),
   (116,1097,4,1),
   (117,1098,5,1),
   (118,1098,5,1)

select * from  Detalle_Pedidos;

/*Finalizar el proceso de la data */
   
/*Ver las tablas de tu bd activa */
select name from sys.tables;

Select * from Clientes;
/*Estructuctura de mi tabla*/
Exec sp_columns 'Clientes';

Select 
 COLUMN_NAME,
 DATA_TYPE,
 CHARACTER_MAXIMUM_LENGTH,
 IS_NULLABLE
 from INFORMATION_SCHEMA.COLUMNS


 