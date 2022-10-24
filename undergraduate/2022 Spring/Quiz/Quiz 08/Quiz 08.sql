/*
Consulta 1
Muestre una lista de 3 vendedores que vendieron menos de 5 libros en una sola venta, presentando el
nombre de ellos y su respectivo sueldo con formato “$ SUELDO CLP” con orden descendente según el
sueldo de cada vendedor.*/


SELECT Nombre, CONCAT(SueldoBruto, " SUELDO CLP") AS SUELDO FROM (SELECT NroBoleta, RutVendedor, SUM(Cantidad) AS TOTAL_LIBRO FROM `ADQUIERE` GROUP BY NroBoleta, RutVendedor ) VENTA 
LEFT JOIN (SELECT RutPersonal, Nombre, SueldoBruto FROM PERSONAL ) VENDEDOR ON VENTA.RutVendedor=VENDEDOR.RutPersonal
WHERE TOTAL_LIBRO<5
ORDER BY VENDEDOR.SueldoBruto DESC LIMIT 3

/* 
Consulta 2
Se solicita mostrar los proveedores que tienen 3 estrellas y dentro de su Rut el dígito verificador es igual a 1.*/

SELECT Nombre FROM `PROVEEDOR` WHERE RutEmpresa LIKE "%1" AND Evaluacion = "★★★"

/*
Consulta 3
Se le solicita mostrar el código de cada ítem y el porcentaje que representa respecto al total.*/

SELECT T1.Codigo, CONCAT(TRUNCATE((T1.Cantidad/T2.Total)*100,2), "%") AS Porcentaje
FROM (SELECT ITEM.Codigo , COUNT(ITEM.Codigo) AS Cantidad
      FROM ITEM
      GROUP BY ITEM.Codigo) AS T1, (SELECT COUNT(ITEM.Codigo) as Total
                               FROM ITEM) AS T2
/*
Consulta 4
Muestre el promedio de veces que es requerido un libro por año.*/

SELECT AVG(CONTADOR) AS PROMEDIO
FROM 
(SELECT LIBRO_DE_ESTUDIO.CodigoLibro, COUNT(LIBRO_DE_ESTUDIO.Anio) AS CONTADOR
FROM LIBRO_DE_ESTUDIO
GROUP BY LIBRO_DE_ESTUDIO.CodigoLibro ) A

/*
Consulta 5
Se solicita conocer los nombres de clientes, sus rut respectivos y sus cantidades compradas, por boleta,
siempre y cuando hayan sido atendidos por los vendedores cuyos rut comienzan con 16 y el mes de fecha
de venta corresponda a Marzo.*/

SELECT CLI.Nombre AS Nombre_Cliente, CLI.Rut AS Rut_Cliente, Total_Compra, AD.NroBoleta
FROM (SELECT NroBoleta, Rut, RutVendedor, SUM(Cantidad) AS Total_Compra FROM `ADQUIERE` GROUP BY NroBoleta, Rut, RutVendedor) AD
LEFT JOIN (SELECT NroBoleta, Fecha FROM VENTA) VT ON VT.NroBoleta=AD.NroBoleta
LEFT JOIN (SELECT Rut, Nombre FROM CLIENTE) CLI ON CLI.Rut=AD.Rut
WHERE RutVendedor LIKE "16%" AND MONTH(Fecha)=3  


/*
Consulta 6
Se le solicita mostrar la cantidad y el costo de venta promedio para los libros que posean un descuento
acumulado (suma) menor a 1. Formato $###.### CLP.*/


SELECT SUM(Total_Libro) AS CANTIDAD, CONCAT('$',FORMAT(AVG(Costo),'###.###.###'),'CLP')  AS COSTO_VENTA 
FROM (
SELECT Codigo, SUM(Cantidad) AS Total_Libro FROM `ADQUIERE` GROUP BY Codigo 
) T1
LEFT JOIN (
SELECT * FROM `ITEM` WHERE Codigo IN (SELECT CodigoLibro FROM (SELECT CodigoLibro, SUM(Descuento) AS DESACUM FROM `LIBRO_DE_ESTUDIO` GROUP BY CodigoLibro ) DESCUEN WHERE DESACUM <1)
    ) T2 ON T1.Codigo= T2.Codigo 
    WHERE  T2.Codigo IS NOT NULL
