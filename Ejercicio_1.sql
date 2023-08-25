select trb.NOMBRE_TRABAJADOR "Nombre trabajador", emp.NOMBRE_EMPRESA "Empresa", count(lmed.ID_TRABAJADOR_EMPRESA) "Cantidad de licencias"
from dbo.TBL_TRABAJADOR trb
inner join dbo.REL_TRABAJADOR_EMPRESA rtrbe on
Trb.id_trabajador = rtrbe.id_trabajador
inner join dbo.TBL_EMPRESA emp on
emp.id_empresa = rtrbe.id_empresa 
inner join dbo.TBL_LICENCIA_MEDICA lmed on
lmed.id_trabajador_empresa = rtrbe.id_trabajador_empresa
where lmed.CODIGO_ENFERMEDAD = 123 -- ( Al no tener el dato del código COVID, se ingresará 123)
and fecha_fin_contrato = '9999-12-30 00:00:00.000'
group by trb.NOMBRE_TRABAJADOR, emp.NOMBRE_EMPRESA, lmed.ID_TRABAJADOR_EMPRESA;
