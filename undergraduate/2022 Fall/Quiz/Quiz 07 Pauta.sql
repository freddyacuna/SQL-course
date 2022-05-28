-- PAUTA

-- Consulta 1
-- Muestre los cinco libros más vendidos, considerando solo las ventas realizadas entre las 14:00 y 17:00 hrs.


-- [CONSULTA 1 - OPCION A]


SELECT L.Nombre AS "TOP 5 Libros"
FROM ADQUIERE A
LEFT JOIN LIBRO L ON A.Codigo=L.Codigo
WHERE NroBoleta in
    (SELECT NroBoleta
     FROM VENTA
     WHERE hora BETWEEN '14:00' AND '17:00' )
GROUP BY A.Codigo
ORDER BY SUM(A.Cantidad) DESC
LIMIT 5

-- [CONSULTA 1 - OPCION B]

SELECT L.Nombre AS NombreLibro,
       SUM(A.Cantidad) AS CantidadVendida
FROM ADQUIERE AS A,
     LIBRO AS L,
     VENTA AS V
WHERE L.Codigo=A.Codigo
  AND V.NroBoleta = A.NroBoleta
  AND V.Hora BETWEEN "14:00:00" AND "17:00:00"
GROUP BY L.Nombre
ORDER BY CantidadVendida DESC
LIMIT 5

-- Consulta 2
-- Muestre el rut de  los clientes que compraron el libro “Magical Water Plants of the Highland Lochs”, considerando sólo a aquellos que su rut termine en 8 o 9. Ordene alfabéticamente según nombre.

-- [CONSULTA 2 - OPCION A]

SELECT C.Rut AS 'RUT CLIENTE'
FROM ADQUIERE A
LEFT JOIN LIBRO L ON A.Codigo=L.Codigo
LEFT JOIN CLIENTE C ON C.Rut=A.Rut
WHERE L.Nombre = 'Magical Water Plants of the Highland Lochs'
  AND RIGHT(C.Rut, 1) in (8,
                          9)
ORDER BY C.Nombre ASC

-- [CONSULTA 2 - OPCION B]

SELECT CLIENTE.Rut
FROM CLIENTE,
     ADQUIERE,
     LIBRO
WHERE CLIENTE.Rut=ADQUIERE.Rut
  AND ADQUIERE.Codigo=LIBRO.Codigo
  AND LIBRO.Nombre="Magical Water Plants of the Highland Lochs"
  AND CLIENTE.Rut LIKE "%8"
  OR "%9"
GROUP BY CLIENTE.Rut
ORDER BY CLIENTE.Nombre DESC


-- Consulta 3
-- Muestre los 10 libros con mayor beneficio, indicando su nombre y margen de ventas, el cual se calcula como precio de venta menos los costos asociados a su adquisición. Además, renombre la tabla como Margen.

-- [CONSULTA 3 - OPCION A]

SELECT DISTINCT L.Nombre AS "TOP 10 Libros",
                (L.PrecioVenta-I.Costo) AS 'MARGEN VENTA'
FROM ADQUIERE A
LEFT JOIN LIBRO L ON A.Codigo=L.Codigo
LEFT JOIN CLIENTE C ON C.Rut=A.Rut
LEFT JOIN ITEM I ON I.Codigo=L.Codigo
ORDER BY (L.PrecioVenta-I.Costo) DESC
LIMIT 10

-- [CONSULTA 3 - OPCION B]

SELECT LIBRO.Nombre,
       (LIBRO.PrecioVenta-ITEM.Costo) AS Margen
FROM LIBRO,
     ITEM
WHERE LIBRO.Codigo=ITEM.Codigo
ORDER BY `Margen` DESC
LIMIT 10


-- Consulta 4
-- Muestre la cantidad de libros vendidos según la categoría a la que pertenezcan, ordene los resultados de mayor a menor. 
    
-- [CONSULTA 4 - OPCION A]
SELECT C.Nombre AS 'CATEGORIA',
       SUM(A.Cantidad) AS 'CANTIDAD'
