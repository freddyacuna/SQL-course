-- REQUERIMIENTOS DE CONSULTAS

/* 1. Muestre la cantidad de personas que se han inoculado con cada vacuna de la base de datos, además de
mostrar su porcentaje con respecto al total de personas vacunadas, independiente de la vacuna
administrada. Asimismo, se pide mostrar los resultados por orden alfabético en base a la vacuna. */

SELECT  T1.Vacuna ,
        T1.Cantidad_Persona,
        CONCAT( TRUNCATE((T1.Cantidad_Persona	/T2.Total)*100,2),"%") AS Porcentaje_Personas
FROM (
SELECT Vacuna, count(*) AS Cantidad_Persona
FROM `SE_INOCULA` GROUP BY VACUNA ORDER BY VACUNA ASC
    ) AS T1,
(SELECT COUNT(*) AS Total 
              FROM `SE_INOCULA`) AS T2

-- 2. Se le pide que muestre la cantidad de personas afectadas por enfermedad. */

SELECT Nombre_E, COUNT(Rut_P) AS Cantidad_Personas
FROM `CONTAGIA`
WHERE Nombre_E IS NOT NULL
GROUP BY Nombre_E

-- 3. Muestre un listado de los médicos que hayan ejercido por más de 30 años. */

SELECT * FROM `PERSONAL_MEDICO`
WHERE Tiempo_trabajando>=30 AND RUT_PM IN (SELECT * FROM MEDICO)
-- inconsistencia?
SELECT DISTINCT PERSONA.Rut_P FROM PERSONA, PERSONAL_MEDICO, MEDICO
WHERE PERSONA.RUT_PM=MEDICO.RUT_PM AND  PERSONAL_MEDICO.RUT_PM=MEDICO.RUT_PM AND PERSONAL_MEDICO.Tiempo_trabajando>=30

/* 4. Se pide que muestre las dos nacionalidades de mayor representatividad, considerando aquellas personas
que no vivan en la región metropolitana, y pertenezcan a un rango etario entre 25 y 50 años. Para esto,
genere una lista que contenga la nacionalidad de las personas, junto con su porcentaje de
representatividad en relación al total de personas. */

SELECT  T1.Nacionalidad ,
        T1.Cantidad_Nacionalidad,
        CONCAT( TRUNCATE((T1.Cantidad_Nacionalidad	/T2.Total)*100,2),"%") AS Porcentaje_Nacionalidad
FROM (
SELECT Nacionalidad, count(*) AS Cantidad_Nacionalidad
FROM (SELECT * FROM `PERSONA` WHERE Region NOT IN ('RM') AND Edad BETWEEN 25 AND 50) A
    GROUP BY Nacionalidad ORDER BY Nacionalidad ASC
    ) AS T1,
(SELECT COUNT(*) AS Total 
              FROM (SELECT * FROM `PERSONA` WHERE Region NOT IN ('RM') AND Edad BETWEEN 25 AND 50) B
) AS T2
ORDER BY T1.Cantidad_Nacionalidad DESC LIMIT 2



/* 5. Se requiere conocer cuáles han sido las 3 enfermedades con mayor presencia dentro de la gente infectada.
Para esto, genere una tabla que contenga la cantidad de personas por cada enfermedad. Considere que los
resultados deben estar ordenados de forma descendente. */

SELECT Nombre_E, COUNT(Rut_P) AS Cantidad_Personas
FROM `CONTAGIA`
WHERE Nombre_E IS NOT NULL
GROUP BY Nombre_E  
ORDER BY `Cantidad_Personas`  DESC 
LIMIT  3

/* 6. Se requiere mostrar los puntos de vacunación y su dirección, de aquellos lugares que distribuyan alguna de
las vacunas contra el COVID-19 y que posean certificación extranjera. */

SELECT * FROM `PUNTO_DE_VACUNACION` PV
LEFT JOIN (
SELECT * FROM `VACUNA` WHERE ID_C IN (SELECT * FROM `EXTRANJERA`) AND ENFERMEDAD='COVID-19'
) V ON V.Nombre_V= PV.Nombre_V
WHERE V.Nombre_V IS NOT NULL

-- 7. Se solicita mostrar el rut y los años de titulado que tienen los enfermeros que hayan salido de la Universidad Diego Portales. */

SELECT RUT_PM AS RUT , YEAR(NOW())-YEAR(Titulado)  AS ANOS_TITULADO FROM `PERSONAL_MEDICO` WHERE Institucion='Universidad Diego Portales' AND RUT_PM IN (SELECT * FROM `ENFERMERO`)

/* 8. Se requiere mostrar el rut y el tipo de profesión (médico, enfermero, otro) de las dos personas del personal
médico que se hayan tomado la mayor cantidad de años para comenzar a trabajar luego de su titulación */

