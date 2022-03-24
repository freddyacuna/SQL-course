 /*
 EJERCICIOS PROPUESTOS Y RESUELTOS DE SQL EN LA BASE DE DATOS BDEMPRESA
 
  
Escriba en MySQL las sentencias SQL para los siguientes requerimientos: 
*/
  
--  1.  Recuperar los nombres y ruts de empleados. 

Select Rut, Nombre 
From EMPLEADO

--  2.  Listar los números de departamento donde trabajan los empleados.

SELECT ND 
From EMPLEADO

--  3.  Listar los números de departamento donde trabajan los empleados, sin repetidos.

SELECT DISTINCT ND 
From EMPLEADO

-- recuperar los nombres y rut (sin repetidos) de empleados que tienen dependientes

SELECT DISTINCT EMPLEADO.RUT, NOMBRE
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.RUT = DEPENDIENTE.RUT

--  4.  De todos los empleados hombres que trabajan en el departamento de 1, se pide el nombre, apellidos y su fecha de nacimiento.

SELECT Nombre, APaterno, AMaterno, FechaNcto
FROM EMPLEADO
WHERE ND = 1 AND Género = “M”

-- De todos los empleados hombres que trabajan en el departamento de 1, se pide el nombre, apellidos y su fecha de nacimiento; mostrando también el nombre de departamento.

SELECT Nombre, APaterno, AMaterno, FechaNcto, NombreD
FROM EMPLEADO, DEPARTAMENTO
WHERE ND = 1 AND Género = "M" AND EMPLEADO.ND = DEPARTAMENTO.NúmeroD



--  5.  Recuperar el nombre, apellidos y dirección de empleados que tienen el salario igual o mayor que $2.200.000.


-- Una nueva versión de la respuesta anterior al requerimiento, que incluye también el 
-- atributo SALARIO:


-- Una versión del requerimiento, el cual muestra lo mismo, pero solo para empleados hombres:


--  6.  Recuperar los nombres y números de proyectos que operan en la localización “HOLANDA 2284”. 


--  7.  Recuperar los nombres y números de proyectos, junto con el nombre y número de departamento que lo controla. 

SELECT NombreP, NúmeroP, NombreD, NúmeroD
FROM PROYECTO, DEPARTAMENTO
WHERE ND = NúmeroD      -- es para reunir las combinaciones de proyectos con departamento

       -- Recuperar los nombres y ruts de empleados, junto el nombre del departamento; donde se
       -- califican los nombres de los atributos, según provengan de las tablas respectivas.
       -- Notar que se puede calificar los atributos (asociar el atributo con la tabla de dónde viene), 
       -- aunque en este ejemplo, no es necesario hacerlo, es decir, es opcional. 

SELECT EMPLEADO.Nombre, EMPLEADO.RUT, DEPARTAMENTO.NombreD
FROM EMPLEADO, DEPARTAMENTO
WHERE DEPARTAMENTO.NúmeroD = EMPLEADO.ND  

      -- recuperar los nombres y ruts de empleados, junto el nombre del departamento; donde no se
      -- califican los nombres de los atributos. Cada nombre de atributo en EMPLEADO y
      -- DEPARTAMENTO son diferentes, y no se hace necesario calificar. 

SELECT Nombre, RUT, NombreD
FROM EMPLEADO, DEPARTAMENTO
WHERE NúmeroD = ND  

--  8.  Recuperar los nombres y apellidos paternos de los empleados, junto con los nombres y números del departamento donde trabajan.


--  9. Recuperar los nombres y números de proyectos, junto con el nombre y número de departamento que lo controla, siempre que el proyecto opere en la localización “HOLANDA 2284”.

SELECT PROYECTO.NombreP, PROYECTO.NúmeroP, DEPARTAMENTO.NombreD, DEPARTAMENTO.NúmeroD
FROM PROYECTO, DEPARTAMENTO
WHERE PROYECTO.ND = DEPARTAMENTO.NúmeroD AND PROYECTO.LocalizaciónP = "HOLANDA 2284"

-- Una versión sin calificar los nombres de los atributos, excepto con ND y NúmeroD para que
-- quede explícito a qué tablas corresponden estos atributos. 

SELECT NombreP, NúmeroP, NombreD, NúmeroD
FROM PROYECTO, DEPARTAMENTO
WHERE LocalizaciónP = "Holanda 2284" AND PROYECTO.ND = DEPARTAMENTO.NúmeroD

Recuperar los nombres y apellidos paternos de empleados, junto con los nombres y números del departamento donde trabajan, y los nombres y números de proyectos asignados en estos departamentos. (Notar que no se pide que sean los proyectos donde trabajan los empleados, sino los proyectos asociados a los departamentos).


Recuperar los nombres y apellidos paternos de empleados, junto con los nombres y números del departamento donde trabajan, y los nombre y números  de proyectos asignados en estos departamentos, que operan en la localización “HOLANDA 2284”. (Notar que no se pide que sean los proyectos donde trabajan los empleados, sino los proyectos asociados a los departamentos).

SELECT Nombre, APaterno, NombreD, NúmeroD, NombreP, NúmeroP
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD           
              AND PROYECTO.ND = DEPARTAMENTO.NúmeroD 
             AND LocalizaciónP = "HOLANDA 2284"

Recuperar los nombres y apellidos paternos de empleados cuyo nombre empieza con la letra “B” y que están asignados a departamentos que controlan proyectos que operan en la localización “HOLANDA 2284”. (ver página 16 y el operador %; y página 18 para operaciones con cadenas).

SELECT Nombre, APaterno, NombreD, NúmeroD, NombreP, NúmeroP
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD AND PROYECTO.ND = DEPARTAMENTO.NúmeroD AND LocalizaciónP = "HOLANDA 2284"  AND Nombre LIKE  “B%”

-- Variante para recuperar solamente nombres de empleados con 5 caracteres. 

