/*
Consulta 1

Debido a una limpieza y mejora en los productos ofrecidos por la librería, 
se decidió dar de baja aquellas categorías que posean una popularidad de 1 y 2 estrellas, 
por lo que se le solicita eliminar de la base de datos dicha información. 
*/
SELECT * FROM `CATEGORIA` WHERE Popularidad IN ('★','★★')

DELETE FROM `CATEGORIA` WHERE Popularidad IN ('★','★★')
/*
Consulta 2

El encargado de ventas incurrió en un error al no considerar el IVA (19%) en el costo de los ítems, 
por lo que se le solicita crear una columna llamada Precio Venta, el cual contendrá el costo, 
considerando el IVA y el 10% de margen de venta. 
*/
ALTER TABLE ITEM ADD PRECIO_VENTA INT(11) DEFAULT NULL;




UPDATE ITEM
SET ITEM.PRECIO_VENTA=(
  SELECT VALOR FROM (
  SELECT * , ROUND(Costo*1.19*1.1,0) AS VALOR FROM `ITEM` 
  ) A WHERE ITEM.Codigo=A.Codigo
)

/*
Consulta 3

Debido a que la categoría de evaluación de los proveedores genera errores y problemas de análisis, 
se requiere cambiar la tipificación a Excelente, Alto, Intermedio, Bajo, Insuficiente, siendo Excelente la puntuación mayor e Insuficiente la más baja. 
*/

UPDATE PROVEEDOR
SET PROVEEDOR. Evaluacion=(
SELECT EVAL FROM(
    SELECT  RutEmpresa,
CASE WHEN Evaluacion='★★★★★'	THEN 'Excelente'
 WHEN Evaluacion='★★★★'		THEN 'Alto'
 WHEN Evaluacion='★★★'		THEN 'Intermedio'
 WHEN Evaluacion='★★'		THEN 'Bajo'
ELSE 'Insuficiente'
END AS EVAL 
FROM `PROVEEDOR`) AS PP WHERE
    PP.RutEmpresa=PROVEEDOR.RutEmpresa
)




/*
Consulta 4

Se le solicita crear una nueva tabla llamada TOPLIBROS, que almacene el código del libro, su nombre, 
precio de venta y costo asociado; de los 10 libros más vendidos, cabe destacar que debe asignar los datos 
correspondientes a cada atributo. Para esto no está permitido duplicar tablas. 

*/
CREATE TABLE TOPLIBROS
AS 
SELECT * FROM (
SELECT A.Codigo, L.Nombre, L.PrecioVenta, I.Costo
FROM(
SELECT Codigo, SUM(Cantidad) AS N FROM `ADQUIERE`
GROUP BY Codigo  
ORDER BY SUM(Cantidad)  DESC
LIMIT 10) A
LEFT JOIN `LIBRO` L ON L.Codigo = A.Codigo
LEFT JOIN ITEM I ON I.Codigo = A.Codigo) P
/*
Consulta 5

Para que el personal de programación pueda testear su grupo de proveedores, se le solicita replicar la  
tabla ORDEN_DE_COMPRA (crear una nueva tabla), generando una nueva tabla llamada OCV2, la cual debe poseer 
las mismas características y datos que la tabla original. 

*/

CREATE TABLE OCV2 LIKE ORDEN_DE_COMPRA; 
INSERT INTO OCV2 SELECT * FROM ORDEN_DE_COMPRA;
/*
Consulta 6

En relación a la Consulta 3, se le solicita crear una nueva columna llamada “Situación”, 
en donde aquellos proveedores que tengan evaluación baja no se les renovará contrato, 
mientras que los que tienen bajo o intermedio se les dará la oportunidad de mejorar, 
mientras que al resto se les mantendrá el contrato. 
Para esto, se le solicita catalogar cada situación como “Anular  contrato”, “Dar aviso”, “Mantener contrato”.  
*/


ALTER TABLE PROVEEDOR ADD Situacion tinytext DEFAULT NULL;


UPDATE PROVEEDOR
SET PROVEEDOR.Situacion=(
SELECT EVAL FROM(
    SELECT  RutEmpresa,
CASE WHEN Evaluacion='Insuficiente'	THEN 'Anular contrato'
 WHEN Evaluacion='Bajo'		THEN 'Dar aviso'
 WHEN Evaluacion='Intermedio'		THEN 'Dar aviso'
ELSE 'Mantener'
END AS EVAL 
FROM `PROVEEDOR`) AS PP WHERE
    PP.RutEmpresa=PROVEEDOR.RutEmpresa
)
