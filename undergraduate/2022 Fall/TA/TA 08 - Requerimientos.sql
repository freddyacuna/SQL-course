-- REQUERIMIENTOS

-- Se solicita que a través de consultas en MySQL presenten los siguientes requerimientos:

-- 1.	Mostrar todos los datos de los artistas que existen en la base de datos.

SELECT *
FROM ARTISTA

-- 2.	Listar los IDs y nombres de los artistas que comienzan con en la base de datos.

SELECT ARTISTA.ID_Artista, ARTISTA.Nombre_Artista
FROM ARTISTA
WHERE Nombre_Artista LIKE "T%"

-- 3.	Mostrar los nombres de artistas sin repetirse.

SELECT DISTINCT A.Nombre_Artista
FROM ARTISTA as A

-- 4.	Mostrar los nombres de artistas sin repetirse y que son compositores.

SELECT DISTINCT A.Nombre_Artista
FROM ARTISTA as A 
WHERE SeñalCompositor = 1

-- 5.	Mostrar nombre y sello de los álbumes que existan en la base de datos.

SELECT ALBUM.Nombre_Album, ALBUM.Sello
FROM ALBUM

-- 6.	Mostrar el nombre e ID de los álbumes que sean del año 2020.

SELECT ALBUM.Nombre_Album, ALBUM.ID_Album
FROM ALBUM
WHERE YEAR(Fecha_Lanzamiento)=2020

-- 7.	Listar los nombres de las canciones de los artistas

SELECT DISTINCT CANCION.Nombre_Cancion
FROM PERTENECE, CANCION, ARTISTA
WHERE PERTENECE.ID_Material=CANCION.ID_Material AND PERTENECE.ID_Artista=ARTISTA.ID_Artista

-- 8.	Mostrar los nombres de las canciones junto al correspondiente álbum de los artistas.

SELECT DISTINCT CANCION.Nombre_Cancion, ALBUM.Nombre_Album
FROM ARTISTA, ALBUM, PERTENECE, CANCION
WHERE ALBUM.ID_Album=PERTENECE.ID_Album AND PERTENECE.ID_Artista=ARTISTA.ID_Artista AND CANCION.ID_Material=PERTENECE.ID_Material

-- 9.	Se quiere encontrar los datos de la cantante Swift en la base, pero no se tiene claridad si se escribe Taylor o Teylor, muestre los datos.
Opción 1:
SELECT ARTISTA.Nombre_Artista
FROM ARTISTA
WHERE ARTISTA.Nombre_Artista LIKE "%Swift"
	Opción 2:
SELECT ARTISTA.Nombre_Artista
FROM ARTISTA
WHERE ARTISTA.Nombre_Artista LIKE "T_ylor%"

-- 10.	Mostrar los álbumes a los que pertenecen las canciones de los artistas que son compositores. 

SELECT DISTINCT ALBUM.Nombre_Album
FROM ARTISTA, ALBUM, PERTENECE, CANCION
WHERE ALBUM.ID_Album=PERTENECE.ID_Album AND PERTENECE.ID_Artista=ARTISTA.ID_Artista AND CANCION.ID_Material=PERTENECE.ID_Material AND ARTISTA.SeñalCompositor=1


-- 11.	Mostrar aquellos álbumes ordenados de forma alfabética que no hayan pasado más de 2 años desde su lanzamiento.

SELECT ALBUM.Nombre_Album, ALBUM.Fecha_Lanzamiento, TRUNCATE(DATEDIFF(CURRENT_DATE(), ALBUM.Fecha_Lanzamiento)/365,0) AS Tiempo
FROM ALBUM
WHERE TRUNCATE(DATEDIFF(CURRENT_DATE(), ALBUM.Fecha_Lanzamiento)/365,0)<=2
ORDER BY ALBUM.Nombre_Album ASC

-- 12.	Mostrar los artistas que hayan trabajado en álbumes que se hayan lanzado después del año 2020 (inclusive) y que su ID termine con un 9.

