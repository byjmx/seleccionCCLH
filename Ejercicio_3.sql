select emp.NOMBRE_EMPRESA, format(lmed.FECHA_INICIO,'yyyy') "AÑO", count(emp.NOMBRE_EMPRESA) "Cantidad", format(sum(lmed.MONTO_REEMBOLSO),'###,###','de-de') "Suma monto reembolsado año"
from TBL_EMPRESA emp
INNER JOIN REL_TRABAJADOR_EMPRESA rtrbe on
emp.ID_EMPRESA = rtrbe.ID_EMPRESA
INNER JOIN TBL_LICENCIA_MEDICA lmed on
lmed.ID_TRABAJADOR_EMPRESA = rtrbe.ID_TRABAJADOR_EMPRESA
WHERE format(lmed.FECHA_INICIO,'yyyy') >= '2015'
group by emp.NOMBRE_EMPRESA, format(lmed.FECHA_INICIO,'yyyy')
order by 2,3;