FROM ADQUIERE A
LEFT JOIN LIBRO L ON A.Codigo=L.Codigo
LEFT JOIN CLIENTE Cl ON Cl.Rut=A.Rut
LEFT JOIN ITEM I ON I.Codigo=L.Codigo
LEFT JOIN CATEGORIA C ON C.Identificador=L.IdCategoria
GROUP BY (C.Nombre)
ORDER BY SUM(A.Cantidad) DESC

-- [CONSULTA 4 - OPCION B]
SELECT CATEGORIA.Nombre,
       SUM(ADQUIERE.Cantidad) AS 'Cantidad Vendida'
FROM LIBRO,
     ADQUIERE,
     CATEGORIA
WHERE LIBRO.Codigo=ADQUIERE.Codigo
  AND LIBRO.IdCategoria=CATEGORIA.Identificador
GROUP BY LIBRO.IdCategoria
ORDER BY `Cantidad Vendida` DESC

-- Consulta 5
-- Muestre las dos nacionalidades que tienen mayor representatividad (mayor porcentaje) en la compra de libros. Para esto muestre la nacionalidad con su respectivo porcentaje. Utilice tablas combinadas. 

-- [CONSULTA 5 - OPCION A]

SELECT pais AS 'TOP NACIONALIDAD',
       concat(round((COUNT(*) * 100)/
                      (SELECT count(*)
                       FROM VENTA), 2), '%') AS 'REPRESENTATIVIDAD % COMPRA LIBROS'
FROM
  (SELECT DISTINCT NroBoleta,
                   ADQUIERE.RUT,
                   Pais
   FROM ADQUIERE,

     (SELECT CLIENTE.Rut,
             Pais
      FROM CLIENTE) AS NACIONALIDAD
   WHERE ADQUIERE.Rut=NACIONALIDAD.Rut ) AS T1
GROUP BY pais
ORDER BY (COUNT(*) * 100)/
  (SELECT count(*)
   FROM VENTA) DESC
LIMIT 2

-- [CONSULTA 5 - OPCION B]

SELECT T1.Nacionalidad,
       CONCAT(TRUNCATE((T1.Cantidad/T2.TOTAL)*100, 2), "%") AS Porcentaje
FROM
  (SELECT CLIENTE.Pais AS Nacionalidad,
          COUNT(CLIENTE.Rut) AS Cantidad
   FROM CLIENTE
   GROUP BY CLIENTE.Pais) AS T1,

  (SELECT COUNT(CLIENTE.Rut) AS TOTAL
   FROM CLIENTE) AS T2
ORDER BY Porcentaje DESC
LIMIT 2

-- Consulta 6
-- Muestre una lista con el nombre de los clientes y la cantidad de libros que han comprado, siempre y cuando estos tengan un rut que empieza con 15 millones y no residan en Francia. Ordene la lista generada de manera descendente. Utilice tablas combinadas. 

-- [CONSULTA 6 - OPCION A]

SELECT LEFT(NOMBRE, LOCATE(' ', NOMBRE) - 1) AS 'NOMBRE CLIENTE',
       CANTIDAD
FROM
  (SELECT CLIENTE.RUT,
          sum(Cantidad) AS 'CANTIDAD',
          Nombre
   FROM CLIENTE,
        ADQUIERE
   WHERE CLIENTE.RUT=ADQUIERE.RUT
     AND Pais <> 'France'
     AND CONVERT(LEFT(CLIENTE.RUT, length(CLIENTE.RUT) - 1),SIGNED INTEGER) BETWEEN 15000000 AND 16000000
   GROUP BY ADQUIERE.RUT) AS CLIENTE_ADQUIERE
ORDER BY CANTIDAD DESC



-- [CONSULTA 6 - OPCION B]

SELECT CLIENTE.Nombre,
       T1.QBoletas AS "Cantidad Comprada"
FROM CLIENTE,
     ADQUIERE,

  (SELECT CLIENTE.Nombre,
          SUM(ADQUIERE.Cantidad) AS QBoletas
   FROM CLIENTE,
        ADQUIERE
   WHERE CLIENTE.Rut=ADQUIERE.Rut
   GROUP BY CLIENTE.Nombre) AS T1
WHERE T1.Nombre=CLIENTE.Nombre
  AND CLIENTE.Rut LIKE "15%"
  AND CLIENTE.Pais<>"France"
GROUP BY CLIENTE.Nombre
ORDER BY T1.QBoletas DESC
