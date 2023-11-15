/*Creacion de SP */
CREATE PROCEDURE Nombredelprocedimiento
  @Parametro1 --Tipodedato--
  @Parametro2 --Tipodedato--
AS
 BEGIN
 --Cuerpo del Procedimento almacenado
 --Puedes realizar operaciones SQL aqui
   SELECT Column1,Column2
   FROM Mitabla
   WHERE Condicion=@Parametro1
END

Exec Nombredelprocedimiento

ALTER Procedure PA_PedidosXCliente
  @codclie int 
as
Begin
 Select 
   c.NombreCliente ,
   p.fechapedido
   from clientes c inner join 
        pedidos p on c.ClienteId=p.ClienteId
		where c.ClienteId=@codclie
end;

exec PA_PedidosXCliente 3

sp_helptext 'PA_PedidosXCliente'








