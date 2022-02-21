
-- calculamos el porcentaje respecto a los ingresos de otono e invierno

SELECT MOVXCLIENTE.Estacion, MOVXCLIENTE.Sucursal , MOVXCLIENTE.Cliente , MOVXCLIENTE.TipoMov ,MOVXCLIENTE.cantMov ,MOVXCLIENTE.Moneda,
ROUND ((movxcliente.importe/movtotal.ImporteTotal)*100 , 2)AS "%Importe/importeTotalSuc", clientesmayorsaldo.cliente AS ClienteUSD
FROM 

--INGRESOS DE OTONO 
(
Select 'OTOÑO' AS Estacion,
        movimiento.nombre as Sucursal,
        cliente.nombre as Cliente,
        'Ingreso' as TipoMov,
        count(*) as CantMov,
        cuenta.moneda as Moneda,
        SUM(importe) as Importe
        
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
JOIN cliente on cuenta.cedula = cliente.cedula
--OTONO
where ( extract(Month from(movimiento.fecha)) = 4 OR extract(Month from(movimiento.fecha)) = 5 OR
            ( (extract(Day from(movimiento.Fecha)) >= 20 and extract(Month from (movimiento.fecha)) = 3) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 21 and extract(Month from (movimiento.fecha)) = 6)))
            
AND movimiento.importe >0 
GROUP BY movimiento.nombre, cliente.nombre,cuenta.moneda 
UNION
--INGRESOS DE INVIERNO
Select 'INVIERNO' AS Estacion,
        movimiento.nombre as Sucursal,
        cliente.nombre as Cliente,
        'Ingreso' as TipoMov,
        count(*) as CantMov,
        cuenta.moneda as Moneda,
        SUM(importe) as Importe
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
JOIN cliente on cuenta.cedula = cliente.cedula 

--invierno
where ( extract(Month from(movimiento.fecha)) = 8 OR extract(Month from(movimiento.fecha)) = 7 OR
            ( (extract(Day from(movimiento.Fecha)) >= 21 and extract(Month from (movimiento.fecha)) = 6) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 22 and extract(Month from (movimiento.fecha)) = 9)))
            
AND movimiento.importe >0 
GROUP BY movimiento.nombre, cliente.nombre,cuenta.moneda  
UNION
--EGRESOS DE OTONO 
Select 'OTOÑO' AS Estacion,
        movimiento.nombre as Sucursal,
        cliente.nombre as Cliente,
        'Egreso' as TipoMov,
        count(*) as CantMov,
        cuenta.moneda as Moneda,
        SUM(importe) as Importe
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
JOIN cliente on cuenta.cedula = cliente.cedula
--OTONO
where ( extract(Month from(movimiento.fecha)) = 4 OR extract(Month from(movimiento.fecha)) = 5 OR
            ( (extract(Day from(movimiento.Fecha)) >= 20 and extract(Month from (movimiento.fecha)) = 3) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 21 and extract(Month from (movimiento.fecha)) = 6)))
            
AND movimiento.importe < 0 
GROUP BY movimiento.nombre, cliente.nombre,cuenta.moneda       

UNION
--EGRESOS DE INVIERNO
Select 'INVIERNO' AS Estacion,
        movimiento.nombre as Sucursal,
        cliente.nombre as Cliente,
        'Egreso' as TipoMov,
        count(*) as CantMov,
        cuenta.moneda as Moneda,
        SUM(importe) as Importe
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
JOIN cliente on cuenta.cedula = cliente.cedula

--invierno
where ( extract(Month from(movimiento.fecha)) = 8 OR extract(Month from(movimiento.fecha)) = 7 OR
            ( (extract(Day from(movimiento.Fecha)) >= 21 and extract(Month from (movimiento.fecha)) = 6) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 22 and extract(Month from (movimiento.fecha)) = 9)))
            
AND movimiento.importe < 0 
GROUP BY movimiento.nombre, cliente.nombre,cuenta.moneda 

) MOVXCLIENTE,

---*************************---***************-***********
--INGRESOS DE OTONO 
(
Select 'OTOÑO' AS Estacion,
        movimiento.nombre as Sucursal,
        'Ingreso' as TipoMov,
        cuenta.moneda as Moneda,
        SUM(importe) as ImporteTotal
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
--OTONO
where ( extract(Month from(movimiento.fecha)) = 4 OR extract(Month from(movimiento.fecha)) = 5 OR
            ( (extract(Day from(movimiento.Fecha)) >= 20 and extract(Month from (movimiento.fecha)) = 3) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 21 and extract(Month from (movimiento.fecha)) = 6)))
            
