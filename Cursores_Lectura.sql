/*
Son Objetos que permiten recorrer filas 
de un conjunto de resultados de manera iterativa

Sintaxis:

 Declaracion-
 Apertura.-
 Recuperacion y procesamiento
 Cerrar y Liberar recursos del cursor

 Ejm:Crear un Cursor que me permitar recorrer fila por fila
     la tabla employees y me imprima los nombres correspondientes
*/

select * from Employees

--Declaracion de Variables
DECLARE @NombreEmpleado NVARCHAR(50)
--Declaracion del Cursor
DECLARE empleado_cursor CURSOR FOR
SELECT LastName FROM Employees

--Abrir el Cursor
OPEN empleado_cursor
--Obtener el Primer registro
FETCH NEXT FROM empleado_cursor INTO @NombreEmpleado
--Recorrer el cursor mientras haya registros
WHILE @@FETCH_STATUS = 0
	BEGIN
	   ---IMPRIMIR EL NOMBRE DEL EMPLEADO
		  PRINT 'Empleado:'+ @NombreEmpleado
	   ---OBTENER EL SIGUIENTE REGISTRO
		  FETCH NEXT FROM empleado_cursor INTO @NombreEmpleado 
	END

CLOSE empleado_cursor
DEALLOCATE empleado_cursor















