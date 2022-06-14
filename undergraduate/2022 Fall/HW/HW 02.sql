-- REQUERIMIENTOS DE CONSULTAS

-- 1. Muestre la cantidad de personas que cuentan con cada tipo de acreditación, además de su porcentaje con respecto al total de personas.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion

|Tipo Acreditación | N  | % |
|------------------|----|---|
|SeñalC            |  # | % |
|SeñalP            |  # | % |

SELECT T1.`Tipo Acreditacion`,
       CONCAT(TRUNCATE((T1.Cantidad/T2.TOTAL)*100, 2), "%") AS Porcentaje
FROM
  (SELECT PERSONA.IDAcreditacion AS `Tipo Acreditacion`,
          COUNT(PERSONA.RUT) AS Cantidad
   FROM PERSONA
   GROUP BY PERSONA.IDAcreditacion) AS T1,

  (SELECT COUNT(PERSONA.RUT) AS TOTAL
   FROM PERSONA) AS T2
WHERE T1.`Tipo Acreditacion` IS NOT NULL  
ORDER BY `T1`.`Tipo Acreditacion` ASC



------------Correcta

SELECT 
CASE
    WHEN T1.`TAcreditacion` = 2 THEN 'Credencial'
    WHEN T1.`TAcreditacion` = 3 THEN 'Pensión'
    ELSE 'Ambas'
END AS `Tipo Acreditación`, T1.Cantidad,
       CONCAT(TRUNCATE((T1.Cantidad/T2.TOTAL)*100, 2), "%") AS Porcentaje
FROM
  (SELECT PERSONA.IDAcreditacion AS `TAcreditacion`,
          COUNT(PERSONA.RUT) AS Cantidad
   FROM PERSONA
   GROUP BY PERSONA.IDAcreditacion) AS T1,

  (SELECT COUNT(PERSONA.RUT) AS TOTAL
   FROM PERSONA) AS T2
WHERE T1.`TAcreditacion` IN (2,3,4)
ORDER BY `T1`.`TAcreditacion` ASC


-- 2. Se le pide que muestre la cantidad de emprendimientos que hay por rubro.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT

|Tipo Rubro | N  |
|-----------|----|
|1          |  # |
|2          |  # |
|...        |  # |

------------Correcta

SELECT RubroE AS RUBRO, COUNT(RubroE) AS `Q Emprendimientos`
FROM PERSONA P
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT
WHERE RubroE IS NOT NULL
GROUP BY RubroE  
ORDER BY COUNT(RubroE)  DESC


-- 3. Muestre un listado de las personas con un nivel educativo medio completo.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT
LEFT JOIN NIVEL_EDUCACION ED ON ED.RUT=P.RUT

-----------Correcta

SELECT P.RUT, Nombre
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT
LEFT JOIN NIVEL_EDUCACION ED ON ED.RUT=P.RUT
WHERE Completitud in ('completo','completa') and SenalM=1

-- NIVEL_EDUCACION (IDNivel, Completitud, RUT, SenalB, SenalT, TituloProfesionT, SenalM, SenalU, TituloProfesionU)

| RUT   |
|-------|
| 1     |
| 2     |
| ...   |


/*
4. Se pide que muestre las dos nacionalidades, de los usuarios nacidos entre 1980 y 1989, que tienen mayor
representatividad en la plataforma, sin considerar Chile. Para esto genere una lista que contenga la
nacionalidad junto con su porcentaje de representatividad en relación al total.
*/

SELECT * -- Nacionalidad
FROM PERSONA P
WHERE FechaNac 
WHERE P.Nacionalidad <> 'Chile'
SELECT year(`FechaNac`) FROM `PERSONA`


| Nacionalidad   |  RANK % Representación |
|----------------|------------------------|
| Nacionalidad 1 |    1er %               |
| Nacionalidad 2 |    2do %               |

SELECT * FROM `PERSONA`
WHERE  year(`FechaNac`)>=1980 and year(`FechaNac`)<=1989
AND Nacionalidad <> 'Chile' 

---- CORRECTO

SELECT T1.`Tipo Nacionalidad`,
       CONCAT(TRUNCATE((T1.Cantidad/T2.TOTAL)*100, 2), "%") AS Porcentaje