AND movimiento.importe >0 
GROUP BY movimiento.nombre,cuenta.moneda       

UNION
--INGRESOS DE INVIERNO
Select 'INVIERNO' AS Estacion,
        movimiento.nombre as Sucursal,
        'Ingreso' as TipoMov,
        cuenta.moneda as Moneda,
        SUM(importe) as ImporteTotal
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
--invierno
where ( extract(Month from(movimiento.fecha)) = 8 OR extract(Month from(movimiento.fecha)) = 7 OR
            ( (extract(Day from(movimiento.Fecha)) >= 21 and extract(Month from (movimiento.fecha)) = 6) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 22 and extract(Month from (movimiento.fecha)) = 9)))
            
AND movimiento.importe >0 
GROUP BY movimiento.nombre,cuenta.moneda  
UNION
--EGRESOS DE OTONO 
Select 'OTOÑO' AS Estacion,
        movimiento.nombre as Sucursal,
        'Egreso' as TipoMov,
        cuenta.moneda as Moneda,
        SUM(importe) as ImporteTotal
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero
--OTONO
where ( extract(Month from(movimiento.fecha)) = 4 OR extract(Month from(movimiento.fecha)) = 5 OR
            ( (extract(Day from(movimiento.Fecha)) >= 20 and extract(Month from (movimiento.fecha)) = 3) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 21 and extract(Month from (movimiento.fecha)) = 6)))
            
AND movimiento.importe < 0 
GROUP BY movimiento.nombre,cuenta.moneda       

UNION
--EGRESOS DE INVIERNO
Select 'INVIERNO' AS Estacion,
        movimiento.nombre as Sucursal,
        'Egreso' as TipoMov,
        cuenta.moneda as Moneda,
        SUM(importe) as ImporteTotal
FROM movimiento
JOIN cuenta on movimiento.nombre = cuenta.nombre AND movimiento.numero = cuenta.numero

--invierno
where ( extract(Month from(movimiento.fecha)) = 8 OR extract(Month from(movimiento.fecha)) = 7 OR
            ( (extract(Day from(movimiento.Fecha)) >= 21 and extract(Month from (movimiento.fecha)) = 6) ) OR
            ( (extract(Day from(movimiento.Fecha)) <= 22 and extract(Month from (movimiento.fecha)) = 9)))
            
AND movimiento.importe < 0 
GROUP BY movimiento.nombre,cuenta.moneda 
) MOVTOTAL,

-----**********************************-------
--CLIENTES MAYORES SALDO POR SUCURSAL EN DOLARES
(Select cuenta.nombre AS SUCURSAL, cliente.nombre AS CLIENTE  , SUM(movimiento.importe) AS SALDO
From Movimiento     
Join cuenta on cuenta.nombre = movimiento.nombre AND cuenta.numero = movimiento.numero
join cliente on cliente.cedula = cuenta.cedula
WHERE cuenta.moneda = 'DOLARES'
group by cuenta.nombre, cliente.nombre
HAVING SUM(movimiento.importe) = (
                Select  SUM(movimiento.importe) AS SALDO
                From Movimiento     
                Join cuenta c1 on c1.nombre = movimiento.nombre AND c1.numero = movimiento.numero
                join cliente on cliente.cedula = c1.cedula
                WHERE c1.moneda = 'DOLARES'
                AND cuenta.nombre = c1.nombre 
                group by c1.nombre, cliente.nombre
                ORDER BY 1 Desc
                fetch first 1 rows only
                )
) CLIENTESMAYORSALDO


WHERE --engancho la primera con la segunda
      movtotal.estacion = Movxcliente.estacion AND
      movtotal.sucursal = Movxcliente.sucursal AND
      movtotal.tipomov = movxcliente.tipomov AND
      movtotal.moneda = movxcliente.moneda AND
      --engancho la tercera con el resto enganchandola a la primera
      Movxcliente.sucursal = clientesmayorsaldo.sucursal
      
ORDER BY  MOVXCLIENTE.Sucursal , MOVXCLIENTE.Cliente , MOVXCLIENTE.Estacion, MOVXCLIENTE.TipoMov ,MOVXCLIENTE.Moneda



