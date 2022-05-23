-- Consulta 1
-- Muestre los cinco libros más vendidos, considerando solo las ventas realizadas entre las 14:00 y 17:00 hrs.

-- Consulta 2
-- Muestre el rut de  los clientes que compraron el libro “Magical Water Plants of the Highland Lochs”, considerando sólo a aquellos que su rut termine en 8 o 9. Ordene alfabéticamente según nombre.

-- Consulta 3
-- Muestre los 10 libros con mayor beneficio, indicando su nombre y margen de ventas, el cual se calcula como precio de venta menos los costos asociados a su adquisición. Además, renombre la tabla como Margen.

-- Consulta 4
-- Muestre la cantidad de libros vendidos según la categoría a la que pertenezcan, ordene los resultados de mayor a menor. 

-- Consulta 5
-- Muestre las dos nacionalidades que tienen mayor representatividad (mayor porcentaje) en la compra de libros. Para esto muestre la nacionalidad con su respectivo porcentaje. Utilice tablas combinadas. 

-- Consulta 6
-- Muestre una lista con el nombre de los clientes y la cantidad de libros que han comprado, siempre y cuando estos tengan un rut que empieza con 15 millones y no residan en Francia. Ordene la lista generada de manera descendente. Utilice tablas combinadas. 


-- PAUTA

-- [CONSULTA 1]

SELECT L.Nombre AS "TOP 5 Libros"
FROM ADQUIERE	A
LEFT JOIN LIBRO	L	ON	A.Codigo=L.Codigo
WHERE NroBoleta in (
SELECT NroBoleta
FROM VENTA
-- WHERE hora >= '14:00' and hora <= '17:00'
WHERE hora BETWEEN '14:00' and '17:00'
) 
GROUP BY A.Codigo
ORDER BY SUM(A.Cantidad) DESC
    LIMIT 5
    
    
-- [CONSULTA 2]

SELECT C.Rut AS 'RUT CLIENTE'
FROM ADQUIERE	A
LEFT JOIN	LIBRO	L	ON	A.Codigo=L.Codigo
LEFT JOIN	CLIENTE	C	ON	C.Rut=A.Rut
WHERE L.Nombre = 'Magical Water Plants of the Highland Lochs' AND RIGHT(C.Rut,1) in (8,9)
ORDER BY C.Nombre ASC

-- [CONSULTA 3]

SELECT DISTINCT L.Nombre AS "TOP 10 Libros", (L.PrecioVenta-I.Costo) AS 'MARGEN VENTA'
FROM ADQUIERE	A
LEFT JOIN	LIBRO	L	ON	A.Codigo=L.Codigo
LEFT JOIN	CLIENTE	C	ON	C.Rut=A.Rut
LEFT JOIN	ITEM	I	ON	I.Codigo=L.Codigo
ORDER BY (L.PrecioVenta-I.Costo) DESC
    LIMIT 10
    
-- [CONSULTA 4]
SELECT C.Nombre AS 'CATEGORIA', SUM(A.Cantidad) AS 'CANTIDAD'
FROM ADQUIERE	A
LEFT JOIN	LIBRO		L	ON	A.Codigo=L.Codigo
LEFT JOIN	CLIENTE		Cl	ON	Cl.Rut=A.Rut
LEFT JOIN	ITEM		I	ON	I.Codigo=L.Codigo
LEFT JOIN	CATEGORIA	C	ON	C.Identificador=L.IdCategoria
GROUP BY (C.Nombre)
ORDER BY SUM(A.Cantidad) DESC


-- [CONSULTA 5]

SELECT pais AS 'TOP NACIONALIDAD', concat(round((COUNT(*) * 100)/(select count(*) from VENTA),2),'%') as
'REPRESENTATIVIDAD % COMPRA LIBROS' FROM (
SELECT DISTINCT NroBoleta, ADQUIERE.RUT, Pais
FROM ADQUIERE, (SELECT CLIENTE.Rut, Pais FROM CLIENTE) AS NACIONALIDAD
WHERE ADQUIERE.Rut=NACIONALIDAD.Rut
) as T1
GROUP BY pais ORDER BY (COUNT(*) * 100)/(select count(*) from VENTA) DESC
LIMIT 2