FROM
  (SELECT PERSONA.Nacionalidad AS `Tipo Nacionalidad`,
          COUNT(PERSONA.RUT) AS Cantidad
   FROM PERSONA
   WHERE  year(`FechaNac`)>=1980 and year(`FechaNac`)<=1989
       AND Nacionalidad <> 'Chile'
   GROUP BY PERSONA.Nacionalidad) AS T1,

  (SELECT COUNT(PERSONA.RUT) AS TOTAL
   FROM PERSONA) AS T2
WHERE T1.`Tipo Nacionalidad` IS NOT NULL  
ORDER BY `Porcentaje`  DESC
LIMIT 2

/*
5. Se requiere conocer cuáles han sido las 10 regiones con más presencia en la plataforma. Para esto, genere una
tabla que contenga la cantidad de personas por cada región. Considere que los resultados deben estar
ordenados de forma descendente.
*/

SELECT * --Region
FROM PERSONA P

-- QUITAR VACIOS

|Region      | N  |
|------------|----|
|R1          |  # |
|R2          |  # |
|...         |  # |

-----CORRECTO
SELECT Region, COUNT(Region) AS `Q de Personas`
FROM PERSONA P
WHERE Region IS NOT NULL
GROUP BY Region  
ORDER BY COUNT(Region)  DESC
LIMIT 10

/*
6. Se le solicita que muestre la cantidad de personas que no tienen credencial, pero que sí tienen interés en
conseguirla, junto a su rango porcentual del registro social de hogares.
*/

SELECT RangoPorcentual, COUNT(RangoPorcentual)
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN FICHA_RSH B ON A.NroRSH=P.NroRSH
WHERE IDAcreditacion in (1,3) and InteresCredencial = 'SI'
GROUP BY RangoPorcentual

|RSH         | N  |
|------------|----|
|0-40%       |
|41%-50%     |
|51%-60%     |
|61%-70%     |
|71%-80%     |
|81%-90%     |

---CORRECTA

SELECT RangoPorcentual, COUNT(RangoPorcentual) AS `Q personas sin Credencial`
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN FICHA_RSH B ON B.NroRSH=P.NroRSH
WHERE A.IDAcreditacion in (1,3) and InteresCredencial = 'SI' AND RangoPorcentual IS NOT NULL AND RangoPorcentual <> ''
GROUP BY RangoPorcentual

/*
7. Se solicita mostrar el nombre y la edad (en años) de las personas que han realizado un postgrado y han
recibido ayuda técnica.
*/


SELECT Nombre, FechaNac -- (en años)
FROM PERSONA

POSTGRADO -- Excluir los 1 NULL
SE_PROPORCIONA

|NOMBRE         | EDAD  |
|---------------|-------|
|Name 1         | #     |


--- CORRECTO

SELECT Nombre, YEAR(NOW())- YEAR(FechaNac) AS EDAD FROM PERSONA PE LEFT JOIN POSTGRADO PO ON PE.RUT = PO.RUT LEFT JOIN SE_PROPORCIONA PRO ON PRO.RUT = PO.RUT
WHERE IDPG IS NOT NULL AND Ultimocurso IS NOT NULL AND IDAyudaT IS NOT NULL


/*
8. Se requiere conocer el nombre de la persona con mayor antigüedad lograda en el programa de inclusión
laboral, además de si tiene experiencia en relatoría o no.
*/

|NOMBRE         | EDAD  |
|---------------|-------|
|Name 1         | #     |

SELECT Nombre
FROM PERSONA

INCLUSION LABORAL 
FechaInicContrato
FechaTermContrato

FICHA_LABORAL
ExpRelatoria <> NULL

--YEAR(NOW())- YEAR(FechaNac)

SELECT Nombre, 
CASE
    WHEN FechTermContrato = NULL THEN YEAR(NOW())- YEAR(FechaNac)
    ELSE YEAR(NOW())- YEAR(FechaNac)
END AS EDAD 
FROM PERSONA PE 
LEFT JOIN POSTGRADO PO ON PE.RUT = PO.RUT 
LEFT JOIN SE_PROPORCIONA PRO ON PRO.RUT = PO.RUT
LEFT JOIN `INCLUSION LABORAL` ILAB ON ILAB.RUT = PO.RUT
LEFT JOIN FICHA_LABORAL FLab ON FLab.RUT = FLab.RUT
WHERE ExpRelatoria <> NULL

