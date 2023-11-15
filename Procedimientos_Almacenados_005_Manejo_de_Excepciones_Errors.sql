ALTER PROCEDURE pa_manejoexcepciones  
AS  
BEGIN  
	BEGIN TRY  
	--AQUI VA EL CODIGO QUE PUEDE GENERAR UNA EXCEPCION  
	--SIMULAR UNA EXCEPCION DIVIDIENDO POR CERO  
	DECLARE @resultado int;  
	set @resultado= 1/0;  
	END TRY  
	BEGIN CATCH  
	--ESTE BLOQUE SE EJECUTARA SI OCURRE UAN EXCEPCION  
	SELECT  
		ERROR_NUMBER() as ErrorNumber ,
		ERROR_MESSAGE() as ErrorMensaje,
		ERROR_STATE() as ErrorState,
		ERROR_PROCEDURE() as ErrorProcedure,
		ERROR_LINE() as ErrorLine,
		ERROR_SEVERITY() AS ErrorSeverity
	--podemos realizar acciones adicionales  
	END CATCH  
END;  

EXEC pa_manejoexcepciones  