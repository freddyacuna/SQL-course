--Se solicita que a través de consultas en MySQL presenten los siguientes requerimientos:

--Consulta 1
----Se le solicita mostrar el ID de los álbumes que pertenecen al sello Columbia Records y que tengan una fecha de lanzamiento posterior al 2017.

SELECT ID_Album
FROM ALBUM
WHERE Sello="Columbia Records" AND YEAR(Fecha_Lanzamiento)>2017

--Consulta 2
--Se le solicita mostrar el nombre y el ID de los artistas que sean compositores.

SELECT Nombre_Artista, ID_Artista
FROM ARTISTA
WHERE SeñalCompositor=1

--Consulta 3
--Se le solicita mostrar el nombre de las canciones junto con su respectivo artista de aquellas canciones que tengan una duración mayor a 3 minutos.

              SELECT  CANCION.Nombre_Cancion, ARTISTA.Nombre_Artista
FROM PERTENECE, CANCION, ARTISTA
WHERE PERTENECE.ID_Material=CANCION.ID_Material 
                     AND ARTISTA.ID_Artista=PERTENECE.ID_Artista 
      AND TIME(CANCION.Duracion)>"00:03:00"


--Consulta 4
--Se le solicita mostrar el nombre de los sellos existentes en la base de datos, junto con la fecha de lanzamiento de aquellos álbumes que se hayan lanzado antes del 2020.

SELECT Sello, Fecha_Lanzamiento
FROM ALBUM
WHERE YEAR(Fecha_Lanzamiento)<2020

--Consulta 5
--Se le solicita mostrar el Nombre e ID de los álbumes que se hayan lanzado el 2021.

SELECT Nombre_Album, ID_Album
FROM ALBUM
WHERE YEAR(Fecha_Lanzamiento)=2021



--Consulta 6
--Se le solicita mostrar el nombre de aquellos artistas que su ID contenga un 9.

SELECT Nombre_Artista
FROM ARTISTA
WHERE ID_Artista LIKE "%9%"

--Consulta 7
--Se le solicita mostrar el nombre de los artistas que tengan rango vocal barítono.

SELECT ARTISTA.Nombre_Artista
FROM CANTANTE, ARTISTA
WHERE CANTANTE.ID_Artista=ARTISTA.ID_Artista AND Rango_Vocal="Barítono"

--Consulta 8
--Se le solicita mostrar el nombre de los artistas que hayan lanzado un álbum entre el año 2017 y 2020, junto al nombre de los respectivos álbumes.

SELECT DISTINCT ARTISTA.Nombre_Artista, ALBUM.Nombre_Album
FROM ALBUM, ARTISTA, PERTENECE
WHERE ARTISTA.ID_Artista=PERTENECE.ID_Artista 
AND PERTENECE.ID_Album=ALBUM.ID_Album 
AND YEAR(ALBUM.Fecha_Lanzamiento) BETWEEN 2017 and 2020

--Consulta 9
--Mostrar el nombre de aquellos cantantes que tienen rango vocal distinto a Mezzosoprano.

SELECT ARTISTA.Nombre_Artista
FROM CANTANTE, ARTISTA
WHERE CANTANTE.ID_Artista=ARTISTA.ID_Artista 
AND (CANTANTE.Rango_Vocal<>"Mezzosoprano")

--Consulta 10
--Mostrar el nombre de aquellos cantantes que tienen rango vocal Mezzosoprano o  Soprano.

SELECT ARTISTA.Nombre_Artista
FROM CANTANTE, ARTISTA 
WHERE ARTISTA.ID_Artista=CANTANTE.ID_Artista            
AND (CANTANTE.Rango_Vocal="Mezzosoprano" OR CANTANTE.Rango_Vocal="Soprano")