SELECT Nombre, APaterno, NombreD, NúmeroD, NombreP, NúmeroP
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD AND PROYECTO.ND = DEPARTAMENTO.NúmeroD AND LocalizaciónP = "HOLANDA 2284" AND Nombre LIKE "_____"

-- Variante para recuperar solamente nombres de empleados con 5 caracteres, en donde
-- además, se muestra la longitud del atributo nombre (LENGTH) y se renombra este 
-- atributo con LARGONOMBRE 

SELECT Nombre, APaterno, NombreD, NúmeroD, NombreP, NúmeroP, LENGTH(Nombre) AS LARGONOMBRE
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD AND PROYECTO.ND = DEPARTAMENTO.NúmeroD AND LocalizaciónP = "HOLANDA 2284" AND Nombre LIKE "_____"

-- Variante para recuperar solamente nombres de empleados con 5 caracteres, en donde
-- además, se muestra la longitud del atributo nombre (LENGTH) y se renombra este 
-- atributo con LARGONOMBRE.
-- También se agrega la función CURTIME, que devuelve la hora actual del sistema en el
-- momento que se ejecuta la consulta. El uso de esta función, es renombrada como HORACTUAL

SELECT Nombre, APaterno, NombreD, NúmeroD, NombreP, NúmeroP, LENGTH(Nombre) AS LARGONOMBRE, CURTIME() AS HORACTUAL
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD AND PROYECTO.ND = DEPARTAMENTO.NúmeroD AND LocalizaciónP = "HOLANDA 2284" AND Nombre LIKE "_____"


Recuperar los ruts y nombres de empleados, los nombres y números de proyectos donde trabajan, junto con las horas asignadas a este proyecto.

SELECT EMPLEADO.RUT, Nombre, NúmeroP, NombreP, Horas	
FROM TRABAJA_EN, EMPLEADO, PROYECTO
WHERE TRABAJA_EN.RUT = EMPLEADO.RUT AND TRABAJA_EN.NP = NúmeroP

-- versión con calificación de atributos.

SELECT EMPLEADO.RUT, EMPLEADO.Nombre, PROYECTO.NombreP, PROYECTO.NúmeroP, TRABAJA_EN.Horas
FROM EMPLEADO, PROYECTO, TRABAJA_EN
WHERE EMPLEADO.RUT = TRABAJA_EN.RUT AND PROYECTO.NúmeroP = TRABAJA_EN.NP

Recuperar los ruts y nombres de empleados, los nombres y números de proyecto donde trabajan, junto con las horas asignadas a este proyecto, siempre que trabajen 5 o más horas asignados a estos proyectos.


Recuperar nombres, y ruts de empleados que tienen dependientes.

SELECT E.Nombre, E.RUT
FROM EMPLEADO AS E, DEPENDIENTE AS D
WHERE E.RUT= D.RUT

-- versión que muestra también el nombre y parentesco del dependiente. 

SELECT E.Nombre, E.RUT, NombreDependiente, Parentesco
FROM EMPLEADO AS E, DEPENDIENTE AS D
WHERE E.RUT= D.RUT

Recuperar nombres y apellidos paternos de empleados, y los nombres de sus dependientes.

SELECT E.Nombre, E.APaterno, D.NombreDependiente
FROM EMPLEADO AS E, DEPENDIENTE AS D
WHERE D.RUT=E.RUT

-- variante agregando el parentesco

SELECT E.Nombre, E.APaterno, D.NombreDependiente, D.Parentesco
FROM EMPLEADO AS E, DEPENDIENTE AS D
WHERE D.RUT=E.RUT

Recuperar nombres de empleados, y los nombres de sus dependientes que tienen el mismo nombre.

SELECT EMPLEADO.Nombre, DEPENDIENTE.NombreDependiente, DEPENDIENTE.Parentesco
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.Nombre = DEPENDIENTE.NombreDependiente and DEPENDIENTE.RUT = EMPLEADO.RUT

-- versión equivalente con renombramiento de tablas. 

SELECT E.Nombre, D.NombreDependiente
FROM EMPLEADO as E, DEPENDIENTE as D
WHERE E.Nombre = D.NombreDependiente 

-- A continuación se ven ejemplos de operaciones en consultas SQL, ver páginas 16 y 18 de la 
-- “Unidad 6. SQL”

Listar los ruts de empleados, los números de proyectos y las horas en que estos empleados trabajan, siempre que estén dentro del rango de 5 a 7 horas inclusive (uso de BETWEEN).

SELECT *
FROM TRABAJA_EN
WHERE HORAS BETWEEN 5 AND 7

-- otra versión, utilizando operadores de comparación mayor igual, y menor igual

SELECT *
FROM TRABAJA_EN
WHERE HORAS >= 5 AND HORAS <= 7

Listar los ruts, nombres y apellidos de empleados, los nombres y números de proyectos y las horas en que estos empleados trabajan, siempre que estén dentro del rango de 5 a 7 horas inclusive.

SELECT Nombre, APaterno, NombreP, NúmeroP, Horas
FROM TRABAJA_EN, EMPLEADO, PROYECTO
WHERE EMPLEADO.RUT = TRABAJA_EN.RUT 
             AND NúmeroP = NP
            AND  HORAS BETWEEN 5 AND 7

-- Ejemplo de otras funciones - DAYNAME, y CURDATE (se pueden ver más funciones clasificadas por
-- su aplicación en tipos de datos fecha, cadenas, números, etc. en: funciones en MYSQL)
-- que pueden aplicarse directamente en la opción “SQL” de MySQL sobre cualquier base 
-- de datos, ya que no tiene la parte del FROM asociada a una tabla específica. 

SELECT IF(DAYNAME(CURDATE())="Wednesday", "Miércoles","--")

-- El ejemplo de arriba se puede aplicar a las fechas de nacimiento de los empleados:

SELECT IF(DAYNAME(FechaNcto)="Wednesday", "Miércoles","--"), FechaNcto
       FROM EMPLEADO

SELECT IF(MONTHNAME(FechaNcto)="June", "Cumple en junio!","Cumple otro mes"), FechaNcto
       FROM EMPLEADO

