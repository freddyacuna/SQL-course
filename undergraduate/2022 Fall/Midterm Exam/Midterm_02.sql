-- Sobre la base de datos EMPRESA, se pide escribir las siguientes consultas SQL:

-- 1.  Listar el nombre y número de departamentos que NO tienen proyectos.

--[OPCION A]

SELECT NombreD, NúmeroD
FROM DEPARTAMENTO
WHERE NúmeroD NOT IN (SELECT ND 
                      FROM PROYECTO
                     )

--[OPCION B]

SELECT NombreD AS 'NOMBRE DEPTO', NúmeroD AS 'NUMERO DEPTO'
FROM DEPARTAMENTO D
LEFT JOIN PROYECTO P ON D.`NúmeroD`=P.ND
WHERE NombreP IS NULL


-- 2. Listar el nombre y apellido de los empleados que no tienen dependientes y que son supervisores.

--[OPCION A]

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT NOT IN (SELECT RUT
                  FROM DEPENDIENTE)
      AND
      RUT IN (SELECT RUTSuperv
              FROM EMPLEADO)


--[OPCION B]

SELECT NOMBRE, APaterno AS APELLIDO
FROM EMPLEADO E
LEFT JOIN DEPENDIENTE D ON E.RUT=D.RUT
WHERE RUTSuperv IS NULL AND D.RUT IS NULL

-- 3.  Recuperar los nombres de departamento que tienen la menor cantidad de localizaciones.

--[OPCION A]

SELECT NombreD, MINIMOLOCALIZACIONES
FROM

(SELECT MIN(CANTIDAD_LOCALIZACIONES) AS MINIMOLOCALIZACIONES
FROM (SELECT COUNT(NúmeroD) AS CANTIDAD_LOCALIZACIONES
  	FROM SUCURSAL
  	GROUP BY NúmeroD) AS LISTA_CANTIDAD_LOCALIZACIONES
) AS MINIMO_LOCALIZACIONES
, 
(SELECT NOMBRED, CANTIDAD_LOCALIZACIONES
FROM DEPARTAMENTO AS DEPTO
     , 
     (SELECT NúmeroD, COUNT(NúmeroD) AS CANTIDAD_LOCALIZACIONES
     FROM SUCURSAL
     GROUP BY NúmeroD) AS NUMEROD_Y_CANTIDAD_LOCALIZACIONES
WHERE DEPTO.NúmeroD = NUMEROD_Y_CANTIDAD_LOCALIZACIONES.NúmeroD
) AS LISTA_NUMEROD_Y_CANTIDAD_LOCALIZACIONES
 
WHERE MINIMOLOCALIZACIONES = CANTIDAD_LOCALIZACIONES

--[OPCION B]

SELECT NombreD AS 'NOMBRE DEPARTAMENTO'
FROM (
SELECT NombreD, COUNT(*) AS NUMERO
FROM DEPARTAMENTO D
LEFT JOIN SUCURSAL S ON D.NúmeroD= S.NúmeroD
GROUP BY NombreD  
ORDER BY COUNT(*) ASC
) AS T
WHERE NUMERO <2

/*

4a. Crear una tabla BONOEMPLEADO, que permite almacenar los bonos únicos y por mes, 
que un empleado puede recibir a través de los años. Es decir, un empleado puede recibir 
hasta 12 bonos, uno por mes; en todos los años que permanece trabajando en la empresa; 
por lo que es necesario almacenar el mes, año y el monto del bono que puede recibir en 
algún mes del año. 	

*/
--[OPCION A]

CREATE TABLE BONOEMPLEADO ( 
       RUT           VARCHAR(8) NOT NULL, 
       Mes            VARCHAR(12) NOT NULL,
       Año             INT(4),
       MontoBono DECIMAL(10,2),
       PRIMARY KEY (RUT, Mes, Año),					
       FOREIGN KEY (RUT) REFERENCES EMPLEADO (RUT) 
                                          ON DELETE CASCADE ON UPDATE CASCADE		
);


--[OPCION B]



/*

4b. Se pide asignar un bono del 20% del salario del empleado, por el mes y año de la fecha 
de hoy, a solamente aquellos empleados que tienen dos o más dependientes. 

*/

--[OPCION A]

INSERT INTO BONOEMPLEADO
SELECT RUT, MONTH(CURDATE()), YEAR(CURDATE()), SALARIO*0.2			
FROM EMPLEADO
WHERE RUT IN (SELECT RUT
                            FROM DEPENDIENTE
                            GROUP BY RUT HAVING COUNT(*) >= 2);

