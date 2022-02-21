--Consulta 1
--Obtener la cedula y el nombre de los clientes mas antiguos que tengan cuenta en la suc CENTRO

SELECT cliente.cedula,cliente.nombre
FROM cliente
--uno cliente con cuenta a traves de las cedulas
JOIN cuenta ON cuenta.cedula = cliente.cedula
WHERE cuenta.nombre = 'CENTRO'
AND fechaalta IN (SELECT MIN(fechaalta)
                FROM cliente
                JOIN cuenta ON cuenta.cedula = cliente.cedula
                WHERE cuenta.nombre = 'CENTRO')