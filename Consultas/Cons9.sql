--obtener las sucursales donde se han creado la menor cantidad de cuentas para clientes
--menores de 25 años(cuando crearon la cuenta) pero que dichas cuentas hayan generado la mayor cantidad de movimientos
--10 años


1--Obtener las sucursales y su cantidad de clientes y cuantos eran menores cuando crearon la cuenta
SELECT sucursal.nombre
From sucursal
JOIN cuenta ON cuenta.nombre = sucursal.nombre
JOIN cliente on cuenta.cedula = cliente.cedula
WHERE cuenta.nombre = sucursal.nombre 
AND ((  cuenta.fechaalta - cliente.fechanacimiento )/365.25) < 25 
AND EXISTS(
    SELECT movimiento.nombre,movimiento.numero, COUNT(*)-- COUNT CUENTA LA CANTIDAD DE MOVIMIENTOS EN LOS ULTIMOS 10 AÑOS
        From movimiento
        where extract(year from movimiento.fecha) >= (SELECT EXTRACT(YEAR FROM SYSDATE) -10 FROM DUAL)
        AND cuenta.nombre = movimiento.nombre AND cuenta.numero = movimiento.numero-- PARA QUE NO ME TRAIGA DE OTRA CUENTA
        GROUP BY movimiento.nombre , movimiento.numero      
     HAVING COUNT(*) = (
                        SELECT  COUNT(*)-- COUNT CUENTA LA CANTIDAD DE MOVIMIENTOS
                        From movimiento
                        GROUP BY movimiento.nombre , movimiento.numero
                        ORDER BY 1 desc 
                        fetch first 1 rows only -- ME QUEDO CON EL NUMERO MAS GRANDE Y LUEGO COMPARO CON ESE NUMERO
                        )
)

