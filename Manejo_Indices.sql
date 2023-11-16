/*1.-Crear un indice no agrupado en la columna 
Customerid de la tabla customers
*/
CREATE INDEX IX_Customers_Customerid
on Customers(Customerid);

CREATE INDEX IX_Customers_Country
on Customers(Country);


--Consulta utilizando el indice para buscar clientes por un pais 
--especifico

Select CustomerID,ContactName,Country
from Customers
where Country= 'Usa';

--Indice Agrupado en la tabla Clientes en la  columan fecha
DROP TABLE  CLIENTES

CREATE TABLE Clientes(
 ClienteID INT,
 NOMBRE VARCHAR(100),
 APELLIDO VARCHAR(100),
 FECHAREGISTRO DATE);

CREATE CLUSTERED INDEX IX_FechaRegistro 
ON Clientes(FECHAREGISTRO);

ClienteID | Nombre   | Apellido | FechaRegistro
----------------------------------------------
1         | Juan     | Pérez    | 2022-01-15
2         | María    | Gómez    | 2022-02-20
3         | Carlos   | Rodríguez| 2022-01-30

ClienteID | Nombre   | Apellido | FechaRegistro
----------------------------------------------
1         | Juan     | Pérez    | 2022-01-15
3         | Carlos   | Rodríguez| 2022-01-30
2         | María    | Gómez    | 2022-02-20

ALTER DATABASE SCOPED CONFIGURATION SET AUTOMATIC_TUNING
(FORCE_LAST_GOOD_PLAN =ON)



