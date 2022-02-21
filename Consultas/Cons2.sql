SELECT DISTINCT cliente.*
FROM cliente
--movimiento no tiene relacion con cliente, tiene relacion con cuenta y cuenta con movimiento
JOIN cuenta ON cuenta.cedula = cliente.cedula
JOIN movimiento ON movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
WHERE movimiento.importe > 1000 
AND fecha BETWEEN 
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -2)) + 1 
            AND
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -1))
AND cliente.cedula NOT IN
(
    
SELECT cliente.cedula
FROM cliente
--movimiento no tiene relacion con cliente, tiene relacion con cuenta y cuenta con movimiento
JOIN cuenta ON cuenta.cedula = cliente.cedula
JOIN movimiento ON movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
WHERE cuenta.moneda = 'PESOS' 
AND (fecha BETWEEN 
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -2)) + 1 
            AND
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -1)))
AND movimiento.importe> 1000

INTERSECT -- UNO LO QUE TIENEN MOVIMIENTO EN PESOS CON LOS QUE TIENEN EN DOLARES

SELECT cliente.cedula
FROM cliente
JOIN cuenta ON cuenta.cedula = cliente.cedula
JOIN movimiento ON movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
WHERE cuenta.moneda = 'DOLARES'
AND movimiento.importe> 1000
AND fecha BETWEEN 
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -2)) + 1 
            AND
            LAST_DAY (ADD_MONTHS (TRUNC (SYSDATE), -1))
)