REQUERIMIENTOS

1.	Al momento de entregar los costos de los estantes, hubo un error y se entregaron con un 10% de recargo. Se pide que, con los conocimientos que posee, pueda modificar esta situación y así presentarlos sin el recargo señalado.

UPDATE ITEM
SET ITEM.Costo = ITEM.Costo/1.1
WHERE ITEM.Codigo IN (SELECT ESTANTE.Codigo
                      FROM ESTANTE)

2.	Dado que se busca tener una base de datos actualizada, se pide eliminar de la base a aquel personal que no presente ventas desde el 30 de mayo del 2017.

DELETE
FROM PERSONAL
WHERE PERSONAL.RutPersonal IN (SELECT T1.RutVendedor
                               FROM (SELECT ADQUIERE.RutVendedor, MAX(VENTA.Fecha) AS UltimaVenta
                                     FROM ADQUIERE INNER JOIN VENTA on ADQUIERE.NroBoleta = VENTA.NroBoleta
                                     GROUP BY ADQUIERE.RutVendedor) AS T1
                               WHERE T1.UltimaVenta < '2017-05-30')


3.	Con el fin de poder hacer correcciones y testear nuevos precios en cuanto a los libros, se le pide que duplique la tabla LIBRO, generando una nueva tabla llamada LIBRO_v2, la cual debe tener las mismas características y datos que la tabla original.