SELECT RUT_PM AS RUT, `TIPO PROFESION`
FROM
(SELECT *, YEAR(NOW())-YEAR(Titulado) AS 'TITULO ANO',(YEAR(NOW())-YEAR(Titulado)- Tiempo_trabajando) AS NUMERO,
	CASE	WHEN RUT_PM IN (SELECT * FROM MEDICO) THEN 'MEDICO'
    		WHEN RUT_PM IN (SELECT * FROM ENFERMERO) THEN 'ENFERMERO'
            ELSE 'OTRO' 
            END AS 'TIPO PROFESION'
FROM `PERSONAL_MEDICO`  
ORDER BY `NUMERO`  DESC) A
LIMIT 2

/* 9. Se requiere conocer el promedio de edad por nacionalidad de aquellas personas que han tenido COVID-19.
Para esto, genere una tabla con la nacionalidad, y su promedio de edad (en números enteros). */

SELECT Nacionalidad, ROUND(AVG(Edad),0) AS 'PROMEDIO EDAD'
FROM `PERSONA` WHERE Rut_P IN (
SELECT Rut_P FROM `CONTAGIA` WHERE Nombre_E IN ('COVID-19')
)
GROUP BY Nacionalidad

/* 10. Muestre el parentesco y la cantidad de veces que una persona se contagió por un pariente, considerando
sólo a las personas de rango etario entre 18 y 70 años, cuya cantidad de contagios sea mayor a 10. */

-- puede ser cualquier persona, a lo que se refiere es que muestre el parentesco con la persona que lo contagió y las veces que este contagio ocurrió.

-- En cuanto a la consulta 10, se pide mostrar el parentesco y la cantidad de veces que las personas se contagiaron por este parentesco 
-- (cuando esta cantidad es mayor a 10), dejame saber si así se entiende mejor el requerimiento.

SELECT * ,
CASE WHEN ECP.Parentesco='Familiar' THEN 1
ELSE 0 END AS ES_PARIENTE
FROM `PERSONA` P
LEFT JOIN ES_CONTAGIADA_POR ECP ON P.Rut_P=ECP.Rut_P
WHERE ECP.Rut_P IS NOT NULL AND Edad BETWEEN 18 AND 70

SELECT RUT, Parentesco, SUM(ES_PARIENTE) AS N_CONTAGIO_PARIENTE
FROM (
SELECT P.Rut_P AS RUT , Parentesco,
CASE WHEN ECP.Parentesco='Familiar' THEN 1
ELSE 0 END AS ES_PARIENTE
FROM `PERSONA` P
LEFT JOIN ES_CONTAGIADA_POR ECP ON P.Rut_P=ECP.Rut_P
WHERE ECP.Rut_P IS NOT NULL AND Edad BETWEEN 18 AND 70) A
GROUP BY A.RUT , Parentesco
ORDER BY SUM(ES_PARIENTE)  DESC


----

SELECT Parentesco, COUNT(*)
FROM (SELECT  P.Rut_P AS RUT, Parentesco,
CASE WHEN ECP.Parentesco='Familiar' THEN 1
ELSE 0 END AS ES_PARIENTE
FROM `PERSONA` P
LEFT JOIN ES_CONTAGIADA_POR ECP ON P.Rut_P=ECP.Rut_P
LEFT JOIN CONTAGIA C ON C.Rut_P=P.Rut_P
WHERE 
Edad BETWEEN 18 AND 70 AND
ECP.Rut_P IS NOT NULL 
ORDER BY `C`.`Rut_P` ASC) AS A
GROUP BY Parentesco


SELECT *
FROM 
(SELECT Parentesco, COUNT(*) AS 'N_VECES_CONTAGIO'
FROM (SELECT  P.Rut_P AS RUT, Parentesco,
CASE WHEN ECP.Parentesco='Familiar' THEN 1
ELSE 0 END AS ES_PARIENTE
FROM `PERSONA` P
LEFT JOIN ES_CONTAGIADA_POR ECP ON P.Rut_P=ECP.Rut_P
LEFT JOIN CONTAGIA C ON C.Rut_P=P.Rut_P
WHERE 
Edad BETWEEN 18 AND 70 AND
ECP.Rut_P IS NOT NULL 
ORDER BY `C`.`Rut_P` ASC) AS A
GROUP BY Parentesco  ) C
WHERE N_VECES_CONTAGIO>10
/* 11. Se solicita mostrar cada enfermedad junto con la frecuencia de contagio y la vacuna que busca prevenirla.
Para esto, se solicita presentar una columna que indique esta clasificación, siendo “Común” si la
enfermedad se encuentra dentro del 25% con mayor tasa de contagio, 'Sospechoso'; si se encuentra en el
60% más bajo y 'Estándar'; en cualquier otro caso. Finalmente, ordene la tabla por el nombre de
enfermedad, clasificación y Nombre de vacuna. */