SELECT DISTINCT ARTISTA.Nombre_Artista
FROM ARTISTA, ALBUM
WHERE YEAR(ALBUM.Fecha_Lanzamiento)>=2020 AND ARTISTA.ID_Artista LIKE '%9'

-- 13.	Mostrar las dos canciones que poseen mayor duración

SELECT CANCION.Duracion,  CANCION.Nombre_Cancion
FROM CANCION
ORDER BY CANCION.Duracion DESC
LIMIT 2

-- 14.	Mostrar el nombre de los artistas que hayan lanzado un álbum entre el año 2020 y 2021, junto al nombre de los respectivos álbumes.

SELECT ARTISTA.Nombre_Artista, ALBUM.Nombre_Album
FROM ARTISTA, PERTENECE, ALBUM
WHERE ARTISTA.ID_Artista=PERTENECE.ID_Artista and PERTENECE.ID_Album=ALBUM.ID_Album AND (YEAR(ALBUM.Fecha_Lanzamiento) BETWEEN 2020 and 2021)

-- 15.	Mostrar el nombre de aquellos cantantes que tienen rango vocal Mezzosoprano o  Soprano
 
SELECT DISTINCT  ARTISTA.Nombre_Artista, CANTANTE.Rango_Vocal
FROM CANTANTE, ARTISTA
WHERE ARTISTA.ID_Artista=CANTANTE.ID_Artista AND (CANTANTE.Rango_Vocal="Mezzosoprano" OR CANTANTE.Rango_Vocal="Soprano")

-- 16.	Mostrar el nombre de aquellos cantantes que tienen rango vocal distinto a Mezzosoprano
 
SELECT DISTINCT  ARTISTA.Nombre_Artista, CANTANTE.Rango_Vocal
FROM CANTANTE, ARTISTA
WHERE ARTISTA.ID_Artista=CANTANTE.ID_Artista AND CANTANTE.Rango_Vocal<>"Mezzosoprano" 

-- 17. Mostrar el nombre de las canciones junto con el año de lanzamiento de su álbum.

SELECT DISTINCT CANCION.Nombre_Cancion, YEAR(ALBUM.Fecha_Lanzamiento) AS ‘Anio’
FROM ALBUM, CANCION, PERTENECE
WHERE PERTENECE.ID_Material=CANCION.ID_Material AND ALBUM.ID_Album=PERTENECE.ID_Album


 
-- PROPUESTOS

-- 1.	Mostrar únicamente los nombres de las canciones que tienen una duración mayor a 2 minutos.

SELECT  CANCION.Nombre_Cancion
FROM CANCION
WHERE MINUTE(CANCION.Duracion) >= 2

-- 2.	Mostrar aquellos álbumes ordenados de forma alfabética que no hayan pasado más de 2 años desde su lanzamiento.

SELECT ALBUM.Nombre_Album, ALBUM.Fecha_Lanzamiento, TRUNCATE(DATEDIFF(CURRENT_DATE(), ALBUM.Fecha_Lanzamiento)/365,0) AS Tiempo
FROM ALBUM
WHERE ALBUM.Sello="Republic Records" 
ORDER BY ALBUM.Nombre_Album ASC

-- 3.	Mostrar el nombre y rango vocal de los artistas que sean del tipo cantante

SELECT ARTISTA.Nombre_Artista, CANTANTE.Rango_Vocal
FROM ARTISTA, CANTANTE
WHERE ARTISTA.ID_Artista=CANTANTE.ID_Artista

-- 4.	Mostrar el nombre y duración de aquellas canciones que tienen una duración entre 2 y 4 minutos

SELECT CANCION.Nombre_Cancion, CANCION.Duracion
FROM CANCION
WHERE minute(CANCION.Duracion)>=2 and minute(CANCION.Duracion)<=4

-- 5.	Mostrar el nombre y rango vocal de los artistas que sean del tipo cantante

SELECT ARTISTA.Nombre_Artista, CANTANTE.Rango_Vocal
FROM ARTISTA, CANTANTE
WHERE ARTISTA.ID_Artista=CANTANTE.ID_Artista


