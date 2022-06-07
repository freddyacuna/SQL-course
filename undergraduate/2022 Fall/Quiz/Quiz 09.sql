/*
Actualización 1 (5 pts)
Debido a un error en el ingreso de datos, se pide que eliminen todos los clientes que pertenezcan a England, siempre y cuando su rut  termine con el número 9.
*/

/*
Actualización 2 (5 pts)
El practicante encargado de digitar los precios de los libros cometió un error en los precios de venta de los libros, al no agregar el IVA (19%), y no incorporar el margen de venta (11%). No obstante, este error no ocurrió con el libro llamado “Magical Water Plants of the Highland Lochs”. Se pide arreglar el error aumentando el precio para los libros afectados.
*/

/*
Actualización 3 (10 pts)
La popularidad de la tabla “CATEGORIA” genera dificultad para realizar diversos análisis, por lo que se requiere tipificar el nivel de popularidad de la tabla, agregando un atributo llamado NivelPop, el que deberá tener el valor “Bajo” si posee 1 estrella, “Mediano” si tiene entre 2 a 4 estrellas, y “Alto” si tiene 5 estrellas. 
*/

ALTER TABLE CATEGORIA ADD NivelPop VARCHAR(16) DEFAULT NULL;

UPDATE CATEGORIA
SET CATEGORIA.NivelPop =  CASE WHEN CATEGORIA.Popularidad = "★" THEN "Bajo"
								WHEN CATEGORIA.Popularidad = "★★★★★" THEN "Alto"
                                ELSE "Mediano"


UPDATE CATEGORIA
SET CATEGORIA.NivelPop =  IF(CATEGORIA.Popularidad = "★","Bajo", IF(CATEGORIA.Popularidad = "★★★★★","Alto","Mediano" ) )
;
-- CASE CATEGORIA.Popularidad WHEN CATEGORIA.Popularidad = "★" THEN "Bajo" WHEN CATEGORIA.Popularidad = "★★★★★" THEN "Alto" ELSE "Mediano" END CASE;


SELECT *
FROM CATEGORIA


/*
Actualización 4 (10 pts)
Para que el personal de programación pueda testear sus nuevas ideas de libros sin riesgos asociados, se le pide a usted que replique tabla AGRUPA (crear una nueva tabla), generando una nueva tabla llamada AGRUPARESPALDO, la cual debe poseer las mismas características y datos que la tabla original.
*/

CREATE TABLE `AGRUPARESPALDO` (
  `Numero` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Codigo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Cantidad` int(10) NOT NULL
)

ALTER TABLE `AGRUPARESPALDO`
  ADD PRIMARY KEY (`Numero`,`Codigo`),
  ADD KEY `Codigo` (`Codigo`);

ALTER TABLE `AGRUPARESPALDO`
  ADD CONSTRAINT `AGRUPARESPALDO_ibfk_1` FOREIGN KEY (`Numero`) REFERENCES `ORDEN_DE_COMPRA` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AGRUPARESPALDO_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `ITEM` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  
/*
Actualización 5 (15 pts)
Crear una nueva tabla llamada CONSULTA5, que almacene el código del libro, su precio de venta y costo asociado; de los libros "Magical Water Plants of the Highland Lochs", “Spell potions” y “The Decline of Pagan Magic”, cabe destacar que debe asignar los datos correspondientes a cada atributo. Para esto no está permitido duplicar tablas.
*/
CREATE TABLE `CONSULTA5` (
  `Codigo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `PrecioVenta` int(11) NOT NULL,
  `Costo`int(11) NOT NULL
) 

ALTER TABLE `CONSULTA5`
  ADD PRIMARY KEY (`Codigo`);
ALTER TABLE `CONSULTA5`
  ADD CONSTRAINT `CONSULTA5_ibfk_1` FOREIGN KEY (`Codigo`) REFERENCES `ITEM` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO CONSULTA5
SELECT L.Codigo, PrecioVenta, Costo
FROM LIBRO L
LEFT JOIN ITEM I ON I.Codigo=L.Codigo
WHERE L.Nombre in ("Magical Water Plants of the Highland Lochs","Spell potions", "The Decline of Pagan Magic")




/*


Actualización 6 (15 pts)
Debido a un plan de retención de buenos talentos, se solicita agregar un atributo llamado TipoVendedor a la tabla PERSONAL. Los valores de este atributo deben ser: “Destacado”, si los vendedores han vendido más de 810 unidades, “Normal”, si han vendido entre 750 y 810 unidades, y en caso contrario debe ser categorizado como “Bajo”. Además, debido a decisiones de la gerencia, se le pide que elimine todos los vendedores que fueron clasificados como “Bajo” , ya que, deciden reemplazarlos por otros.
*/
