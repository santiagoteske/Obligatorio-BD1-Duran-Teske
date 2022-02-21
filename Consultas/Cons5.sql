--obtener datos de los movimientos donde existan para la misma cuenta
--movimientos por el mismo concepto pero importe opuesto durante el mismo mes 
-- Y NO EXISTAN MAS MOVIMIENTOS CON EL MISMO CONCEPTO E IMPORTE DURANTE ESE MISMO MES

SELECT DISTINCT movimiento.*
FROM movimiento 
join movimiento movimiento2 on movimiento.numero = movimiento2.numero AND movimiento.nombre = movimiento2.nombre
Where movimiento.concepto = movimiento2.concepto
AND movimiento.importe = (-1)*movimiento2.importe
AND extract(month from movimiento.fecha) = extract(month from movimiento2.fecha) 
AND NOT EXISTS-- movimiento con campos iguales pero id diferente
(
    SELECT movimiento.*
FROM movimiento movimiento3
Where movimiento.numero = movimiento3.numero AND movimiento.nombre = movimiento3.nombre
AND movimiento.concepto = movimiento3.concepto
AND movimiento.importe = movimiento3.importe
AND extract(month from movimiento.fecha) = extract(month from movimiento3.fecha) 

AND movimiento.idmovimiento <> movimiento3.idmovimiento

)

