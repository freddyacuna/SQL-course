-- REQUERIMIENTOS

-- A través de consultas de MySQL, se pide mostrar la siguiente información:

-- 1.	Muestre qué pasaría si se aplica un impuesto de $1000 a los libros que posean un mayor valor a $10.000. Para esto muestre el nombre del libro, precio original y nuevo precio propuesto.
	
SELECT LIBRO.Nombre, LIBRO.PrecioVenta, LIBRO.PrecioVenta+1000 as NuevoPrecio
FROM LIBRO
WHERE LIBRO.PrecioVenta >= 10000;

-- 2.	Muestre el nombre y rut de los clientes ingleses que hayan nacido el año 1967, junto a su edad.
	
SELECT CLIENTE.Nombre, CLIENTE.Rut, (TRUNCATE(DATEDIFF(CURRENT_DATE(),CLIENTE.FechaNacimiento)/365,0)) AS Edad
FROM CLIENTE
WHERE CLIENTE.Pais="England" AND YEAR(CLIENTE.FechaNacimiento)=1967;

-- 3.	Muestre el código y la capacidad de aquellos estantes que tengan capacidad para más de 200 o menos de 80, pero que no posean libros de la categoría Magical Creatures ni Other books.

SELECT ESTANTE.Codigo, ESTANTE.Capacidad
FROM ESTANTE, CATEGORIA
WHERE ESTANTE.IdCategoria = CATEGORIA.Identificador
AND (ESTANTE.Capacidad>200 OR ESTANTE.Capacidad<80)  AND CATEGORIA.Identificador<> "Magical Creatures" AND CATEGORIA.Identificador<> "Other books";


-- 4.	Muestre la suma de los sueldos del personal que es de aseo y de quienes no, diferenciando entre ellos.

SELECT PERSONAL.EsAseo, CONCAT("$", FORMAT(SUM(PERSONAL.SueldoBruto),'###.###.###'), " CLP") AS Sueldo
FROM PERSONAL
GROUP BY PERSONAL.EsAseo;

-- o

SELECT T1.Sueldo_aseo, T2.Sueldo_no_aseo
FROM (SELECT PERSONAL.EsAseo, CONCAT("$", FORMAT(sum(PERSONAL.SueldoBruto),"###.###.###"), " CLP") AS Sueldo_aseo 
             FROM PERSONAL WHERE PERSONAL.EsAseo = TRUE 
             GROUP BY PERSONAL.EsAseo) AS T1
             ,
            (SELECT PERSONAL.EsAseo, CONCAT("$", FORMAT(sum(PERSONAL.SueldoBruto),"###.###.###"), " CLP") AS Sueldo_no_aseo 
             FROM PERSONAL WHERE PERSONAL.EsAseo = FALSE 
             GROUP BY PERSONAL.EsAseo) AS T2;

-- 5.	Se desea conocer el nombre de los 10 clientes que más compran libros, junto al precio promedio de sus compras.

SELECT DISTINCT CLIENTE.Nombre, CONCAT("$ ", FORMAT(ROUND(AVG((LIBRO.PrecioVenta)),0),"###.###.###"), " CLP") as CompraPromedio
FROM CLIENTE, ADQUIERE, LIBRO
WHERE CLIENTE.Rut=ADQUIERE.Rut AND ADQUIERE.Codigo=LIBRO.Codigo
GROUP by CLIENTE.Nombre
ORDER by avg(LIBRO.PrecioVenta) DESC
LIMIT 10;

-- 6.	Muestre una lista de los vendedores que vendieron entre 10 y 14 libros en una sola venta, presentando el nombre de ellos y su respectivo sueldo con formato “$ SUELDO CLP” ordenado por nombre de forma alfabética.

SELECT DISTINCT T1.NombreVendedor, T1.Sueldo
FROM (SELECT PERSONAL.Nombre as NombreVendedor, CONCAT("$",   FORMAT(PERSONAL.SueldoBruto,'###.###.###'), " CLP") AS Sueldo FROM PERSONAL,ADQUIERE WHERE PERSONAL.EsVendedor=1 AND PERSONAL.RutPersonal=ADQUIERE.RutVendedor) as T1
ORDER BY T1.NombreVendedor ASC;

-- 7.	Muestre el porcentaje de cada popularidad de categoría que representa respecto al total.

SELECT T1.Estrellas,  CONCAT(TRUNCATE((T1.Cantidad/T2.Total)*100,2), "%") AS Porcentaje
FROM (SELECT CATEGORIA.Popularidad as Estrellas, COUNT(CATEGORIA.Popularidad) AS Cantidad FROM CATEGORIA GROUP by CATEGORIA.Popularidad) AS T1, 
            (SELECT COUNT(CATEGORIA.Identificador) as Total FROM CATEGORIA) AS T2;

-- 8.	Mostrar la cantidad total de ítems comprados a los proveedores, donde se necesita saber el costo máximo, mínimo y promedio.
	
SELECT COUNT(ITEM.Codigo) as CantidadItem, CONCAT("$",   FORMAT(AVG(ITEM.Costo),'###.###.###'), " CLP") as PromedioCosto, CONCAT("$ ", FORMAT(ROUND(MAX((ITEM.Costo)),0),"###.###.###"), " CLP") as CostoMaximo, CONCAT("$ ", FORMAT(ROUND(MIN((ITEM.Costo)),0),"###.###.###"), " CLP") as CostoMinimo
FROM ITEM;


-- 9.	Muestre el nombre en mayúscula de los libros que empiecen con M o R, junto al precio promedio de estos.

SELECT DISTINCT UPPER(T1.NombreLibro), CONCAT("$ ", FORMAT(ROUND(AVG((T1.PrecioLibro)),0),"###.###.###"), " CLP") AS PrecioPromedio
FROM (SELECT LIBRO.Nombre as NombreLibro, LIBRO.PrecioVenta as PrecioLibro 
             FROM LIBRO 
             WHERE LIBRO.Nombre LIKE "M%" or LIBRO.Nombre like "C%" ) AS T1
GROUP by T1.NombreLibro