-- se sugiere revisar los ejemplos de la página 18 de la “Unidad 6. SQL”

Recuperar nombres y apellidos de empleados que al menos tienen una dependiente mujer; o dicho de otra manera: Recuperar nombres y apellidos de empleados que tienen dependientes mujeres. Generé una instrucción SQL que utiliza el concepto de tabla combinada (ver páginas 21 a 23 de la “Unidad 6. SQL”). 

SELECT E.Nombre, E.APaterno, D.NombreDependiente, D.Parentesco
FROM EMPLEADO AS E, DEPENDIENTE AS D
WHERE D.RUT=E.RUT AND D.GéneroDependiente="F"

-- versión sin renombramiento de las tablas EMPLEADO y DEPENDIENTE

SELECT EMPLEADO.Nombre, EMPLEADO.APaterno, DEPENDIENTE.NombreDependiente
FROM EMPLEADO, DEPENDIENTE
WHERE DEPENDIENTE.RUT = EMPLEADO.RUT AND DEPENDIENTE.GéneroDependiente ='F'

-- Construcción de la respuesta con tabla combinada. 
-- Empleados que tienen dependiente.

SELECT EMPLEADO.RUT, Nombre
FROM EMPLEADO, DEPENDIENTE AS D
WHERE EMPLEADO.RUT = D.RUT

-- Empleados que tienen dependientes, versión con tabla combinada

SELECT EMPLEADO.RUT, Nombre
FROM EMPLEADO, 
     (SELECT *
      FROM DEPENDIENTE) AS D
WHERE EMPLEADO.RUT = D.RUT

-- Empleados que tienen dependiente mujeres, con tabla combinada. Validar a dependientes mujeres 
-- fuera de la tabla combinada, aún no aprovecha del todo la potencialidad de la tabla combinada. 

SELECT EMPLEADO.RUT, Nombre
FROM EMPLEADO, 
     (SELECT RUT, GéneroDependiente 
      FROM DEPENDIENTE) AS D
WHERE EMPLEADO.RUT = D.RUT AND D.GéneroDependiente ="F"

-- Empleados que tienen dependiente mujeres, con tabla combinada, donde la validación de 
-- dependientes mujeres, está dentro de la tabla combinada, aprovechando la potencialidad de la 
-- tabla combinada. 

SELECT EMPLEADO.RUT, Nombre
FROM EMPLEADO, 
     (SELECT *
      FROM DEPENDIENTE
      WHERE GéneroDependiente= "F") AS D
WHERE EMPLEADO.RUT = D.RUT

(Ejemplo adicional a resolver con tabla combinada, sobre la base del requerimiento 9.). Recuperar los nombres y números de proyectos, junto con el nombre y número de departamento que lo controla, siempre que el proyecto opere en la localización “HOLANDA 2284”. Resolver con una tabla combinada. 

-- Respuesta sin tabla combinada. 

SELECT PROYECTO.NombreP, PROYECTO.NúmeroP, DEPARTAMENTO.NombreD,  
               DEPARTAMENTO.NúmeroD
FROM PROYECTO, DEPARTAMENTO
WHERE PROYECTO.ND = DEPARTAMENTO.NúmeroD 
              AND PROYECTO.LocalizaciónP = "HOLANDA 2284"

-- Respuesta utilizando tabla combinada. 

SELECT PHOLANDA.NombreP, PHOLANDA.NúmeroP, DEPARTAMENTO.NombreD, DEPARTAMENTO.NúmeroD
FROM (SELECT *
             FROM PROYECTO
             WHERE LocalizaciónP = "HOLANDA 2284") AS PHOLANDA ,  
                      -- tabla combinada con proyectos que están en la localización “HOLANDA 284”
             DEPARTAMENTO
                      -- Además de la tabla combinada anterior, se agrega de manera normal la tabla 
                      -- DEPARTAMENTO
WHERE PHOLANDA.ND = DEPARTAMENTO.NúmeroD
                      -- La reunión se hace entre DEPARTAMENTO y la tabla combinada PHOLANDA

-- Misma respuesta utilizando tabla combinada, sin comentarios entre medio.

SELECT PHOLANDA.NombreP, PHOLANDA.NúmeroP, DEPARTAMENTO.NombreD, DEPARTAMENTO.NúmeroD
FROM (SELECT *
             FROM PROYECTO
             WHERE LocalizaciónP = "HOLANDA 2284") AS PHOLANDA ,  
             DEPARTAMENTO
WHERE PHOLANDA.ND = DEPARTAMENTO.NúmeroD

-- EJERCICIOS REALIZADOS EN LA CLASE DEL 26 DE OCTUBRE

-- Selecciona nombres, apellidos y número de departamento de aquellos empleados que trabajan en los 
-- departamento 5, 1 o 2 únicamente
 
SELECT Nombre, APaterno, ND 
FROM EMPLEADO
WHERE ND = 5 OR ND = 1 OR ND = 2

-- Selecciona nombres, apellidos y número de departamento de aquellos empleados que trabajan en los 
-- departamento 5, 1 o 2 únicamente. Versión con el operador IN

SELECT Nombre, APaterno, ND 
FROM EMPLEADO
WHERE ND IN (5,1,2)


-- Selecciona los datos de los empleados que se llaman “Andrea” o “Maria”. 

SELECT Nombre, APaterno, ND 
FROM EMPLEADO
WHERE Nombre = "Andrea" OR Nombre = "Maria"

-- Selecciona los datos de los empleados que se llaman “Andrea” o “Maria”. Versión con el operador IN

SELECT * 
FROM EMPLEADO 
WHERE Nombre IN ("ANDREA", "MARIA")

-- Selecciona nombres y apellidos de empleados supervisores, que son los que tienen NULL en el valor
-- del atributo RUTSuperv. Uso del operador IS.

SELECT Nombre, APaterno 
FROM EMPLEADO
WHERE RUTSuperv  IS NULL;

