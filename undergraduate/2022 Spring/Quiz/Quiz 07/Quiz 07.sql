-- Se pide escribir consultas SQL para: 

-- Consulta 1
-- Se le solicita mostrar el nombre y rut de aquel personal que no pertenece al personal de aseo.

-- Consulta 2
-- Se le solicita mostrar el nombre de los libros que posean un precio menor al precio promedio de los 10 libros más vendidos. (utilice tabla auxiliar)
SELECT LIB.Nombre
FROM LIBRO AS LIB
WHERE LIB.PrecioVenta<ALL(SELECT AVG(LI.PrecioVenta)
FROM LIBRO AS LI, (SELECT L.Nombre AS Nombre, SUM(A.Cantidad) AS Cantidad_Ventas
FROM VENTA AS V, ADQUIERE AS A, LIBRO AS L
WHERE V.NroBoleta=A.NroBoleta AND A.Codigo=L.Codigo
GROUP BY L.Nombre
ORDER BY Cantidad_Ventas DESC
LIMIT 10) AS T1
WHERE LI.Nombre=T1.Nombre)

-- Consulta 3
-- Se le solicita mostrar en orden alfabético aquellos clientes que han realizado 15 o más compras. (utilice tabla auxiliar)



SELECT C.Nombre AS Nombre_Cliente
FROM ADQUIERE AS A, CLIENTE AS C
WHERE C.Rut=A.Rut
GROUP BY A.Rut
HAVING COUNT(A.NroBoleta)>=15
ORDER BY Nombre_Cliente ASC;



-- Consulta 4
-- Se le pide mostrar el nombre de aquellos proveedores que no cataloguen como “juniors”, es decir, que no estén dentro de los 3 proveedores con menor cantidad de órdenes de compra. (utilice tabla auxiliar)

SELECT Nombre
FROM   PROVEEDOR
WHERE  RutEmpresa NOT IN (SELECT T3.RutEmpresa
                          FROM (SELECT *
                                FROM (SELECT RutEmpresa, COUNT(RutEmpresa) AS Q_Ordencompra
                                      FROM ORDEN_DE_COMPRA
                                      GROUP BY RutEmpresa
                                      ) AS T1                             
                                      ORDER BY Q_Ordencompra ASC
                                      LIMIT 3 
                                 ) AS T3
                         );


-- Consulta 5 
-- Se le solicita mostrar el promedio de venta de los libros de estudio que posean un descuento acumulado (suma) mayor a 1,5. Formato $###.### CLP. (utilice tabla auxiliar)



-- Consulta 6 
-- Se le solicita mostrar el rut y la cantidad de compras de aquellos clientes que tengan una edad menor a 50 años y que sean de Escocia o Inglaterra. ( tabla auxiliar)
