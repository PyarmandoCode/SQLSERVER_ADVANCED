/*
Crear Un Job que ejecute un SP en un frecuencia
definida
*/
USE msdb;
go

--1.-Create New Job
EXEC msdb.dbo.sp_add_job
  @job_name = 'MiJobDiario',
  @enabled = 1,
  @description = 'Job Para Ejecutar mi SP Diariamente';
GO


--2.-Asociar el Job a Mi Servidor
EXEC msdb.dbo.sp_add_jobserver
    @job_name='MiJobDiario',
	@server_name ='6640d19b2945'
GO	
--3.-Adicionar la tarea a ejecutar store procedure
EXEC msdb.dbo.sp_add_jobstep
     @job_name='MiJobDiario',
	 @step_name ='Ejecutar pa_prueba',
	 @subsystem ='TSQL',
	 @command ='EXEC pa_prueba',
	 @retry_attempts=5,
	 @retry_interval=5
GO
--4.-Programas el calendario Schedule
EXEC msdb.dbo.sp_add_schedule
    @schedule_name='Ejecucion Diaria',
	@enabled=1,
	@freq_type = 4, --Diaria
	@freq_interval=1,
	@active_start_time=30000; --03:00AM
GO
--5.-Asociar el Job with el calendario
EXEC msdb.dbo.sp_attach_schedule
    @job_name='MiJobDiario',
	@schedule_name='Ejecucion Diaria'
GO
--6.-Start Job
EXEC msdb.dbo.sp_start_job @job_name='MiJobDiario'
GO
