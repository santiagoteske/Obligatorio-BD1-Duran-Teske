--obtener todos los datos de las cuentas que registraron mas de un egreso con fondos mayor
--a 25000 durante la primer quincena de marzo 2021
--considerar solamente cuentas en pesos que no hayan tenido ingresos de fondos en el mismo periodo

--cuenta 1 tiene todos los datos
SELECT *
FROM cuenta cuenta1
WHERE cuenta1.moneda = 'PESOS'
AND EXISTS
(
--cuenta 2 usa solo las keys 
SELECT cuenta2.numero, cuenta2.nombre
FROM cuenta cuenta2
JOIN movimiento ON movimiento.nombre = cuenta2.nombre AND movimiento.numero = cuenta2.numero

WHERE movimiento.importe < -25000 
    AND fecha between '1/03/2021' and '15/03/2021'
    --esto es lo que relaciona cuenta 1 con cuenta 2
    AND cuenta1.nombre = cuenta2.nombre 
    AND cuenta1.numero = cuenta2.numero
    
    GROUP BY cuenta2.nombre, cuenta2.numero 
            
            HAVING COUNT(*) > 1
)
AND NOT EXISTS 
(
    --LISTO LAS CUENTAS QUE TIENEN MOV POSITIVOS EN ESE PERIODO
    SELECT cuenta3.numero, cuenta3.nombre
    FROM cuenta cuenta3
    JOIN movimiento ON movimiento.nombre = cuenta3.nombre AND movimiento.numero = cuenta3.numero
    
    WHERE movimiento.importe > 0 
    AND fecha between '1/03/2021' and '15/03/2021'
    --esto es lo que relaciona cuenta 1 con cuenta 3
    AND cuenta1.nombre = cuenta3.nombre 
    AND cuenta1.numero = cuenta3.numero
)

--considerar cuentas en pesos que no hayan tenido ingresos en el mismo periodo        


        

        


