/*Consulta 1

Se le solicita mostrar el nombre (sin repetición) de los artistas que tengan señal cantante.


*/
SELECT DISTINCT Nombre_Artista AS Nombre FROM `ARTISTA` WHERE SeñalCantante =1
/*Consulta 2

Se le solicita mostrar el nombre de los álbumes junto con su fecha de lanzamiento y el artista.


*/
SELECT Nombre_Album, Fecha_Lanzamiento,Nombre_Artista FROM `PERTENECE` P 
LEFT JOIN ALBUM A ON A.ID_Album=P.ID_Album
LEFT JOIN ARTISTA AR ON AR.ID_Artista=P.ID_Artista


/*Consulta 3

Se le solicita mostrar el nombre de los artistas que sean del tipo compositor “Pop”.


*/
SELECT Nombre_Artista AS Nombre FROM `COMPOSITOR` C LEFT JOIN ARTISTA A ON C.ID_Artista= A.ID_Artista
/*Consulta 4

Se le pide mostrar el nombre de las canciones que tengan una duración entre 2 y 4  minutos, junto con el nombre de su artista.


*/
SELECT Nombre_Cancion, Nombre_Artista FROM `PERTENECE` P 
LEFT JOIN CANCION C ON C.ID_Material=P.ID_Material
LEFT JOIN ARTISTA AR ON AR.ID_Artista=P.ID_Artista
WHERE   TIME(Duracion) BETWEEN "00:02:00" AND  "00:04:00"

/*Consulta 5 

Se le solicita mostrar el nombre de los álbumes que en su ID contengan un 3.


*/
SELECT Nombre_Album FROM `ALBUM`  WHERE ID_Album LIKE "%3%"


/*Consulta 6 

Se le solicita mostrar el nombre del álbum y de su artista, de aquellos artistas que su ID termine con una t.


*/
SELECT Nombre_Album, Nombre_Artista FROM `PERTENECE` P 
LEFT JOIN ALBUM A ON A.ID_Album=P.ID_Album
LEFT JOIN ARTISTA AR ON AR.ID_Artista=P.ID_Artista
WHERE AR.ID_Artista LIKE "%t"
