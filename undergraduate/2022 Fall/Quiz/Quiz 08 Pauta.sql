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
    
    ORDER BY Q_Desc_Acumulados DESC
    LIMIT 20


-- Consulta 5
-- A partir de la consulta anterior, se le solicita mostrar sólo el nombre de los 10 libros que acumulan una mayor cantidad de descuento y la cantidad de años que han pasado (Años_Lanzamiento) desde que se lanzó el libro. Finalmente, ordene el nombre de los libros en orden alfabético. (Utilice tablas combinadas)

-- [CONSULTA 5 - OPCION A]

SELECT Nombre, Años_Lanzamiento
FROM
(
SELECT DISTINCT R.CodigoLibro, LIBRO.Nombre,R.Q_Desc_Acumulados, (YEAR(NOW())-LIBRO_DE_ESTUDIO.Anio) AS Años_Lanzamiento
FROM LIBRO_DE_ESTUDIO, LIBRO,
(SELECT CodigoLibro,  SUM(Descuento) AS "Q_Desc_Acumulados"
FROM LIBRO_DE_ESTUDIO
GROUP BY CodigoLibro) AS R
WHERE LIBRO_DE_ESTUDIO.CodigoLibro=R.CodigoLibro AND
LIBRO.Codigo=R.CodigoLibro
AND R.Q_Desc_Acumulados > 
(
    SELECT  AVG(Descuento) AS "Promedio_Descuento"
FROM LIBRO_DE_ESTUDIO
    )
    
    ORDER BY R.Q_Desc_Acumulados DESC
    LIMIT 10
) AS U


-- Consulta 6
-- Se le solicita mostrar el rut de aquellos proveedores que no cataloguen como “seniors”, es decir que no estén dentro de los 3 proveedores que posean la mayor cantidad de órdenes de compra y que su evaluación sea mayor a 2 estrellas. (Utilice tablas combinadas).

-- [CONSULTA 6 - OPCION A]

SELECT PROVEEDOR.RutEmpresa
FROM PROVEEDOR
LEFT JOIN 
(


SELECT ORDEN_DE_COMPRA.RutEmpresa
FROM ORDEN_DE_COMPRA
WHERE ORDEN_DE_COMPRA.RutEmpresa IN (SELECT PROVEEDOR.RutEmpresa
                                                             FROM PROVEEDOR
                                                             WHERE PROVEEDOR.Evaluacion > "★★")

       GROUP BY ORDEN_DE_COMPRA.RutEmpresa
ORDER BY COUNT(ORDEN_DE_COMPRA.Numero) DESC
LIMIT 3 ) SENIOR ON SENIOR.RutEmpresa=PROVEEDOR.RutEmpresa
WHERE SENIOR.RutEmpresa IS NULL
