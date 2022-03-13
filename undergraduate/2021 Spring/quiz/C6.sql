/*
* Consulta 1
* Muestre la ID y monto total recaudado (incluyendo IVA) de los planes disponibles en la plataforma.
*/
 
 -- Respuesta

SELECT F.IDPlan, CONCAT("$", FORMAT(SUM(F.DesembolsoNeto)*1.19,"###,###"), "CLP") AS MontoTotal
FROM FACTURA AS F
GROUP BY F.IDPlan

/*
Consulta 1
Incluya un atributo en la tabla personajes para saber el estado de los mismos, por defecto se asume que están todos vivos, pero en caso de que aún no hayan nacido, actualice dicha información. Considere la fecha de entrega (06.06.2021) como fecha límite. 

*/

 -- Respuesta
 
ALTER TABLE PERSONAJE ADD Estado varchar(10) DEFAULT "Vivo";
UPDATE PERSONAJE
SET Estado = "Por_Nacer"
WHERE FechaNacimiento > "2021.06.06"
 
--198 filas afectadas


/*
Consulta 2
Se ha otorgado una bonificación de 200000 a los técnicos que posean un sueldo menor al  promedio de aquellos 50 técnicos con sueldo más bajo. Se le pide que actualice los datos.

*/

--Respuesta

 
UPDATE TRABAJA_UN 
SET Sueldo=Sueldo+200000
WHERE Sueldo<(SELECT AVG(T1.Sueldo)
			FROM (SELECT Sueldo
 				  FROM TRABAJA_UN
 				ORDER BY Sueldo asc limit 50) as T1)
 
--22 filas afectadas 

/*
Consulta 3
Un operador se dio cuenta de que había cometido un grave error que debe ser corregido inmediatamente: Todos los costos de la tabla ASISTE inferiores al promedio, y asociados a películas cuyo nombre contiene un 4, fueron imputados considerando el valor bruto y no el neto. Cambie esto para reflejar correctamente la información financiera.
 */
 
 
UPDATE ASISTE
SET Costo=Costo/1.19
WHERE Costo < (SELECT AVG(A.Costo) AS Promedio
                              FROM (SELECT ASISTE.Costo, ASISTE.Numero FROM ASISTE) AS A, (SELECT P.NumeroPelicula 
                                                                     FROM PELICULA AS P
                                                                     WHERE P.Nombre LIKE '%4%') AS T1
                              WHERE T1.NumeroPelicula = A.Numero
                              )
 
--2993 filas afectadas