-- Selecciona nombres y apellidos de empleados que no son supervisores, o bien son los supervisados
-- que son los que no tienen NULL en el valor del atributo RUTSuperv. Uso del operador IS NOT

SELECT Nombre, APaterno, RUTSuperv
FROM EMPLEADO
WHERE RUTSuperv IS NOT NULL

-- Lista ordenados por nombre de departamentos, los nombres y apellidos y los proyectos donde estos 
-- empleados trabajan en los departamentos respectivos. 

SELECT   Nombre, APaterno, NombreD, NúmeroD, NombreP,
               TRABAJA_EN.NP, TRABAJA_EN.HORAS 
FROM      EMPLEADO, DEPARTAMENTO, PROYECTO, TRABAJA_EN 
WHERE    EMPLEADO.ND=NúmeroD AND NúmeroD=PROYECTO.ND 
                AND EMPLEADO.RUT=TRABAJA_EN.RUT;

-- Lista ordenados por nombre de departamentos, los nombres y apellidos y los proyectos donde estos 
-- empleados trabajan en los departamentos respectivos. Versión con renombramiento de las tablas 
-- en FROM. 

SELECT NombreD, APaterno, Nombre, NombreP
FROM  DEPARTAMENTO, EMPLEADO AS E, TRABAJA_EN, PROYECTO AS P
WHERE NúmeroD=P.ND AND E.RUT=TRABAJA_EN.RUT AND  NP=NúmeroP 
ORDER BY NombreD, APaterno, Nombre;


-- Lista nombre, apellido de empleados que trabajan en el departamento de “Investigación”, junto con 
-- la dirección de este departamento.

SELECT Nombre, APaterno, Dirección
FROM   EMPLEADO, DEPARTAMENTO
WHERE  ND = NúmeroD AND NombreD =‘INVESTIGACIÓN';

-- Lista nombre, apellido de empleados que trabajan en el departamento de “Investigación”, junto con 
-- la dirección de este departamento. Versión con tabla combinada JOIN. 

SELECT Nombre, APaterno, Dirección
FROM   (EMPLEADO JOIN DEPARTAMENTO ON ND = NúmeroD) 
WHERE NombreD =‘INVESTIGACIÓN';


-- Lista todos los datos de los departamentos y de sus sucursales. 

SELECT * 
FROM  DEPARTAMENTO, SUCURSAL
WHERE DEPARTAMENTO.NúmeroD  =  SUCURSAL.NúmeroD;

-- Lista todos los datos de los departamentos y de sus sucursales. Versión tabla combinada con 
-- NATURAL JOIN. 

SELECT * 
FROM  DEPARTAMENTO NATURAL JOIN SUCURSAL;

-- Lista los nombres, apellidos y rut de empleados, junto con el nombre y parentesco de sus 
-- dependientes. Versión que usa la tabla combinada SELECT … FROM …

SELECT Nombre, APaterno, E.RUT, NombreDependiente, Parentesco
FROM  EMPLEADO AS E,
      (SELECT RUT, NombreDependiente, Parentesco
       FROM DEPENDIENTE) AS D
WHERE E.RUT = D.RUT
ORDER BY Nombre

-- Lista todos los datos de empleados

SELECT *
FROM EMPLEADO




-- Lista todos los datos de empleados. Versión con tabla combinada SELECT … FROM...

SELECT *
FROM (SELECT *
            FROM EMPLEADO) AS EMP

-- Lista los nombres, apellidos y rut de empleados, junto con el nombre y parentesco de sus 
-- dependientes mujeres; ordenados por nombre de empleado. 

SELECT Nombre, APaterno, E.RUT, NombreDependiente, Parentesco
FROM  EMPLEADO AS E, DEPENDIENTE AS D
WHERE E.RUT = D.RUT AND GéneroDependiente = "F"
ORDER BY Nombre

-- Lista los nombres, apellidos y rut de empleados, junto con el nombre y parentesco de sus 
-- dependientes mujeres;  ordenados por nombre de empleado. Versión que usa la tabla 
-- combinada SELECT … FROM …

SELECT Nombre, APaterno, E.RUT, NombreDependiente, Parentesco
FROM  EMPLEADO AS E,
      (SELECT RUT, NombreDependiente, Parentesco 
       FROM DEPENDIENTE
       WHERE GéneroDependiente = "F") AS DEPENDIENTESMUJERES
WHERE E.RUT = DEPENDIENTESMUJERES.RUT
ORDER BY Nombre

-- EJERCICIOS REALIZADOS EN LA CLASE DEL 28 DE OCTUBRE

-- ejercicios adicionales

-- Suma, promedio, mínimo, máximo de los salarios de empleados que trabajan en el mismo
-- departamento. Es decir, se agrupan los salarios de empleados que trabajan en el mismo 
-- departamento, para luego mostrar la suma, promedio, mínimo, máximo de sus salarios de cada grupo

SELECT SUM(Salario) AS SumaSalario, AVG(Salario) AS PromedioSalario, MIN(Salario) AS MinSalario, MAX(Salario) AS MaxSalario, ND 
FROM   EMPLEADO AS EMP
GROUP BY ND







-- Lista apellidos y nombres de empleados que no tienen dependiente. 

SELECT APaterno, Nombre 
FROM   EMPLEADO
WHERE (SELECT COUNT(*)
	   FROM DEPENDIENTE
	   WHERE EMPLEADO.RUT = DEPENDIENTE.RUT) = 0

Listar el valor más alto, más bajo, y el promedio de horas asignadas a empleados al trabajar en los proyectos. (Utilice las funciones agregadas MAX(), MIN() y AVG() de la página 24 de la “Unidad 6. SQL parte 1”)

SELECT MAX(Horas), MIN(Horas), AVG(Horas)
FROM TRABAJA_EN

SELECT  Salario, SUM(Salario) AS SUMAdeSalario
FROM EMPLEADO
GROUP by Salario

SELECT  SUM(Salario) AS SUMAdeSalario
FROM EMPLEADO

