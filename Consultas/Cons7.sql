--7 obtener para cada cliente la cantidad de cuentas que tiene y la cantidad de movimientos
--teniendo en cuenta solamente los clientes que tengan la menor cantidad de cuentas de divisas diferentes.
--Ordenar alfabeticamente por nombre y fecha de alta
--*******************
SELECT cliente.*,(SELECT count(*)
                 FROM cuenta 
                 where cuenta.cedula = cliente.cedula) "CANTIDAD CUENTAS"
                ,(SELECT  count(*) 
                  FROM movimiento 
                  JOIN cuenta ON movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
                  where cuenta.cedula = cliente.cedula) "CANTIDAD MOVIMIENTOS"
FROM cliente
WHERE (SELECT count (DISTINCT cuenta.moneda)--cantidad de diferentes divisas del cliente
        From Cuenta--cantidad de diferentes divisas del cliente
        where cuenta.cedula = cliente.cedula)/*cantidad de diferentes divisas del cliente*/ = (SELECT count(DISTINCT cuenta.moneda)--la menor cantidad de divisas diferentes
                                                 FROM cuenta --la menor cantidad de divisas diferentes
                                                GROUP BY cuenta.cedula--la menor cantidad de divisas diferentes
                                                ORDER BY 1--la menor cantidad de divisas diferentes
                                                fetch first 1 rows only)--la menor cantidad de divisas diferentes
                                        
ORDER BY cliente.nombre DESC, cliente.fechanacimiento DESC






