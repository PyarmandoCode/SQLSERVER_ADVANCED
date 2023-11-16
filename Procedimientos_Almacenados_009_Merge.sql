/*
Merge -- Es Una Instruccion en SQL SERVER que combina las operaciones de
INSERT,UPDATE Y DELETE en una sola declaracion
permitiendo comparar datos de uan tabla origen a una destino 
y aplicar condiciones para sincronizar datos

ETL(Extract,Trasform,Load)

SINTAXIS:
 

*/

MERGE INTO TablaDestino AS destino
USING TablaOrigen AS origen
ON destino.ID = origen.ID
WHEN MATCHED THEN
    UPDATE SET destino.Columna = origen.Columna
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Columna1, Columna2, ...)
    VALUES (Valor1, Valor2, ...)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

--Crear una tabla de empleados
CREATE TABLE Empleados (
  EmployeeID int primary key,
  FirstName NVARCHAR(50),
  LastName NVARCHAR(50),
  Salary Decimal(10,2)
 );

 select * from Empleados
 --Insertar datos
 INSERT INTO Empleados Values
  (1,'John','Doe',5000.00), 
  (2,'Jane','Smith',6000.00),
  (3,'Bob','Jhonson',7000.00)

--Crear la tabla temporal 
CREATE TABLE #EmpleadosNuevos (
   EmployeeID int PRIMARY KEY,
   Salary DECIMAL(10,2)
 );

--Insertar datos en la tabla temporal
INSERT INTO #EmpleadosNuevos VALUES
(1,55000.00),
(2,65000.00),
(3,75000.00)

--Utilizar la operacion Merge para actualizar los datos
MERGE INTO EMPLEADOS as Target  --Destino
USING #EmpleadosNuevos as Source  --Origen
ON Target.EmployeeID  = Source.EmployeeID
WHEN MATCHED THEN
  UPDATE SET Target.Salary = Source.Salary
WHEN NOT MATCHED BY TARGET THEN
  --Insertamos regitros nuevos 
  INSERT (Employeeid,Salary)
  VALUES (Source.EmployeeID,Source.Salary)
WHEN NOT MATCHED BY SOURCE THEN
  DELETE;


--Seleccionar los datos actualizados 
SELECT * FROM EMPLEADOS
--Elimimar la tabla temporal
DROP TABLE #EmpleadosNuevos