Listar los grupos de horas diferentes, de las horas asignadas a los empleados al trabajar en los proyectos. (Utilice las función GROUP BY explicado en las páginas 25 a 29 de la “Unidad 6. SQL parte 1”)

SELECT Horas
FROM TRABAJA_EN
GROUP BY Horas

Listar los grupos de horas diferentes, de las horas asignadas a los empleados al trabajar en los proyectos, junto con su cantidad o frecuencia para cada uno de estos grupos de horas. (Utilice las función GROUP BY y COUNT() explicados en las páginas 25 a 29 de la “Unidad 6. SQL parte 1”) 

SELECT Horas, COUNT(*)
FROM TRABAJA_EN
GROUP BY Horas

-- Otros ejemplos:
--
-- Grupos de departamentos diferentes donde trabajan los empleados:

SELECT ND 
FROM EMPLEADO
GROUP BY ND

-- Grupos de departamentos diferentes donde trabajan los empleados, y la cantidad de empleados
-- que trabajan en cada uno de estos grupos:

SELECT ND, COUNT(*) AS CANTdeEMP
FROM EMPLEADO
GROUP BY ND

-- El número más alto de departamentos, en donde trabajan los empleados:

SELECT MAX(TABLACONTEO.CANTdeEMP) AS CANTMAXdeEMP
FROM 
   (SELECT ND, COUNT(*) AS CANTdeEMP 
    FROM EMPLEADO
    GROUP BY ND) AS TABLACONTEO

Recuperar los nombres de todos los empleados que tienen dos o más familiares (Utilice una tabla combinada y las funciones COUNT() y GROUP BY explicados en las páginas 25 a 29 de la “Unidad 6. SQL parte 1”) 

SELECT APaterno, Nombre 
FROM EMPLEADO, 
     (SELECT RUT, COUNT(*) AS CantidadDependiente
      FROM DEPENDIENTE
      GROUP BY RUT) AS TABLACANTIDADEPENDIENTE
WHERE EMPLEADO.RUT = TABLACANTIDADEPENDIENTE.RUT AND CantidadDependiente >= 2

-- otra versión 

SELECT APaterno, Nombre 
FROM EMPLEADO
WHERE (SELECT COUNT(*)
                FROM DEPENDIENTE
                WHERE EMPLEADO.RUT = DEPENDIENTE.RUT) >= 2

Mostrar los grupos de valores distintos del atributo Género que tienen los empleados. (Utilice la cláusula para agrupar valores GROUP BY, explicado en las páginas 25 a 29 de la “Unidad 6. SQL parte 1”).

-- La siguiente instrucción agrupa los valores diferentes del atributo Género, para lo cuál
-- es necesario usar GROUP BY seguida del atributo Género, y proyectar en SELECT 
-- el mismo atributo Género:

SELECT Género
FROM EMPLEADO
GROUP BY Género;

-- La respuesta en PhPMyAdmin será dos grupos de valores diferentes; es decir, F y M: 




Mostrar los grupos de valores distintos del atributo Género que tienen los empleados, junto con la cantidad de empleados que corresponde a cada grupo. (Utilice la cláusula para agrupar valores GROUP BY, junto con funciones agregadas como COUNT(), explicados en las páginas 24 a 29 de la “Unidad 6. SQL parte 1”)

-- Si se quiere saber cuántos empleados corresponden a cada uno de los grupos de 
-- valores diferentes de Género encontrados con GROUP BY, se puede utilizar COUNT(),
-- ver página 36 para la función COUNT():

SELECT Género, COUNT(*)
FROM EMPLEADO
GROUP BY Género;

-- La respuesta en PhPMyAdmin será 8 y 10 para cada grupo diferente de valores F y M 
-- que corresponde a 8 mujeres, y 10 hombres: 



-- Para aclarar la respuesta anterior, a los valores obtenidos en COUNT(*) podemos 
-- renombrarlos con otro nombre, como ser NÚMEROGRUPOXGENERO :

SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
FROM EMPLEADO
GROUP BY Género;

-- Siendo su resultado una tabla con atributos Género, y NÚMEROGRUPOXGENERO:



Mostrar todos los datos de los departamentos en los que trabajan más de 3 empleados. 

SELECT NombreD, NúmeroD, FechaInicJefe, NúmeroD 
FROM DEPARTAMENTO,
            (SELECT ND, COUNT(*) AS CANTIDAD
              FROM EMPLEADO
              GROUP BY ND) AS TABLA1
WHERE NúmeroD = TABLA1.ND AND TABLA1.CANTIDAD > 3

Se requiere saber si entre los empleados, son los hombres o las mujeres más numerosos. (Utilice la cláusula para agrupar valores GROUP BY, junto con funciones agregadas como COUNT() y MAX(), explicados en las páginas 24 a 29 de la “Unidad 6. SQL parte 1”)

-- Para lograr lo anterior, se requiere construir la instrucción SQL por partes, lo cual será explicado 
-- en detalle, utilizando cláusulas adicionales como MAX(), y el uso de tablas combinadas,  
--
-- Primero combinaremos los resultados de la pregunta 31, utilizando su instrucción SQL marcada 
-- en amarillo, a la que re-nombraremos en el SELECT interno con el nombre
-- TABLAGRUPOXGENEROYCANTIDAD, y se aplicará un SELECT  * externo, el que tomará los 
-- mismos atributos de salida Género y NÚMEROGRUPOXGENERO del resultado del SELECT 
-- interno marcado en amarillo:

SELECT *
FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD;

-- por lo que el resultado será igual que antes:



-- A la instrucción anterior podemos proyectar explícitamente cada uno de sus atributos en lugar
-- de utilizar * después del SELECT (referiré a esta instrucción SQL con TABLA1):

SELECT Género, NÚMEROGRUPOXGENERO
FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD;

-- Siendo el resultado igual que antes:



-- Ahora podemos aplicar la función MAX() a la instrucción TABLA1, pero sólo sobre el 
-- atributo NÚMEROGRUPOXGENERO, al que nombraremos con GRUPOMAXIMO, 
-- tal y como puede verse en la siguiente instrucción (referiré a esta instrucción SQL con
-- TABLA2):

