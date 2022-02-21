
INSERT INTO CLIENTE VALUES ('12345678','MARIO CUELLO','22.05.1988');
INSERT INTO CLIENTE VALUES ('23456789','LUIS RODRIGUEZ','15.10.1997');
INSERT INTO CLIENTE VALUES ('34567891','CACHO CASTA�A','09.01.1954');
INSERT INTO CLIENTE VALUES ('56789156','RICARDO ARJONA','04.04.1975');
INSERT INTO CLIENTE VALUES ('67891567','MARCO ANTONIO SOLIS','05.05.1980');
INSERT INTO CLIENTE VALUES ('78915678','RICARDO MONTANER','02.03.1976');
INSERT INTO CLIENTE VALUES ('89123456','LUIS MIGUEL','04.01.1996');
INSERT INTO CLIENTE VALUES ('12344678','MARTIN QUIROGA','30.05.1988');
INSERT INTO CLIENTE VALUES ('23456689','MARIA RODRIGUEZ','21.11.2000');
INSERT INTO CLIENTE VALUES ('34547891','ROXANNE SMITH','25.10.1998');
--CLIENTE SIN CUENTA CON NOMBRE REPETIDO PARA PROBAR ORDENACION
INSERT INTO CLIENTE VALUES ('77777777','ROXANNE SMITH','1.1.1905');


INSERT INTO SUCURSAL VALUES ('CUARENTA SEMANAS','APARICIO SARAVIA 4900');
INSERT INTO SUCURSAL VALUES ('CASABO','EGIPTO 2552');
INSERT INTO SUCURSAL VALUES ('VILARDEBO','MILLAN 2515');
INSERT INTO SUCURSAL VALUES ('NUEVO PARIS','SANTA LUCIA 4544');
INSERT INTO SUCURSAL VALUES ('CENTRO','18 DE JULIO 2125');


INSERT INTO CUENTA VALUES ('CASABO',00001,'12345678','PESOS','22/06/2009',NULL);
INSERT INTO CUENTA VALUES ('VILARDEBO',00002,'12345678','DOLARES','22.06.2009',NULL);
INSERT INTO CUENTA VALUES ('VILARDEBO',10002,'12345678','DOLARES','22.06.2015',NULL);

INSERT INTO CUENTA VALUES ('CUARENTA SEMANAS',00003,'23456789','PESOS','19.03.2017',NULL);
INSERT INTO CUENTA VALUES ('CUARENTA SEMANAS',00004,'23456789','DOLARES','15.10.2009',NULL);

INSERT INTO CUENTA VALUES ('VILARDEBO',00005,'34567891','PESOS','31.08.2004','12.12.2014');
INSERT INTO CUENTA VALUES ('CENTRO',00006,'34567891','PESOS','15.03.2011',NULL);

INSERT INTO CUENTA VALUES ('CENTRO',00007,'56789156','PESOS','18.05.2005',NULL);
INSERT INTO CUENTA VALUES ('NUEVO PARIS',00008,'56789156','DOLARES','05.06.2018','11.02.2021');

INSERT INTO CUENTA VALUES ('NUEVO PARIS',00009,'67891567','DOLARES','30.11.2016',NULL);

INSERT INTO CUENTA VALUES ('NUEVO PARIS',00010,'78915678','PESOS','22.06.2009',NULL);
--luis miguel
INSERT INTO CUENTA VALUES ('CENTRO',00011,'89123456','DOLARES','27.07.2019',NULL);
INSERT INTO CUENTA VALUES ('CASABO',00012,'89123456','DOLARES','13.03.2020',NULL);
INSERT INTO CUENTA VALUES ('CUARENTA SEMANAS',00013,'89123456','DOLARES','13.03.2020',NULL);

INSERT INTO CUENTA VALUES ('CUARENTA SEMANAS',00014,'12344678','DOLARES','14.02.2010','11.02.2020');
INSERT INTO CUENTA VALUES ('CUARENTA SEMANAS',00015,'12344678','PESOS','14.02.2010',NULL);

INSERT INTO CUENTA VALUES ('VILARDEBO',00016,'23456689','PESOS','14.02.2009','21.05.2021');
INSERT INTO CUENTA VALUES ('CENTRO',00017,'23456689','PESOS','18.05.2005',NULL);
INSERT INTO CUENTA VALUES ('CASABO',00018,'23456689','DOLARES','18.01.2015',NULL);
INSERT INTO CUENTA VALUES ('CENTRO',00019,'23456689','DOLARES','20.05.2012','18.01.2015');

