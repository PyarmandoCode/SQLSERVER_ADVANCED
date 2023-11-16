EXEC sp_configure 'show advanced options',1
GO
RECONFIGURE
GO
--enable xp_cmdshell
EXEC sp_configure 'xp_cmdshell',1
GO
RECONFIGURE
GO

EXEC sp_configure 'xp_cmdshell',0
GO
RECONFIGURE
GO

--Utilidad BCP (Bulk Copy program)

ALTER PROCEDURE PA_EXPORTAR_A_CSV
AS
BEGIN
    -- Declarar una variable para almacenar la ruta del archivo CSV
    DECLARE @FilePath VARCHAR(MAX) = 'E:\files_csv\DatosNorthwind.csv';
   -- Ejecutar el comando bcp para exportar datos a un archivo CSV
    DECLARE @BCPCommand VARCHAR(8000);
    SET @BCPCommand = 'bcp "SELECT Customerid,Companyname FROM 
	Northwind.dbo.Customers" queryout "' +
	@FilePath + '" -c -t, -T -S ' + @@SERVERNAME;
	--Es un procedimiento extendido en SQL SERVER que permite ejecutar
	--Comandos del SO desde el entorno de SQL SERVER
    EXEC xp_cmdshell @BCPCommand;
END;

EXEC PA_EXPORTAR_A_CSV
