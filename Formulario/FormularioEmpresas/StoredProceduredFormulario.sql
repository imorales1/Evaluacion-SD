
create proc Consulta
@Codigo nvarchar(10)
as
select E.EmpresaCodigo Codigo, E.Nombre Nombre, E.CorreoElectronico Correo, E.Telefono
from TblEmpresas E
where E.EmpresaCodigo like @Codigo+'%'


create proc ConsultaNombre
@Nombre nvarchar(25)
as
select E.EmpresaCodigo Codigo, E.Nombre Nombre, E.CorreoElectronico Correo, E.Telefono
from TblEmpresas E
where E.Nombre like @Nombre+'%'