SELECT MAX(NÚMEROGRUPOXGENERO) AS GRUPOMAXIMO
FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD;

-- que nos dará una tabla con el valor más grande entre 8 y 10, es decir 10:



-- para saber si es F o M el grupo más grande, podemos volver a hacer uso del concepto 
-- de tabla combinada entre la instrucción SQL llamada TABLA1 (en amarillo) y la instrucción 
-- SQL llamada TABLA2 (en verde), de la siguiente manera:

SELECT *
FROM     
             (SELECT Género, NÚMEROGRUPOXGENERO
              FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
                         FROM EMPLEADO
                         GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDA) AS TABLA1
              ,       
(SELECT MAX(NÚMEROGRUPOXGENERO) AS GRUPOMAXIMO
 FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD) AS TABLA2
;

-- note que ambas tablas  TABLA1 y  TABLA2 están dentro de un FROM como tablas
-- independientes separadas por una coma y entre paréntesis, y cada una de ellas renombradas 
-- con  TABLA1 y  TABLA2 respectivamente; y al ejecutarse el resultado producido será:



-- Finalmente, al SELECT externo de la instrucción de arriba, nos queda proyectar el atributo
-- Género, y agregar en su claúsula WHERE, la condición de igualdad entre los atributos
-- NÚMEROGRUPOXGENERO y GRUPOMAXIMO, de la siguiente manera:


SELECT Género
FROM     
             (SELECT Género, NÚMEROGRUPOXGENERO
              FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
                         FROM EMPLEADO
                         GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDA) AS TABLA1
              ,       
(SELECT MAX(NÚMEROGRUPOXGENERO) AS GRUPOMAXIMO
 FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD) AS TABLA2
WHERE  NÚMEROGRUPOXGENERO =  GRUPOMAXIMO;

-- lo anterior producirá el resultado deseado; es decir ‘M’:



-- Si más aun, quiere dar una respuesta concreta, utilice la cláusula IF(), similar a la de EXCEL
-- para que según el valor del atributo Género, es decir, F ó M; se de un mensaje en la respuesta:

SELECT IF(Género = 'F','HAY MAS MUJERES', 'HAY MAS HOMBRES') AS RESPUESTA
FROM     
             (SELECT Género, NÚMEROGRUPOXGENERO
              FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
                         FROM EMPLEADO
                         GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDA) AS TABLA1
              ,       
(SELECT MAX(NÚMEROGRUPOXGENERO) AS GRUPOMAXIMO
 FROM (SELECT Género, COUNT(*) AS NÚMEROGRUPOXGENERO
             FROM EMPLEADO
             GROUP BY Género) AS TABLAGRUPOXGENEROYCANTIDAD) AS TABLA2
WHERE  NÚMEROGRUPOXGENERO =  GRUPOMAXIMO;

Recuperar el nombre, apellido paterno y dirección de empleados que tienen el sueldo más alto que $100.000; y que al menos trabajan en dos proyectos.

SELECT Nombre, APaterno, Dirección
FROM EMPLEADO,
           (SELECT COUNT(*) AS CANTIDAD, RUT
            FROM TRABAJA_EN
            GROUP BY RUT) AS TABLA1
WHERE EMPLEADO.RUT = TABLA1.RUT AND SALARIO > 100000 AND TABLA1.CANTIDAD >= 2;

Listar nombre y número de cada departamento que tiene al menos 2 proyectos.

SELECT NombreD, NúmeroD
FROM DEPARTAMENTO,
           (SELECT COUNT(*) AS CANTIDAD, ND
            FROM PROYECTO
            GROUP BY ND) AS TABLA1
WHERE DEPARTAMENTO.NúmeroD = TABLA1.ND AND TABLA1.CANTIDAD > 1;

Recuperar los nombres y números de departamento, junto con la cantidad de sucursales que tiene cada departamento.
 
SELECT NombreD, DEPARTAMENTO.NúmeroD, CANTIDADLOCALIZACIONES
FROM DEPARTAMENTO, (SELECT NúmeroD, COUNT(NúmeroD) AS CANTIDADLOCALIZACIONES
               	                     FROM SUCURSAL
        	                                GROUP BY NúmeroD) AS NUMEROD_Y_CANTIDAD_LOCALIZACIONES
WHERE DEPARTAMENTO.NúmeroD = NUMEROD_Y_CANTIDAD_LOCALIZACIONES.NúmeroD

Recuperar los nombres y números de departamento, junto con la cantidad de sucursales que tiene cada departamento, siempre que tenga el departamento tenga 2 o más sucursales.

SELECT NombreD, DEPARTAMENTO.NúmeroD, CANTIDADLOCALIZACIONES
FROM DEPARTAMENTO, (SELECT NúmeroD, COUNT(NúmeroD) AS CANTIDADLOCALIZACIONES
               	                     FROM SUCURSAL
        	                                GROUP BY NúmeroD) AS NUMEROD_Y_CANTIDAD_LOCALIZACIONES
WHERE DEPARTAMENTO.NúmeroD = NUMEROD_Y_CANTIDAD_LOCALIZACIONES.NúmeroD
               AND NUMEROD_Y_CANTIDAD_LOCALIZACIONES.CANTIDADLOCALIZACIONES > 1


Recuperar los nombres de departamento que tienen la mayor cantidad de localizaciones.
 
SELECT NombreD, MAXIMOLOCALIZACIONES, CANTIDAD_LOCALIZACIONES
 
FROM
 
(SELECT MAX(CANTIDAD_LOCALIZACIONES) AS MAXIMOLOCALIZACIONES
FROM (SELECT COUNT(NúmeroD) AS CANTIDAD_LOCALIZACIONES
  	FROM SUCURSAL
  	GROUP BY NúmeroD) AS LISTA_CANTIDAD_LOCALIZACIONES) AS        
                   MAXIMO_LOCALIZACIONES

,
 
