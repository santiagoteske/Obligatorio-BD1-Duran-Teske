--Obtener la cedula,el nombre de los clientes, numero de cuenta y sucursal
--de los clientes que recibieron deposito de todas las sucursales diferentes a la suya durante
--el ano anterior

SELECT cliente.cedula, cliente.nombre, cuenta.numero ,cuenta.nombre
FROM cliente
JOIN cuenta ON cuenta.cedula = cliente.cedula
WHERE 
not exists 
--NO EXISTE UNA SUCURSAL QUE NO ESTE EN LOS MOVIMIENTOS
(--SUCURSALES TOTALES - LAS DEL CLIENTE
    SELECT sucursal.nombre
    FROM sucursal
    MINUS
    --sucursales del cliente
    SELECT cuenta1.nombre
    FROM cuenta cuenta1
    WHERE cuenta1.cedula = cuenta.cedula
    MINUS
    --sucursales desde donde recibio depositos
    SELECT movimiento2.nombre
    from movimiento
    join cuenta cuenta2 on cuenta2.numero = movimiento.numero AND cuenta2.nombre = movimiento.nombre 
    join movimiento movimiento2 on movimiento.idmovimientoreferencia = movimiento2.idmovimiento
    where movimiento.nombre <> movimiento2.nombre
    and cuenta2.numero = movimiento.numero AND cuenta2.nombre = movimiento.nombre
    and cuenta2.cedula = cuenta.cedula
    AND extract(year from movimiento.fecha) = (select extract(year from sysdate) - 1 from dual )
)

    


