select * from TblEmpresas
select * from TblPuestos

/*Script #1.   Puestos por Empresa*/
select E.EmpresaCodigo, E.Nombre, count(P.Nombre)  Puesto
from TblPuestos P
inner join TblEmpresas E on E.EmpresaID = P.EmpresaID
group by E.EmpresaCodigo, E.Nombre

/*Script #2.    Modificación de Nombre de Empresa*/
update TblEmpresas set Nombre = 'Empresa De Evaluacioenes'  where EmpresaID = 1

/*Script #3.   Puestos Activos por Empresa*/
select E.EmpresaCodigo, E.Nombre, count(P.Nombre) PuestosActivos
from TblPuestos P
inner join TblEmpresas E on E.EmpresaID = P.EmpresaID
where P.FechaDeBaja IS NULL
group by E.EmpresaCodigo, E.Nombre

