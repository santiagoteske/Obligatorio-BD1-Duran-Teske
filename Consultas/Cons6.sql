--obtener los datos de los clientes y sus numeros de cuenta
--ademas para los clientes que tienen cuenta inactiva mostrar la fecha de baja en esa columna
--mostrar los datos para los clientes que contenga en su nombre Rodriguez


SELECT cliente.*,cuenta.numero, CASE
                                WHEN cuenta.fechabaja  IS NULL THEN 'ACTIVA'
                                ELSE TO_CHAR(cuenta.fechabaja)
                                END
FROM cliente
JOIN cuenta ON cuenta.cedula = cliente.cedula
WHERE UPPER(cliente.nombre) LIKE '%RODRIGUEZ%' 