--[OPCION B]
INSERT INTO BONOEMPLEADO
SELECT RUT, MONTH(CURDATE()), YEAR(CURDATE()), Salario*0.2 AS BONO
FROM EMPLEADO
WHERE RUT IN (SELECT RUT 
                        FROM (SELECT RUT, COUNT(*) AS NUMERO FROM DEPENDIENTE
                              GROUP BY RUT  
                              ) AS T
              WHERE NUMERO>1    
              )

-- Sobre la base de datos LIBRERIAFB, se pide escribir las siguientes consultas SQL:

-- 5.  Muestre un listado con los libros que se han solicitado más de tres veces en un año.

--[OPCION A]

SELECT LIBRO_DE_ESTUDIO.CodigoLibro, COUNT(LIBRO_DE_ESTUDIO.Anio) AS CONTADOR
FROM LIBRO_DE_ESTUDIO
GROUP BY LIBRO_DE_ESTUDIO.CodigoLibro HAVING COUNT(LIBRO_DE_ESTUDIO.Anio) >3


--[OPCION B]



6. Presente una lista con los nombres de clientes, cantidad de libros adquiridos y número 
de boleta asociada, para aquellos clientes que hayan sido atendidos por vendedores cuyos 
nombres comienzan con “D” y terminan con “o”, y se haya vendido en el mes de mayo.

*/

--[OPCION A]

SELECT DISTINCT CLIENTE.Nombre, ADQUIERE.NroBoleta, ADQUIERE.Cantidad
FROM CLIENTE, ADQUIERE, VENTA
WHERE ADQUIERE.RutVendedor IN (
SELECT DISTINCT PERSONAL.RutPersonal
FROM PERSONAL
WHERE PERSONAL.Nombre LIKE "D%o") AND ADQUIERE.NroBoleta=VENTA.NroBoleta AND CLIENTE.Rut=ADQUIERE.Rut AND VENTA.Fecha LIKE "_____05___"


--[OPCION B]

SELECT DISTINCT CL.Nombre, TT.NUMERO AS 'CANTIDAD LIBROS' FROM CLIENTE CL
LEFT JOIN (
SELECT C.Rut, SUM(Cantidad) AS NUMERO FROM `CLIENTE` C
LEFT JOIN (

    SELECT * 
FROM `ADQUIERE`
WHERE RutVendedor IN (
    SELECT RutPersonal FROM `PERSONAL`  
WHERE LEFT(Nombre,1) = 'D' AND  RIGHT(Nombre,1) ='o'
) AND NroBoleta IN (
SELECT NroBoleta  FROM `VENTA`
WHERE MONTH(Fecha)=5
)
    
) T ON T.Rut=C.Rut
WHERE NroBoleta IS NOT NULL
GROUP BY(C.RUT)
) TT ON CL.Rut=TT.Rut

WHERE NUMERO IS NOT NULL
/*

7. Se solicita crear una tabla llamada VtaEspecial, con el rut del cliente y vendedor, 
número de boleta, y la cantidad de aquellas ventas que hayan sido por una cantidad mayor 
al promedio. Para ello, se pide tomar en cuenta únicamente la cantidad mayor de aquellas 
boletas realizadas por el mismo vendedor para un mismo cliente.

*/

--[OPCION A]

CREATE TABLE VtaEspecial(
    NroBoleta VARCHAR(10) NOT NULL,
    RutCliente VARCHAR(10),
    RutVendedor VARCHAR(10),
    Cantidad INT(10),
    	PRIMARY KEY(NroBoleta, RutCliente, RutVendedor),
    	FOREIGN KEY(NroBoleta) REFERENCES VENTA(NroBoleta) ON DELETE CASCADE ON  
                 UPDATE CASCADE,
    	FOREIGN KEY(RutCliente) REFERENCES CLIENTE(Rut) ON DELETE CASCADE ON 
                 UPDATE CASCADE,
    	FOREIGN KEY(RutVendedor) REFERENCES PERSONAL(RutPersonal) ON DELETE 
                 CASCADE ON UPDATE CASCADE
);
                      
INSERT INTO VtaEspecial
SELECT ADQUIERE.NroBoleta, ADQUIERE.Rut, ADQUIERE.RutVendedor, MAX(ADQUIERE.Cantidad)
FROM ADQUIERE
WHERE ADQUIERE.Cantidad>(SELECT AVG(ADQUIERE.Cantidad)
                                                     FROM ADQUIERE)
GROUP BY ADQUIERE.NroBoleta, ADQUIERE.Rut, ADQUIERE.RutVendedor

--[OPCION B]
