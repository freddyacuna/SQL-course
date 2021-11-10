/*
* Consulta 1
* Muestre la ID y monto total recaudado (incluyendo IVA) de los planes disponibles en la plataforma.
*/
 
 -- Respuesta

SELECT F.IDPlan, CONCAT("$", FORMAT(SUM(F.DesembolsoNeto)*1.19,"###,###"), "CLP") AS MontoTotal
FROM FACTURA AS F
GROUP BY F.IDPlan

/*
* Consulta 2
* Muestre una lista con el nombre de los usuarios que tengan un RUT que comience con 15 millones, siempre y cuando
* hayan tenido más de 10 visualizaciones. Además, muestre su cantidad de facturaciones totales.
*/

 -- Respuesta
 
SELECT U.Nombre_U, T1.Q_Facturas
FROM USUARIO AS U, VISUALIZA AS V, (SELECT U.Nombre_U, COUNT(F.Rut_U) AS Q_Facturas
FROM FACTURA AS F, USUARIO AS U
WHERE F.Rut_U = U.Rut_U
GROUP BY U.Nombre_U) AS T1
WHERE T1.Nombre_U = U.Nombre_U AND U.Rut_U LIKE "15%";
GROUP BY U.Nombre_U
HAVING COUNT(V.Rut_U)>10

-- (47 filas)
/*
*Consulta 3
*Muestre una tabla con dos columnas: El nombre de cada productora, y una llamada Gran Productora, la cual incluirá el
*valor “Sí” para cada productora que supere los 100 empleados, y el valor “No” en caso contrario.
*/

--Respuesta

SELECT PRODUCTORA.Nombre_Productora, IF(PRODUCTORA.Nombre_Productora IN (SELECT
PRODUCTORA.Nombre_Productora
FROM PRODUCTORA
WHERE (SELECT COUNT(TRABAJADOR.Rut_T) FROM PRODUCE, TRABAJADOR
WHERE PRODUCTORA.ID_Productora=PRODUCE.ID_Productora AND
PRODUCE.Rut_T=TRABAJADOR.Rut_T)&gt;100), &quot;Sí&quot;,&quot;No&quot;) AS &quot;Gran Productora&quot;
FROM PRODUCTORA
GROUP BY PRODUCTORA.Nombre_Productora
