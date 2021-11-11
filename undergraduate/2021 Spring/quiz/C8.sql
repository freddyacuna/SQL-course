/*
* Consulta 1
* Para potenciar el algoritmo de recomendación de contenidos, se requiere clasificar a los usuarios según su continente:
* América del Sur, América Central o América del Norte. Agregue el continente respectivo a la tabla de usuarios.
*/
 
 
ALTER TABLE USUARIO ADD Continente TEXT;
UPDATE USUARIO
SET Continente = IF(USUARIO.Pais_U = "Argentina"; OR USUARIO.Pais_U = "Brasil"; OR USUARIO.Pais_U =
"Chile" OR USUARIO.Pais_U = "Colombia" OR USUARIO.Pais_U = "Peru", "America del Sur", IF(USUARIO.Pais_U
= "Costa Rica", "America Central", "America del Norte";))

--(900 filas afectadas)

/*
* Consulta 2
* Genere una nueva tabla llamada CONTENIDO_ESTRELLA, que contenga el ID, nombre, fecha de estreno, clasificación
*etaria y nombre de productora de todos los contenidos que reportan visualizaciones mayores al promedio de las 50
*películas con mayor cantidad de visualizaciones.
*/

CREATE TABLE CONTENIDO_ESTRELLA(ID_Contenido VARCHAR(20), Nombre_C TEXT, FechaEstreno DATE,
ClasifEtaria VARCHAR(10), Productora TEXT);
INSERT INTO CONTENIDO_ESTRELLA
SELECT DISTINCT C.ID_Contenido, C.Nombre_C, C.FechaEstreno, C.ClasifEtaria,
PRODUCTORA.Nombre_Productora
FROM CONTENIDO AS C, PRODUCTORA, PRODUCE AS P
WHERE C.ID_Contenido = P.IDContenido AND P.ID_Productora = PRODUCTORA.ID_Productora AND
C.ID_Contenido IN (SELECT C.ID_Contenido
FROM VISUALIZA AS V, CONTENIDO AS C
WHERE V.IDContenido = C.ID_Contenido
GROUP BY C.ID_Contenido
HAVING COUNT(V.IDContenido) &gt; (SELECT AVG(T1.Cantidad_Visualizaciones) AS Promedio
FROM (SELECT C.ID_Contenido, COUNT(V.IDContenido) AS Cantidad_Visualizaciones
FROM VISUALIZA AS V, CONTENIDO AS C
WHERE V.IDContenido = C.ID_Contenido
GROUP BY V.IDContenido
ORDER BY Cantidad_Visualizaciones DESC
LIMIT 50) AS T1))
--(15 filas afectadas)                   
/*
* Consulta 3
* Como conmemoración de la plataforma por el tiempo que lleva en Latinoamérica, desean convocar a unos Premios
* Disney+, por lo que necesitan que, en la tabla de actores se incluya una nueva columna: Se llamará Potenciales_premios, la
* cual establecerá la cantidad de premios que dich@ actor o actriz tendrá tras la premiación, lo cual se estimará siguiendo la
* regla de que Potenciales_premios = PremiosImportantes + Promedio de Cantidad de Tipos de Roles por Actor.
*/

ALTER TABLE ACTOR ADD Potenciales_premios INT(5);
UPDATE ACTOR
SET Potenciales_premios = ACTOR.PremiosImportantes + (SELECT TRUNCATE(AVG(T1.QRoles), 0)
FROM (SELECT TIPODEROL.Rut_T, COUNT(TIPODEROL.TiposDeRoles) AS QRoles
FROM TIPODEROL
GROUP BY TIPODEROL.Rut_T) AS T1)

--(562 filas afectadas)