CREATE TABLE LIBRO_v2 (
    Codigo VARCHAR(10) NOT NULL,
    Nombre TEXT,
    Autor TEXT,
    PrecioVenta INT(11),
    IdCategoria VARCHAR(20),
    PRIMARY KEY (Codigo),
    FOREIGN KEY (Codigo) REFERENCES ITEM(Codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(IdCategoria) REFERENCES CATEGORIA(Identificador) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO LIBRO_v2
SELECT * FROM LIBRO
—-----

CREATE TABLE LIBRO_v2 SELECT * FROM LIBRO;
ALTER TABLE LIBRO_v2 ADD PRIMARY KEY(Codigo);
ALTER TABLE LIBRO_v2 ADD FOREIGN KEY(Codigo) REFERENCES ITEM(Codigo) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE LIBRO_v2 ADD FOREIGN KEY(IdCategoria) REFERENCES CATEGORIA(Identificador) ON DELETE CASCADE ON UPDATE CASCADE;

4.	Considerando que la empresa realizó todas las gestiones necesarias para hacer efectivos acuerdos comerciales con nuevos proveedores, se les pide agregarlos a la base de datos:

Ocho Libros Editores Limitada
RutEmpresa: 785045009
Nombre: Ocho Libros
Evaluacion: ★★★★
Ubicación: 2608 Avenida Providencia

Libros Pascal Limitada
RutEmpresa: 760918547
Nombre: Libros Pascal
Evaluacion: ★★★
Ubicación: 636-G Ramon Cruz

INSERT INTO PROVEEDOR VALUES (785045009, 'Ocho Libros', '????', '2608 Avenida Providencia');
INSERT INTO PROVEEDOR VALUES (760918547, 'Libros Pascal', '???', '636-G Ramon Cruz');


5.	Con el fin de poder distinguir rápidamente los costos de los libros, se le solicita que cree una nueva columna (llamada EsLibro) en la tabla ITEM, que entregue 1 si el código corresponde a un libro y 0 en caso contrario.

ALTER TABLE ITEM ADD EsLibro INT(1) DEFAULT 0;
UPDATE ITEM
SET ITEM.EsLibro= 1
WHERE ITEM.Codigo IN (SELECT LIBRO.Codigo
                     FROM LIBRO)


6.	Gracias a un acuerdo con la parte administrativa de la empresa, se llegó a la decisión unánime de que todos los proveedores que hayan sido partícipes de más de 25 órdenes de compra tengan una clasificación de “★★★★★”, más de 10 tengan una clasificación de “★★★”, mientras que los otros se busca clasificarlos como “★”. Introduzca estas modificaciones en nuestra base de datos.
UPDATE PROVEEDOR
SET PROVEEDOR.Evaluacion=IF(PROVEEDOR.RutEmpresa IN (SELECT RutEmpresa
                                                     FROM (SELECT ORDEN_DE_COMPRA.RutEmpresa, COUNT(ORDEN_DE_COMPRA.Numero) AS Q_ODC
                                                           FROM ORDEN_DE_COMPRA
                                                           GROUP BY ORDEN_DE_COMPRA.RutEmpresa) AS T1
                                                     WHERE Q_ODC>25), "★★★★★",
                            IF(PROVEEDOR.RutEmpresa IN (SELECT RutEmpresa
                                                        FROM (SELECT ORDEN_DE_COMPRA.RutEmpresa, COUNT(ORDEN_DE_COMPRA.Numero) AS Q_ODC
                                                              FROM ORDEN_DE_COMPRA
                                                              GROUP BY ORDEN_DE_COMPRA.RutEmpresa) AS T1
                                                        WHERE Q_ODC>10), "★★★", "★"))

7.	Necesita obtener una nueva tabla llamada VENTAS_PREMIUM, la cual debería contener el número de boleta, el rut del cliente, rut del vendedor y la cantidad de aquellas ventas que hayan sido por una cantidad mayor al promedio. Para ello, se pide tomar en cuenta únicamente la cantidad mayor de aquellasboletas realizadas por el mismo vendedor para un mismo cliente.

CREATE TABLE VENTAS_PREMIUM(
    NroBoleta VARCHAR(10) NOT NULL,
    RutCliente VARCHAR(10),
    RutVendedor VARCHAR(10),
    Cantidad INT(10),
    	PRIMARY KEY(NroBoleta, RutCliente, RutVendedor),
    	FOREIGN KEY(NroBoleta) REFERENCES VENTA(NroBoleta) ON DELETE CASCADE ON UPDATE CASCADE,
    	FOREIGN KEY(RutCliente) REFERENCES CLIENTE(Rut) ON DELETE CASCADE ON UPDATE CASCADE,
    	FOREIGN KEY(RutVendedor) REFERENCES PERSONAL(RutPersonal) ON DELETE CASCADE ON UPDATE CASCADE);
                      
INSERT INTO VENTAS_PREMIUM
SELECT ADQUIERE.NroBoleta, ADQUIERE.Rut, ADQUIERE.RutVendedor, MAX(ADQUIERE.Cantidad)
FROM ADQUIERE
WHERE ADQUIERE.Cantidad>(SELECT AVG(ADQUIERE.Cantidad)
                        FROM ADQUIERE)
GROUP BY ADQUIERE.NroBoleta, ADQUIERE.Rut, ADQUIERE.RutVendedor

8.	Se pide que elimine de las tablas VENTA y ADQUIERE toda aquella información de clientes que posean un rut menor a 9 millones.

DELETE
FROM VENTA
WHERE VENTA.NroBoleta IN (SELECT ADQUIERE.NroBoleta
                          FROM ADQUIERE
                          WHERE ADQUIERE.Rut<90000000)

9.	Se le pide que, en la tabla LIBRO, se rellene con “Sin Autor” para aquellos libros que no tengan dato en este atributo.

UPDATE LIBRO
SET LIBRO.Autor="Sin Autor"
WHERE LIBRO.Autor=""

10.	Por último, se requiere ver los años de trayectoria de x, por lo que se necesita crear una nueva columna, ingresando este dato calculado a ella.

ALTER TABLE PERSONAL ADD TRAYECTORIA INT(2) DEFAULT 0;

UPDATE PERSONAL
SET PERSONAL.TRAYECTORIA=TRUNCATE(DATEDIFF(CURRENT_DATE(), PERSONAL.FechaIngreso)/365,0)