/*
9. Se requiere conocer la cantidad de prácticas promedio de las personas por edad. Para esto, genere una tabla
con la edad, y el número (entero) promedio de prácticas.
*/

SELECT EDAD
FROM PERSONA
REALIZA

SELECT * -- FechaNac
FROM PERSONA

SELECT COUNT(*)
FROM
REALIZA


|EDAD #         | AVG PRACTIVA  |
|---------------|---------------|
|Name 1         | #             |


/*
10. Se requiere conocer cuál fue la empresa con mayor participación en el programa de inclusión laboral. Para
esto, genere una tabla que contenga el nombre de la empresa, y la cantidad de veces que ésta participó del
programa.
*/


SELECT EmpresaIL
FROM INCLUSION_LABORAL



SELECT EmpresaIL, COUNT(`EmpresaIL`) FROM `INCLUSION_LABORAL` GROUP BY `EmpresaIL`  
ORDER BY COUNT(`EmpresaIL`)  DESC

/*
11. Se le solicita mostrar el tipo de ayuda técnica que más veces ha sido prestada. Además, presente dos
columnas que indiquen si la ayuda ha sido otorgada para una persona que ha estado en un programa de
inclusión laboral, o de práctica, indicando con un Sí o un No si la ayuda ha sido usada en el respectivo ítem.
Las columnas deben llamarse “Ayuda IL” y “Ayuda Practica”.
*/


SELECT EmpresaIL
FROM INCLUSION_LABORAL



SELECT EmpresaIL, COUNT(`EmpresaIL`) FROM `INCLUSION_LABORAL` GROUP BY `EmpresaIL`  
ORDER BY COUNT(`EmpresaIL`)  DESC

/*
12. Se requiere conocer los 3 canales de captación existentes más efectivos, considerando todos los años
presentes en la base de datos.
*/

SELECT CanalCaptacion, count(CanalCaptacion) FROM PERSONA group by CanalCaptacion ORDER BY count(CanalCaptacion) ASC


-- REQUERIMIENTOS DE ACTUALIZACIÓN
/*
13. Se requiere eliminar de la tabla FICHA_RSH a las fichas que no tengan rango porcentual asociado.
*/
-- antes (total de 269)

DELETE
FROM FICHA_RSH
WHERE RangoPorcentual = ' '

-- ahora (total de 244)

/*
14. Suponga que se efectúa un cambio en el programa, de manera que, a cada persona que haya realizado más de
2 prácticas y pertenezca a algún pueblo originario, ahora se le tramitará en seguida su acreditación de pensión
(si es que no la tenía). Efectúe estos cambios en la base de datos.
*/

-- Se tiene que total de 391, han realizado IDPráctica

-- total de 339 personas (RUT) han realizado al menos 1 práctica.

SELECT RUT, COUNT(RUT) FROM `REALIZA`
GROUP BY RUT  
ORDER BY COUNT(RUT)  DESC

-- (total de 3) personas han realizado al más de 2 prácticas
SELECT RUT FROM ( SELECT RUT, COUNT(RUT) AS NPRACTICA FROM `REALIZA` GROUP BY RUT ) AS NPR WHERE NPRACTICA >2

-- Agrego criterio ed pueblo originario

SELECT *
FROM   PERSONA
WHERE  IDAcreditacion in  (1,2)
       AND PuebloOriginario IS NOT NULL
       AND RUT IN(SELECT RUT
                  FROM   (SELECT RUT,
                                 Count(RUT) AS NPRACTICA
                          FROM   REALIZA
                          GROUP  BY RUT) AS NPR
                  WHERE  NPRACTICA > 2) 
-- Cambiar IDAcreditacion
IDAcreditacion 1  -> 3
IDAcreditación 2 -> 4

------






UPDATE `PERSONA`
SET PERSONA.IDAcreditacion = IF(PERSONA.IDAcreditacion=1,3,4)


WHERE PERSONA.RUT IN (
SELECT RUT
FROM   PERSONA
WHERE  IDAcreditacion in  (1,2)
       AND PuebloOriginario IS NOT NULL
       AND RUT IN(SELECT RUT
                  FROM   (SELECT RUT,
                                 Count(RUT) AS NPRACTICA
                          FROM   REALIZA
                          GROUP  BY RUT) AS NPR
                  WHERE  NPRACTICA > 2)
)