(SELECT NOMBRED, CANTIDAD_LOCALIZACIONES
FROM DEPARTAMENTO AS DEPTO
            , 
            (SELECT NúmeroD, COUNT(NúmeroD) AS CANTIDAD_LOCALIZACIONES
             FROM SUCURSAL
             GROUP BY NúmeroD) AS NUMEROD_Y_CANTIDAD_LOCALIZACIONES
WHERE DEPTO.NúmeroD = NUMEROD_Y_CANTIDAD_LOCALIZACIONES.NúmeroD) AS 
              LISTA_NUMEROD_Y_CANTIDAD_LOCALIZACIONES
 
WHERE MAXIMOLOCALIZACIONES = CANTIDAD_LOCALIZACIONES;

-- EJERCICIOS REALIZADOS EN LA CLASE DEL 2 DE NOVIEMBRE - CONJUNTOS

Recuperar los nombres, y ruts de empleadas mujeres.

SELECT Nombre, RUT
FROM EMPLEADO
WHERE Género = "f"

Recuperar los nombres, y ruts de empleados hombres.

SELECT Nombre, RUT
FROM EMPLEADO
WHERE Género = "M"

-- Ejemplos de operaciones de conjuntos páginas 30 a 32 de  la “Unidad 6. SQL parte 1”:

Recuperar los nombres, y ruts de empleados hombres y mujeres, utilizando la operación de UNION .

SELECT Nombre
FROM EMPLEADO
WHERE Género = "f"

UNION

SELECT Nombre
FROM EMPLEADO
WHERE Género = "m"

-- Otra versión, que devuelve también la unión de empleados mujeres y hombres, esta vez con los 
-- datos del resultado de la unión, ordenados por el apellido paterno

SELECT *
FROM 
          (SELECT Nombre, APaterno, Salario
           FROM EMPLEADO
            WHERE Género = "m"

            UNION

            SELECT Nombre, APaterno, Salario
            FROM EMPLEADO
            WHERE Género = "f") AS TABLAUNIONHOMBREMUJERES

ORDER BY TABLAUNIONHOMBREMUJERES.APaterno

-- En este ejemplo, se aplica la intersección entre las tablas de empleados hombres y mujeres
-- utilizando el formato de operación de intersección que se mostró en la página 32 de la  “Unidad 6. SQL”

SELECT A.RUT, A.Nombre
FROM (SELECT RUT, Nombre, APaterno, Salario
             FROM EMPLEADO
             WHERE Género = "M") AS A 
      
             INNER JOIN 
      
            (SELECT RUT, Nombre, APaterno, Salario
             FROM EMPLEADO
             WHERE Género = "f") AS B 
       
             ON A.RUT = B.RUT







Recuperar nombres, y ruts de empleados que no tienen dependientes (lo opuesto al requerimiento 15). Se sugiere utilizar el concepto de tabla combinada (ver páginas 21 a 23 de la “Unidad 6. SQL parte 1”), y operaciones de conjuntos - todos los empleados, menos los empleados que tienen dependientes (ver páginas 30 y 32 de la “Unidad 6. SQL parte 1”). 

-- Utilizar una tabla combinada  EMPLEADOSconDEPENDIENTES, la cual aún no representa la respuesta al requerimiento:

SELECT EMPLEADOSconDEPENDIENTES.NOMBRE, EMPLEADOSconDEPENDIENTES.RUT
FROM
     (SELECT DISTINCT Nombre, EMPLEADO.RUT
     FROM EMPLEADO, DEPENDIENTE
     WHERE EMPLEADO.RUT = DEPENDIENTE.RUT) AS EMPLEADOSconDEPENDIENTES

-- Aplicar la operación de diferencia de todos los empleados, menos los que tienen dependientes, es
-- decir a la tabla combinada EMPLEADOSconDEPENDIENTES (ver páginas 21 a 23 de la
--  “Unidad 6 SQL parte 1”). Luego, la respuesta es:

SELECT EMPLEADO.NOMBRE, EMPLEADO.RUT
FROM EMPLEADO 

            LEFT JOIN 
 
            (SELECT DISTINCT Nombre, EMPLEADO.RUT
              FROM EMPLEADO, DEPENDIENTE
              WHERE EMPLEADO.RUT = DEPENDIENTE.RUT) AS EMPLEADOSconDEPENDIENTES
     
            ON EMPLEADO.RUT = EMPLEADOSconDEPENDIENTES.RUT 

WHERE EMPLEADOSconDEPENDIENTES.RUT IS NULL

Recuperar nombres, y ruts de empleados; utilizando operaciones de unión y diferencia (tomando en cuenta las respuestas 36. y 37., es decir uniendo los empleados que tienen dependientes, con los que no tienen dependientes, que dará el mismo resultado que la 1.)

SELECT EMPLEADO.NOMBRE, EMPLEADO.RUT
FROM EMPLEADO 

            LEFT JOIN 
 
           (SELECT DISTINCT Nombre, EMPLEADO.RUT
            FROM EMPLEADO, DEPENDIENTE
            WHERE EMPLEADO.RUT = DEPENDIENTE.RUT) AS EMPLEADOSconDEPENDIENTES
     
           ON EMPLEADOSconDEPENDIENTES.RUT = EMPLEADO.RUT

WHERE EMPLEADOSconDEPENDIENTES.RUT IS NULL

UNION

SELECT DISTINCT Nombre, EMPLEADO.RUT
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.RUT = DEPENDIENTE.RUT

-- Consultas anidadas
-- Utilizando IN responda las preguntas 39. a 59. Ver páginas 33 a 38 de la “Unidad 6. SQL parte 1” 

-- Ejemplo simple de IN con conjuntos explícitos de valores 
--
-- 4 IN (1,2,4) es Verdad, 6 IN (1,2,4) es Falso


Obtenga los nombres y apellidos paternos únicos de empleados que tienen personas dependientes de ellos.

-- Versión sin IN

SELECT DISTINCT Nombre, APaterno
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.RUT = DEPENDIENTE.RUT;

