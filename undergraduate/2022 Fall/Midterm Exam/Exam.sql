/*Dado el MERE y MR de la base de datos LIBRERIAFB de MySQL, escriba
consultas de recuperación y/o actualización en SQL:*/


/*P3. a) Mostrar la cantidad total comprada de cada ítem, en orden
descendente.*/

SELECT ITEM.Codigo, SUM(AGRUPA.Cantidad) AS QTotaL
FROM ITEM, AGRUPA
WHERE ITEM.Codigo=AGRUPA.Codigo
GROUP BY ITEM.Codigo
ORDER BY QTotal DESC

/* P3. b) Mostrar la cantidad total comprada de los siete ítems más
adquiridos en la base de datos, indicando si es libro o estante. */

SELECT T1.Codigo, T1.QTotal, IF(T1.Codigo IN (SELECT LIBRO.Codigo
FROM LIBRO), "Libro",
IF(T1.Codigo IN (SELECT ESTANTE.Codigo FROM
ESTANTE), "Estante", "")) AS Tipo
FROM
(SELECT ITEM.Codigo, SUM(AGRUPA.Cantidad) AS QTotaL
FROM ITEM, AGRUPA
WHERE ITEM.Codigo=AGRUPA.Codigo
GROUP BY ITEM.Codigo
ORDER BY QTotal DESC
LIMIT 7) AS T1

/* P3. c) Con el fin de poder visualizar fácilmente los datos, se pide agregar
los siguientes atributos a la tabla ADQUIERE: nombre de los clientes,
nombre del vendedor y nombre del libro adquirido en la venta.
Adicionalmente, inserte los datos respectivos a estos nuevo atributos. */

ALTER TABLE ADQUIERE ADD NombreCliente TEXT;
ALTER TABLE ADQUIERE ADD NombreVendedor TEXT;
ALTER TABLE ADQUIERE ADD NombreLibro TEXT;
UPDATE ADQUIERE
SET ADQUIERE.NombreCliente=(SELECT CLIENTE.Nombre
FROM CLIENTE
WHERE CLIENTE.Rut=ADQUIERE.Rut);
UPDATE ADQUIERE
SET ADQUIERE.NombreVendedor=(SELECT PERSONAL.Nombre
FROM PERSONAL
WHERE PERSONAL.RutPersonal=ADQUIERE.RutVendedor);
UPDATE ADQUIERE
SET ADQUIERE.NombreLibro=(SELECT LIBRO.Nombre
FROM LIBRO
WHERE LIBRO.Codigo=ADQUIERE.Codigo);

/* P3. d) Se solicita mostrar un listado de las transacciones realizadas por la
empresa, ya sean boletas u órdenes de compras, junto a la cantidad de
productos que fueron gestionados en cada una de ellas. Sin embargo,
estas deben ser únicamente transacciones cuya utilidad del producto
supera los $5.000 */

SELECT ADQUIERE.NroBoleta, ADQUIERE.Cantidad
FROM ADQUIERE
WHERE ADQUIERE.Codigo IN (SELECT LIBRO.Codigo
FROM ITEM INNER JOIN LIBRO ON ITEM.Codigo =
LIBRO.Codigo
WHERE (LIBRO.PrecioVenta-ITEM.Costo) > 5000)
UNION
SELECT AGRUPA.Numero, AGRUPA.Cantidad
FROM AGRUPA
WHERE AGRUPA.Codigo IN (SELECT LIBRO.Codigo
FROM ITEM INNER JOIN LIBRO ON ITEM.Codigo =
LIBRO.Codigo
WHERE (LIBRO.PrecioVenta-ITEM.Costo) > 5000)