CASE
    WHEN PERSONA.IDAcreditacion = 1 THEN 3
    ELSE 4
END










SELECT RUT, Quantity,
CASE
    WHEN IDAcreditacion = 1 THEN 3
    ELSE 4
END
FROM PERSONA;




| IDAcreditacion    | señalC    | señalP  |
|-------------------|-----------|---------|
|         1         |   0       |     0   |
|         2         |   1       |     0   |
|         3         |   0       |     1   |
|         4         |   1       |     1   |



--correcto

UPDATE `PERSONA`
SET PERSONA.IDAcreditacion = IF(PERSONA.IDAcreditacion=1,3,4)


WHERE IDAcreditacion in  (1,2) AND PuebloOriginario IS NOT NULL AND 
RUT IN(SELECT RUT
                  FROM   (SELECT RUT,
                                 Count(RUT) AS NPRACTICA
                          FROM   REALIZA
                          GROUP  BY RUT) AS NPR
                  WHERE  NPRACTICA > 2)

/*

15. El encargado de la base de datos se dió cuenta que existen 2 tipos de acreditaciones que no fueron
ingresados, él le pide a usted que agregue los siguientes datos en la tabla proveedor.
-SenalP:
2: Tramitando Pensión.
-SenalC:
2: Tramitando Credencial.
*/

| IDAcreditacion    | señalC    | señalP  |
|-------------------|-----------|---------|
|         1         |   0       |     0   |
|         2         |   1       |     0   |
|         *         |   2       |     0   |
|         3         |   0       |     1   |
|         *         |   0       |     2   |
|         4         |   1       |     1   |
|         *         |   1       |     2   |
|         *         |   2       |     1   |
|         *         |   2       |     2   |

INSERT INTO ACREDITACION VALUES (5, 2,0)
;
INSERT INTO ACREDITACION VALUES (6, 0,2)
;
INSERT INTO ACREDITACION VALUES (7, 1,2)
;
INSERT INTO ACREDITACION VALUES (8, 2,1)
;
INSERT INTO ACREDITACION VALUES (9, 2,2)



/*
16. Agregue a la tabla PERSONA un atributo llamado “Candidato”, el cual valdrá 1 si es que la persona tiene
ambas acreditaciones, está en el 40% más vulnerable, y cuenta con postgrado.
*/



ALTER TABLE PERSONA ADD Candidato INT(1) DEFAULT 0;
UPDATE PERSONA
SET PERSONA.Candidato = 1
where PERSONA.RUT in (
SELECT RUT FROM `POSTGRADO`  
WHERE Ultimocurso IS NOT NULL
) AND IDAcreditacion = 4 AND
 NroRSH IN (SELECT NroRSH FROM `FICHA_RSH` WHERE RangoPorcentual = '0-40%')
            
            --- consulta

SELECT *
FROM PERSONA
WHERE IDAcreditacion = 4 and NroRSH IN (SELECT NroRSH FROM `FICHA_RSH` WHERE RangoPorcentual = '0-40%') and RUT IN (SELECT RUT FROM `POSTGRADO`  
WHERE Ultimocurso IS NOT NULL)

/*
17. Duplique la tabla INCLUSION_LABORAL, generando una nueva tabla llamada
“INCLUSION_LABORAL2022” que debe poseer las mismas características de la tabla original, pero solo
los datos del año 2021, aunque esta nueva tabla debe decir 2022 en vez de 2021, en el atributo
correspondiente.
*/



CREATE TABLE INCLUSION_LABORAL2022 (SELECT `NumeroIL`, `EmpresaIL`, `TipoCargo`, `EntradaSol`, `FechaInicContrato`, `FechaTermContrato`, `TipoContrato`, `RegionIL`, `Permanencia`, `NotaAdicional`, `RUT`, 2022 AS `AñoIL`
FROM INCLUSION_LABORAL
WHERE AñoIL = 2021);
ALTER TABLE `INCLUSION_LABORAL2022` ADD PRIMARY KEY (`NumeroIL`), ADD KEY `RUT` (`RUT`);
ALTER TABLE `INCLUSION_LABORAL2022` ADD CONSTRAINT `INCLUSION_LABORAL2022_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `PERSONA` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE;