INSERT INTO CUENTA VALUES ('CASABO',00020,'34547891','DOLARES','18.01.2015','26.12.2017');
INSERT INTO CUENTA VALUES ('VILARDEBO',00021,'34547891','DOLARES','24.08.2019',NULL);
INSERT INTO CUENTA VALUES ('VILARDEBO',00022,'34547891','PESOS','24.08.2019',NULL);



 --                 idMovimiento,Nombresucursalcuenta,Nrocuenta,Fecha,Concepto,Importe,idMovimientoReferencia
--mario cuello 1 pesos 2 y 3 dolares
INSERT INTO MOVIMIENTO VALUES (000001,'CASABO',00001,'10.02.2018','HONORARIOS',10000,NULL);
INSERT INTO MOVIMIENTO VALUES (000002,'VILARDEBO',00002,'15.07.2018','VENTA',20000,NULL);
INSERT INTO MOVIMIENTO VALUES (000003,'VILARDEBO',10002,'20.05.2018','IMPUESTOS',-100,NULL);
--PARA CONSULTA 3
INSERT INTO MOVIMIENTO VALUES (000004,'CASABO',00001,'14.03.2020','VENTA',-220000,NULL);

INSERT INTO MOVIMIENTO VALUES (000005,'CASABO',00001,'10.03.2021','VENTA',220000,NULL);
INSERT INTO MOVIMIENTO VALUES (000006,'CASABO',00001,'14.03.2021','VENTA',-340000,NULL);


INSERT INTO MOVIMIENTO VALUES (000007,'CUARENTA SEMANAS',00003,'20.12.2018','OTRO',1000000,NULL);
INSERT INTO MOVIMIENTO VALUES (000008,'CUARENTA SEMANAS',00004,'30.05.2015','HONORARIOS',5000,NULL);

INSERT INTO MOVIMIENTO VALUES (000009,'VILARDEBO',00005,'20.02.2012','SUELDO',35000,NULL);
INSERT INTO MOVIMIENTO VALUES (000010,'VILARDEBO',00005,'26.09.2013','DEUDA',-20000,NULL);
INSERT INTO MOVIMIENTO VALUES (000011,'CENTRO',00006,'10.10.2020','VENTA',100000,NULL);

INSERT INTO MOVIMIENTO VALUES (000012,'CENTRO',00007,'15.11.2016','ALQUILER',-18500,NULL);  
INSERT INTO MOVIMIENTO VALUES (000013,'CENTRO',00007,'10.05.2021','SUELDO',35000,NULL);
INSERT INTO MOVIMIENTO VALUES (000014,'NUEVO PARIS',00008,'10.02.2019','VENTA APTO',170000,NULL);

INSERT INTO MOVIMIENTO VALUES (000015,'NUEVO PARIS',00009,'10.02.2019','OTRO',200,NULL);
INSERT INTO MOVIMIENTO VALUES (000016,'NUEVO PARIS',00009,'22.05.2020','PAGO CUOTAS',-500,NULL);

INSERT INTO MOVIMIENTO VALUES (000017,'NUEVO PARIS',00010,'05.11.2010','SUELDO',170000,NULL);
INSERT INTO MOVIMIENTO VALUES (000018,'NUEVO PARIS',00010,'17.04.2011','TASAS',-10000,NULL);
                            
INSERT INTO MOVIMIENTO VALUES (000019,'CENTRO',00011,'21.05.2020','PAGO ALQUILERES',-500,NULL);
INSERT INTO MOVIMIENTO VALUES (000020,'CENTRO',00011,'21.05.2021','GIRA POR MEXICO',4000000,NULL);
INSERT INTO MOVIMIENTO VALUES (000021,'CENTRO',00011,'05.12.2020','SALARIOS EQUIPO',-30000,NULL);
INSERT INTO MOVIMIENTO VALUES (000022,'CASABO',00012,'21.08.2019','PARTE POR GIRA MEXICO',750000,NULL);
INSERT INTO MOVIMIENTO VALUES (000023,'CASABO',00012,'24.06.2020','PAGO ALQUILERES',-1500,NULL);
INSERT INTO MOVIMIENTO VALUES (000024,'CUARENTA SEMANAS',00013,'21.05.2020','DEUDAS',-25000,NULL);