-- Versión con IN

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (SELECT RUT 
         	                  FROM DEPENDIENTE
         	                 );

-- Versión con IN con calificación de los atributos

SELECT Nombre, EMPLEADO.RUT
FROM   EMPLEADO
WHERE  EMPLEADO.RUT IN (SELECT DEPENDIENTE.RUT
                        FROM DEPENDIENTE
                        WHERE DEPENDIENTE.RUT = EMPLEADO.RUT
                        )



--- Ejemplos de uso de  conjuntos explícitos de valores
-- Lista nombres y apellidos de empleados con RUT 1, 2 y 3. En este caso el resultado será vacío. 

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (1,2,3)

-- Lista nombres y apellidos de empleados con RUT “10000564”, o “10987989” 

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (“10000564”,“10987989”)

Obtenga los nombres y apellidos de empleados que no tienen personas dependientes de ellos. (Mismo resultado que la pregunta 37.)

-- Versión con IN

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT NOT IN (SELECT RUT 
         	                          FROM DEPENDIENTE
         	                         );

-- La lógica de la negación, puede también utilizarse con el operador LIKE. Abajo se muestra un 
-- ejemplo para recuperar nombres de empleados que no empiezan con la letra “J”

SELECT Nombre,APaterno
FROM EMPLEADO
WHERE NOMBRE NOT LIKE "J%"


Obtenga los nombres y apellidos paternos únicos de empleados que tienen personas dependientes de ellos.
 
-- Versión sin IN

SELECT DISTINCT Nombre, APaterno
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.RUT = DEPENDIENTE.RUT;

-- Versión con IN 

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (SELECT RUT
         	                 FROM DEPENDIENTE
         	                 WHERE EMPLEADO.RUT = DEPENDIENTE.RUT);
 
Se pide el nombre y apellido de aquellos empleados que están trabajando en el proyecto número 1.

-- versión sin IN

SELECT Nombre, APaterno, FechaNcto, NombreD, NombreP
FROM EMPLEADO, DEPARTAMENTO, PROYECTO
WHERE EMPLEADO.ND = DEPARTAMENTO.NúmeroD 
               AND NúmeroD = PROYECTO.ND 
               AND PROYECTO.NúmeroP = 1


-- versión con IN
 
SELECT Nombre, APaterno
FROM EMPLEADO
WHERE ND IN (SELECT NúmeroD
         	              FROM DEPARTAMENTO
         	              WHERE NúmeroD IN (SELECT ND
                                                               FROM PROYECTO
                                                               WHERE NúmeroP = 1))

Listar los nombres y apellidos de los empleados que son Jefes de Departamento, y no son supervisores de otros empleados.


Listar  los nombres de departamento que operan en la localización de Houston, o bien tienen proyectos que operan en la localización de Houston.

Obtenga los nombres y apellidos de empleados que son jefes de departamento, y que tienen dos personas dependientes de ellos.

Seleccionar todos los empleados tales que no exista un proyecto controlado por el departamento 5 en el cual no trabaje el empleado.

Obtener los datos de los empleados que trabajan en todos los proyectos en los que trabaja 'John Smith'.

Listar los nombres de proyectos que tienen más localizaciones, y más horas acumuladas por empleados que no son jefes.
 
Listar el nombre y apellido de los empleados que tienen dependientes.

-- Versión sin IN

SELECT Nombre, APaterno
FROM EMPLEADO, DEPENDIENTE
WHERE EMPLEADO.RUT  = DEPENDIENTE.RUT

-- Versión con IN

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (SELECT RUT
                            FROM DEPENDIENTE);

Listar el nombre y apellido de los empleados que son supervisores.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (SELECT RUTSuperv
                            FROM EMPLEADO);

Listar el nombre y apellido de los empleados que tienen dependientes y que son supervisores.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT IN (SELECT RUT
                            FROM DEPENDIENTE)
              AND
              RUT IN (SELECT RUTSuperv
                            FROM EMPLEADO);
              
-- Lo anterior puede hacerse también con una instrucción SQL correlacionada; es decir, sin 
-- la claúsula IN.  La diferencia entre ambas alternativas es que con la correlacionada 
-- se podría también recuperar datos de dependiente si es que se requiere, y que la
-- consulta puede ser más difícil de entender que con la versión IN:

SELECT DISTINCT E.Nombre, E.APaterno
FROM EMPLEADO AS E, EMPLEADO AS S,  DEPENDIENTE 
WHERE E.RUT = DEPENDIENTE.RUT
              AND
              E.RUT = S.RUTSuperv;
 
Listar el nombre y apellido de los empleados que NO tienen dependientes.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE RUT NOT IN (SELECT RUT
                                     FROM DEPENDIENTE);

Listar el nombre y apellido de los empleados que trabajan en el departamento 5.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE ND IN (SELECT NúmeroD
                            FROM DEPARTAMENTO
                            WHERE NúmeroD = 5);

Listar el nombre y apellido de los empleados que NO trabajan en el departamento 5.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE ND NOT IN (SELECT NúmeroD
                            FROM DEPARTAMENTO
                            WHERE NúmeroD = 5);

Listar el nombre y número de departamentos que NO tienen proyectos.

Recuperar nombres y apellidos de los empleados que trabajan en los departamentos 1, 2 y 5 solamente.

SELECT Nombre, APaterno
FROM EMPLEADO
WHERE ND IN (1, 2, 5);

Recuperar nombres y apellidos de los empleados que trabajan 3, 7 ó 10 horas en proyectos.

SELECT Nombre, APaterno, HORAS
FROM TRABAJA_EN, EMPLEADO
WHERE HORAS IN (3, 7, 10) AND TRABAJA_EN.RUT = EMPLEADO.RUT

Recuperar nombres y apellidos de empleados, y nombres y apellidos de sus dependientes que son ‘HIJO’ o ‘ESPOSA’.

Recuperar los nombres y apellidos de empleados que tengan un familiar con el mismo nombre y género, y que sean jefes de departamento.

