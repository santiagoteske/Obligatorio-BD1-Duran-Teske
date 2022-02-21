--Obtener las sucursales que tienen la mayor cantidad de clientes millonarios en dolares
--Se entiende por millonario a un cliente que tiene un saldo del total de sus cuentas en dolares 
--EN ESA SUCURSAL, mayor a un millon.
--ordenar alfebitcamente y por fecha de nacimiento

SELECT cuenta1.nombre
FROM cuenta cuenta1
where exists (SELECT cuenta.nombre,cuenta.cedula
                From movimiento
                join cuenta ON movimiento.numero = cuenta.numero AND movimiento.nombre = cuenta.nombre
                where cuenta.moneda = 'DOLARES'
                AND cuenta.nombre = cuenta1.nombre AND cuenta1.cedula = cuenta.cedula
                GROUP BY cuenta.nombre, cuenta.cedula
                having SUM(movimiento.importe) > 1000000 
)
AND cuenta1.moneda = 'DOLARES' 
GROUP BY cuenta1.nombre 
HAVING COUNT(*) = (SELECT  count(*)
                    FROM cuenta cuenta1
                    where exists (SELECT cuenta.nombre,cuenta.cedula
                                    From movimiento
                                    join cuenta ON movimiento.numero = cuenta.numero AND movimiento.nombre = cuenta.nombre
                                    where cuenta.moneda = 'DOLARES'
                                    AND cuenta.nombre = cuenta1.nombre AND cuenta1.cedula = cuenta.cedula
                                    GROUP BY cuenta.nombre, cuenta.cedula
                                    having SUM(movimiento.importe) > 1000000 
                    )
                    AND cuenta1.moneda = 'DOLARES'
                    GROUP BY cuenta1.nombre 
                    ORDER BY 1 desc
                    fetch first 1 rows only)
ORDER BY 1 desc
