INSERT INTO MOVIMIENTO VALUES (000025,'CUARENTA SEMANAS',00014,'15.06.2011','OTRO',-1000,NULL);
INSERT INTO MOVIMIENTO VALUES (000026,'CUARENTA SEMANAS',00014,'15.08.2011','OTRO',-1000,NULL);
INSERT INTO MOVIMIENTO VALUES (000027,'CUARENTA SEMANAS',00014,'19.08.2011','OTRO',1000,NULL);
INSERT INTO MOVIMIENTO VALUES (000028,'CUARENTA SEMANAS',00015,'14.02.2010','SUELDO',100000,NULL);
INSERT INTO MOVIMIENTO VALUES (000029,'CUARENTA SEMANAS',00015,'05.03.2021','ALQUILER',-26500,NULL);
INSERT INTO MOVIMIENTO VALUES (000030,'CUARENTA SEMANAS',00015,'07.04.2021','ALQUILER',-26500,NULL);

--Maria Rodriguez
--pesos
INSERT INTO MOVIMIENTO VALUES (000031,'VILARDEBO',00016,'18.10.2010','SUELDO',46500,NULL);
INSERT INTO MOVIMIENTO VALUES (000032,'VILARDEBO',00016,'25.10.2010','ZAPATOS',-3000,NULL);
INSERT INTO MOVIMIENTO VALUES (000033,'CENTRO',00017,'28.02.2021','SUELDO',57500,NULL);
--2
INSERT INTO MOVIMIENTO VALUES (000034,'CENTRO',00017,'30.05.2021','ALQUILER',2000,NULL);
--3
INSERT INTO MOVIMIENTO VALUES (000035,'CENTRO',00017,'1.03.2021','ALQUILER',30000,NULL);
INSERT INTO MOVIMIENTO VALUES (000036,'CENTRO',00017,'1.03.2021','ALQUILER',40000,NULL);

--dolares
INSERT INTO MOVIMIENTO VALUES (000037,'CASABO',00018,'19.04.2016','ALQUILER CABA�A',1500,NULL);
INSERT INTO MOVIMIENTO VALUES (000038,'CASABO',00018,'30.10.2016','HONORARIOS DR',-1000,NULL);
INSERT INTO MOVIMIENTO VALUES (000039,'CENTRO',00019,'30.07.2013','SUELDO',1500,NULL);
INSERT INTO MOVIMIENTO VALUES (000040,'CENTRO',00019,'30.08.2013','SUELDO',1500,NULL);
INSERT INTO MOVIMIENTO VALUES (004040,'CENTRO',00019,'14.08.2013','SUELDO',-1500,NULL);

INSERT INTO MOVIMIENTO VALUES (000041,'CENTRO',00019,'30.04.2021','ALQUILER',500,NULL);
--3
INSERT INTO MOVIMIENTO VALUES (000042,'CENTRO',00019,'1.03.2021','ALQUILER',40000,NULL);
INSERT INTO MOVIMIENTO VALUES (000043,'CENTRO',00019,'5.03.2021','ALQUILER',-40000,NULL);
INSERT INTO MOVIMIENTO VALUES (000044,'CENTRO',00019,'1.03.2021','ALQUILER',-80000,NULL);

--ROXANNE SMITH
--EN DOLARES
INSERT INTO MOVIMIENTO VALUES (000045,'CASABO',00020,'15.02.2016','VENTA CASA',300000,NULL);
INSERT INTO MOVIMIENTO VALUES (000046,'CASABO',00020,'15.02.2017','COMPRA APTO',-250000,NULL);

INSERT INTO MOVIMIENTO VALUES (000047,'CASABO',00020,'15.05.2021','COMPRA APTO',10000,NULL);