SELECT Nombre_E AS 'NOMBRE ENFERMEDAD', N AS 'FREQ CONTAGIO',
CASE 	WHEN N/TOTAL > 0.75 THEN 'Comun'
		WHEN N/TOTAL < 0.60 THEN 'Sospechoso'
        ELSE 'Estandar' END AS CLASIFICACION, NOMBRE_VACUNA
FROM (SELECT Nombre_E, COUNT(*) AS N,
      CASE	WHEN V.Nombre_V IS NULL THEN 'Sin Vacuna'
		WHEN C.Nombre_E = 'COVID-19' THEN 'Astra, Moderna, Pfizer, Sinovac'
        ELSE V.Nombre_V  END AS NOMBRE_VACUNA 
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.Nombre_E
GROUP BY Nombre_E, NOMBRE_VACUNA) AS T1, (SELECT COUNT(*) AS TOTAL
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.Nombre_E) AS T2 
ORDER BY Nombre_E, CLASIFICACION, NOMBRE_VACUNA

---
/*
SELECT Nombre_E, COUNT(*), 
CASE	WHEN V.Nombre_V IS NULL THEN 'Sin Vacuna'
		WHEN C.Nombre_E = 'COVID-19' THEN 'Astra, Moderna, Pfizer, Sinovac'
        ELSE V.Nombre_V  END AS NOMBRE_VACUNA 
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.NOmbre_E
GROUP BY Nombre_E, NOMBRE_VACUNA

----

SELECT * 
FROM (
SELECT Nombre_E, COUNT(*) FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.NOmbre_E
GROUP BY Nombre_E  
ORDER BY COUNT(*)  DESC) AS T1, (SELECT COUNT(*) AS TOTAL FROM CONTAGIA) AS T2


----

SELECT *
(SELECT Nombre_E, COUNT(*)
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.NOmbre_E
GROUP BY Nombre_E) AS T1, (SELECT Nombre_E, COUNT(*)
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.NOmbre_E) AS T2

SELECT Nombre_E, COUNT(*), IF(V.Nombre_V IS NULL, 'Sin Vacuna', Nombre_V) AS NOMBRE_VACUNA 
FROM `CONTAGIA` C
LEFT JOIN `VACUNA` V ON V.Enfermedad=C.NOmbre_E
----
*/


/* 12. Obtenga el promedio de casos confirmados (truncado) y el máximo de recuperados de enfermedades, sin
embargo, únicamente de aquellos que cumplan con tener vacunas certificadas en el extranjero */

SELECT TRUNCATE(AVG(Casos_confirmados),0) AS 'PROMEDIO CASOS CONFIRMADOS', 
                MAX(Cantidad_recuperados) AS 'MAXIMO RECUPERADOS ENFERMEDADES' FROM `ENFERMEDAD`
WHERE  Nombre_E IN (SELECT Enfermedad FROM `VACUNA` WHERE ID_C IN (SELECT * FROM `EXTRANJERA`)
						)


/* 13. Muestra una lista con el rut y el tiempo trabajado de aquellos médicos que hayan trabajado en centros de
salud que cuenten con previsión Fonasa e Isapre */

SELECT P.RUT_PM, Tiempo_trabajando FROM PERSONAL_MEDICO P
LEFT JOIN (
SELECT * FROM `TRABAJA` WHERE ID_CS IN (SELECT ID_CS FROM `CENTRO_DE_SALUD` WHERE Prevision = 'Fonasa-Isapre') AND RUT_PM IN  (SELECT * FROM `MEDICO`)
    ) C ON 	C.RUT_PM=P.RUT_PM
    WHERE C.RUT_PM IS NOT NULL AND C.ID_CS IS NOT NULL

/* 14. Obtenga rut, tiempo trabajando y la institución de aquellos empleados que cumplan con ser enfermeros y
ser aquellos 5 que llevan más tiempo trabajando. Además, el nombre de la institución se debe mostrar
únicamente por sus tres primeras letras.*/

SELECT P.RUT_PM, Tiempo_trabajando, Institucion FROM PERSONAL_MEDICO P
LEFT JOIN (
SELECT * FROM `TRABAJA` WHERE RUT_PM IN  (SELECT * FROM `ENFERMERO`)
    ) C ON 	C.RUT_PM=P.RUT_PM
    WHERE C.RUT_PM IS NOT NULL AND C.ID_CS IS NOT NULL  
ORDER BY `P`.`Tiempo_trabajando`  DESC
LIMIT 5

-- REQUERIMIENTOS DE ACTUALIZACIÓN

