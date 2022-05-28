-- Consulta 1
-- Se le solicita mostrar el nombre y el país de aquellos clientes que no pertenecen a Inglaterra y que además su rut empiece con diez millones. Finalmente ordene sus nombres en orden alfabético.

-- [CONSULTA 1 - OPCION A]

SELECT Nombre, Pais
FROM CLIENTE
WHERE Pais NOT LIKE'England' AND Rut LIKE '10%'  
ORDER BY `CLIENTE`.`Nombre`  ASC

-- Consulta 2
-- Se le solicita mostrar los libros que tengan un precio mayor al precio promedio de los 10 libros más vendidos independiente de su categoría.

-- [CONSULTA 2 - OPCION A]

SELECT Nombre, PrecioVenta
FROM LIBRO
WHERE PrecioVenta> (
SELECT AVG(PrecioVenta)
FROM LIBRO AS L, (
SELECT LIBRO.Codigo AS CodigoL
FROM LIBRO, ADQUIERE
WHERE LIBRO.Codigo=ADQUIERE.Codigo  
GROUP BY LIBRO.Codigo
ORDER BY SUM(Cantidad) DESC
LIMIT 10
) AS C 
WHERE L.Codigo = C.CodigoL
)
ORDER BY Nombre ASC



-- Consulta 3
-- Se le solicita mostrar en orden alfabético el nombre de aquellos vendedores que han realizado más de 20 ventas.

-- [CONSULTA 3 - OPCION A]

SELECT Nombre
FROM PERSONAL, (
SELECT RutVendedor, COUNT(*) AS Nventa
FROM (
SELECT DISTINCT NroBoleta, RutVendedor
FROM ADQUIERE
) AS A
GROUP BY RutVendedor
) AS J
WHERE PERSONAL.RutPersonal=J.RutVendedor AND Nventa>20
ORDER BY Nombre ASC

-- Consulta 4
-- Se le solicita mostrar el nombre de los primeros 20 libros de estudio junto a la cantidad respectiva de descuentos acumulados (Q_Desc_Acumulados) que poseen una mayor cantidad de descuento que el promedio de todos los libros de estudio. Muestre los nombres en orden decreciente en relación a su descuento.

-- [CONSULTA 4 - OPCION A]

SELECT L.Nombre, Descu.Q_Desc_Acumulados
FROM (
SELECT CodigoLibro,  SUM(Descuento) AS "Q_Desc_Acumulados"
FROM LIBRO_DE_ESTUDIO
GROUP BY CodigoLibro
) AS Descu
LEFT JOIN LIBRO L ON L.Codigo= Descu.CodigoLibro
WHERE Q_Desc_Acumulados > 
(
    SELECT  AVG(Descuento) AS "Promedio_Descuento"
FROM LIBRO_DE_ESTUDIO
    )


-- Consulta 5
-- A partir de la consulta anterior, se le solicita mostrar sólo el nombre de los 10 libros que acumulan una mayor cantidad de descuento y la cantidad de años que han pasado (Años_Lanzamiento) desde que se lanzó el libro. Finalmente, ordene el nombre de los libros en orden alfabético. (Utilice tablas combinadas)

-- [CONSULTA 5 - OPCION A]

-- Consulta 6
-- Se le solicita mostrar el rut de aquellos proveedores que no cataloguen como “seniors”, es decir que no estén dentro de los 3 proveedores que posean la mayor cantidad de órdenes de compra y que su evaluación sea mayor a 2 estrellas. (Utilice tablas combinadas).

-- [CONSULTA 6 - OPCION A]