INSERT INTO MOVIMIENTO VALUES (000048,'VILARDEBO',00021,'15.02.2020','COMPRA AUTO',10001,NULL);
INSERT INTO MOVIMIENTO VALUES (000049,'VILARDEBO',00021,'15.05.2020','COMPRA AUTO',-50000,NULL);
INSERT INTO MOVIMIENTO VALUES (000050,'VILARDEBO',00021,'10.05.2020','COMPRA AUTO',-50000,NULL);
--EN PESOS
INSERT INTO MOVIMIENTO VALUES (000051,'VILARDEBO',00022,'25.05.2020','OTRO',10000,NULL);
INSERT INTO MOVIMIENTO VALUES (000052,'VILARDEBO',00022,'25.05.2021','OTRO',10000,NULL);
INSERT INTO MOVIMIENTO VALUES (000555,'VILARDEBO',00022,'29.05.2021','OTRO',-10000,NULL);
INSERT INTO MOVIMIENTO VALUES (000556,'VILARDEBO',00022,'01.05.2021','OTRO',10000,NULL);


--MOVIMIENTOS INTERNOS
 --                 idMovimiento,Nombresucursalcuenta,Nrocuenta,Fecha,Concepto,Importe,idMovimientoReferencia
 
 --TRANSFERENCIA ENTRE 2 CUENTAS DE LA MISMA PERSONA EN DOLARES
INSERT INTO MOVIMIENTO VALUES (000053,'VILARDEBO',00002,'1.05.2021','VENTA',-20000,000053);
INSERT INTO MOVIMIENTO VALUES (000054,'VILARDEBO',10002,'1.05.2021','VENTA',20000,000053);

--PRUEBA PARA CONSULTA 4 

--las 3 secursales distintas a las de Luismi
INSERT INTO MOVIMIENTO VALUES (000055,'NUEVO PARIS',00009,'1.04.2020','VENTA',-20000,000055);
INSERT INTO MOVIMIENTO VALUES (000056,'CENTRO',00011,'1.04.2020','VENTA',20000,000055);

INSERT INTO MOVIMIENTO VALUES (000057,'VILARDEBO',00021,'1.04.2020','FIESTA EN LA PLAYA',-80000,000057);
INSERT INTO MOVIMIENTO VALUES (000058,'CENTRO',00011,'1.04.2020','FIESTA EN LA PLAYA',80000,000057);

INSERT INTO MOVIMIENTO VALUES (000059,'VILARDEBO',00021,'5.05.2021','FIESTA 2021',-80000,000059);
INSERT INTO MOVIMIENTO VALUES (000060,'CENTRO',00011,'5.05.2021','FIESTA 2021',80000,000059);

--PRUEBA PARA CONSULTA 5
INSERT INTO MOVIMIENTO VALUES (000061,'VILARDEBO',00021,'5.01.2021','FIESTA PRUEBA5',-80000,000061);
INSERT INTO MOVIMIENTO VALUES (000062,'CENTRO',00011,'5.01.2021','FIESTA 2021',80000,000061);

INSERT INTO MOVIMIENTO VALUES (000063,'CENTRO',00011,'5.01.2021','FIESTA 2021 PRUEBA2',80000,000063);
INSERT INTO MOVIMIENTO VALUES (000064,'CENTRO',00011,'5.01.2021','FIESTA 2021 PRUEBA2',80000,000063);
 
INSERT INTO MOVIMIENTO VALUES (000065,'CENTRO',00011,'5.01.2021','FIESTA 2021 PRUEBA2',80000,000065); 
INSERT INTO MOVIMIENTO VALUES (000066,'CENTRO',00011,'5.01.2021','FIESTA 2021 PRUEBA2',-80000,000065); 

--C5 PARA VER SI DESAPARECE ANA
INSERT INTO MOVIMIENTO VALUES (000067,'CENTRO',00019,'5.03.2021','ALQUILER',-40000,NULL);

--PARA PRUEBA 8
--cacho millonario en PESOS
INSERT INTO MOVIMIENTO VALUES (000068,'CENTRO',00006,'5.01.2021','CACHENGE',2000000,null); 
--MARIA RODRIGUEZ - CENTRO
INSERT INTO MOVIMIENTO VALUES (000069,'CENTRO',00019,'5.01.2021','REGALIAS DE DAVID BISBAL',2000000,null); 
--MARIA RODRIGUEZ - CASABO
INSERT INTO MOVIMIENTO VALUES (000070,'CASABO',00018,'5.01.2021','REGALIAS DE CHAYANE',2000000,null); 

INSERT INTO MOVIMIENTO VALUES (000071,'CASABO',00018,'5.01.2011','2011',2000000,null); 
INSERT INTO MOVIMIENTO VALUES (000072,'CASABO',00018,'5.01.2011','2010',2000000,null); 