-- 15. Se requiere eliminar de la tabla PERSONAL_MEDICO a todos aquellos funcionarios que lleven menos de 5 años trabajando.

DELETE FROM PERSONAL_MEDICO WHERE Tiempo_trabajando < 5

/* 16. Se tiene gran preocupación hacia los jóvenes (menores a 25 años) que han contagiado a más de una
persona de la enfermedad que padecen, por lo que se realizó una campaña 100% exitosa para que todas
aquellas personas que estén dentro de este grupo y que sean Fonasa se cambien a Isapre. Efectúe este
cambio en la base de datos.*/


UPDATE PERSONA
SET Prevision = 'Isapre'
WHERE Rut_P IN (
SELECT Rut_C
FROM
(SELECT Rut_C, COUNT(*) AS N FROM `ES_CONTAGIADA_POR`WHERE Rut_C IN (SELECT Rut_P FROM `PERSONA` WHERE Edad<25 AND Prevision ='Fonasa')
GROUP BY Rut_C
) A WHERE N>1
)

/* 17. El encargado cometió una equivocación y se olvidó de agregar algunos datos en la base, por lo que él le
pide a usted que agregue en las tablas que sean necesarias los siguientes datos de médicos, de manera que
se refleje de la mejor forma la información para su posterior uso:

RUT_PM Tiempo_trabajando Titulado Institución
27101620-4 6 23-06-2004 Universidad Mayor
10924256-K 18 12-07-2002 Universidad Arturo Prat
23778599-1 23 19-02-1998 Universidad de Chile
*/

INSERT INTO `PERSONAL_MEDICO` (`RUT_PM`, `Tiempo_trabajando`, `Titulado`, `Institucion`) VALUES
('27101620-4', 6, '2004-06-23', 'Universidad Mayor'),
('10924256-K', 18, '2002-07-12', 'Universidad Arturo Prat'),
('23778599-1', 23, '1998-02-19', 'Universidad de Chile');


INSERT INTO MEDICO (RUT_PM) VALUES ('27101620-4');
INSERT INTO MEDICO (RUT_PM) VALUES ('10924256-K');
INSERT INTO MEDICO (RUT_PM) VALUES ('23778599-1');

/* 18. Agregue a la tabla PERSONAL_MEDICO un atributo llamado “Experiencia”, siendo Mucha Experiencia si está
dentro del 20% con más experiencia, Experiencia Regular si está en el siguiente 20% y Poca Experiencia si
no se encuentra en ninguno de los dos anteriores. Sin embargo, si se encuentra en esta última clasificación
y fue estudiante de la Universidad de Chile, automáticamente sube una clasificación, es decir, se clasifica
como Experiencia Regular. */

ALTER TABLE PERSONAL_MEDICO ADD Experiencia VARCHAR(64) DEFAULT NULL;

UPDATE `PERSONAL_MEDICO`
SET PERSONAL_MEDICO.Experiencia=(
SELECT TRAMO_EXP FROM (
SELECT RUT_PM,
 CASE	WHEN Tiempo_trabajando/ TOTAL >0.8 THEN 'MUCHA EXPERIENCIA'
 		WHEN Tiempo_trabajando/ TOTAL >0.6 THEN 'EXPERIENCIA REGULAR'
        WHEN Tiempo_trabajando/ TOTAL <=0.6 AND Institucion='Universidad de Chile' THEN 'EXPERIENCIA REGULAR'
        ELSE 'POCA EXPERIENCIA' END AS TRAMO_EXP 
FROM `PERSONAL_MEDICO`, (SELECT MAX(Tiempo_trabajando) AS TOTAL FROM `PERSONAL_MEDICO`) AS A
    ) B WHERE PERSONAL_MEDICO.RUT_PM=B.RUT_PM
);

/* 19. Duplique la tabla DIAGNOSTICO_MEDICO, generando una nueva tabla llamada “DIAGNOSTICO_MEDICO2”
que debe poseer las mismas características de la tabla original, pero solo los diagnósticos entregados por
médicos titulados desde el año 2000, aunque en esta nueva tabla se pide que el atributo correspondiente al
médico debe decir “ID_MedicoNuevo”. */

CREATE TABLE DIAGNOSTICO_MEDICO2
SELECT ID_D, Diagnostico, Instituto, RUT_PM AS ID_MedicoNuevo 
        FROM `DIAGNOSTICO_MEDICO` WHERE RUT_PM IN (SELECT RUT_PM FROM `PERSONAL_MEDICO` WHERE YEAR(Titulado)>=2000) ;
ALTER TABLE DIAGNOSTICO_MEDICO2 ADD PRIMARY KEY (ID_D);
ALTER TABLE DIAGNOSTICO_MEDICO2 ADD FOREIGN KEY (ID_MedicoNuevo) REFERENCES MEDICO(RUT_PM)
