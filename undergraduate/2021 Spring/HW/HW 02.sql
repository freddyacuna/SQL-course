/*
REQUERIMIENTOS DE CONSULTAS
*/


--(1) Muestre la cantidad de películas y series que hay, además de qué porcentaje representan con respecto al total de contenidos.

SELECT T1.Qpelicula AS Cantidad_Pelicula, T2.Qserie AS Cantidad_Serie, CONCAT("%",TRUNCATE((T1.Qpelicula/T3.Total)*100,2)) AS Porcentaje_Pelicula, CONCAT("%",TRUNCATE((T2.Qserie/T3.Total)*100,2)) AS Porcentaje_Serie 
FROM (SELECT COUNT(PELICULA.IDContenido) AS Qpelicula
      FROM PELICULA) AS T1, (SELECT COUNT(SERIE.IDContenido) AS Qserie
                             FROM SERIE) AS T2, (SELECT COUNT(CONTENIDO.ID_Contenido) AS Total
                                                 FROM CONTENIDO) AS T3


--(2) Muestre el nombre de las series estrenadas el año pasado que no hayan sido realizadas por Walt Disney Pictures.

SELECT DISTINCT CONTENIDO.Nombre_C as NombreSerie
FROM CONTENIDO INNER JOIN SERIE ON SERIE.IDContenido=CONTENIDO.ID_Contenido, PRODUCE, PRODUCTORA
WHERE  year(CONTENIDO.FechaEstreno)=2020 AND PRODUCE.IDContenido=CONTENIDO.ID_Contenido and PRODUCE.ID_Productora=PRODUCTORA.ID_Productora and PRODUCTORA.Nombre_Productora<>"Walt Disney Pictures"


--(3) 
/*
Se pide que muestre las dos nacionalidades de los usuarios que tienen mayor representatividad en la plataforma, sin considerar Brasil ni Argentina. 
Para esto genere una lista que contenga la nacionalidad junto con su porcentaje de representatividad en relación al total.
*/
SELECT T1.Nacionalidad, CONCAT(TRUNCATE((T1.Cantidad/T2.TOTAL)*100,2),"%") AS Porcentaje
FROM (SELECT USUARIO.Pais_U as Nacionalidad, COUNT(USUARIO.Rut_U) AS Cantidad
   FROM USUARIO
   WHERE USUARIO.Pais_U<>"Brasil" AND USUARIO.Pais_U<>"Argentina"
   GROUP BY USUARIO.Pais_U) AS T1, (SELECT COUNT(USUARIO.Rut_U) AS TOTAL
                                                                     FROM USUARIO) AS T2
ORDER BY Porcentaje DESC
LIMIT 2


--(4) 
/*
Muestre la cantidad de años de experiencia promedio de los productores que hayan hecho películas asociadas a Premium Access, 
generando una lista con el nombre del contenido junto a su cantidad de años de experiencia promedio.
*/

SELECT DISTINCT CONTENIDO.Nombre_C, TRUNCATE(AVG(PRODUCTOR.AñosExp),0) as Promedio
FROM PRODUCTOR inner JOIN TRABAJADOR on PRODUCTOR.Rut_T=TRABAJADOR.Rut_T INNER JOIN PRODUCE ON TRABAJADOR.Rut_T=PRODUCE.Rut_T INNER JOIN CONTENIDO ON PRODUCE.IDContenido=CONTENIDO.ID_Contenido INNER JOIN PREMIUM_ACCESS ON CONTENIDO.ID_Contenido=PREMIUM_ACCESS.IDContenido
GROUP BY CONTENIDO.Nombre_C


--(5) 
/*
Se le solicita que muestre la cantidad de usuarios que han visto contenidos entre el 20 de diciembre de 2020 y el 31 de marzo de 2021, 
mostrando el nombre de cada contenido junto a su respectiva cantidad de espectadores.
*/

SELECT CONTENIDO.Nombre_C AS Contenido, COUNT(VISUALIZA.IDContenido) AS Cantidad_Usuarios
FROM CONTENIDO,  VISUALIZA
WHERE VISUALIZA.Fecha BETWEEN "2020-12-20" AND "2021-03-31" AND VISUALIZA.IDContenido=CONTENIDO.ID_Contenido  
GROUP BY CONTENIDO.Nombre_C


--(6) 
/*
La gerencia quiere experimentar si es posible aumentar la fidelidad de los usuarios si, en el día de su cumpleaños, 
se incluye un saludo personalizado dentro de algún contenido que estén viendo en vivo. 
Debido a esto, se pide que genere una lista con los usuarios (si es que hay) que vieron algún contenido el día de su cumpleaños, 
con el nombre del usuario y el contenido visto.
*/

SELECT USUARIO.Nombre_U, CONTENIDO.Nombre_C
FROM USUARIO, VISUALIZA, CONTENIDO
WHERE USUARIO.Rut_U = VISUALIZA.Rut_U AND day(USUARIO.FechaNac_U) = day(VISUALIZA.Fecha) AND
month(USUARIO.FechaNac_U) = month(VISUALIZA.Fecha) AND CONTENIDO.ID_Contenido = VISUALIZA.IDContenido


--(7) 
/*
Se requiere saber cuánto es el salario promedio por género de desarrolladores, 
pero solo de los lenguajes de programación utilizados por ambos géneros, los cuales deben ser mencionados. 
*/
SELECT T1.Masculino, T2.Femenino, T2.LenguajeProg
FROM (SELECT DESARROLLADOR.LenguajeProg, CONCAT("$",FORMAT(TRUNCATE(avg(Salario),0),"###.###.###"),"CLP") as Masculino
	FROM INGENIERO, DESARROLLADOR
	WHERE INGENIERO.Genero_Ing="M" and DESARROLLADOR.Rut_Ing=INGENIERO.Rut_Ing
    	GROUP BY DESARROLLADOR.LenguajeProg) as T1, 
    (SELECT DESARROLLADOR.LenguajeProg, CONCAT("$",FORMAT(TRUNCATE(avg(Salario),0),"###.###.###"),"CLP") as Femenino
	FROM INGENIERO, DESARROLLADOR
	WHERE INGENIERO.Genero_Ing="F" and DESARROLLADOR.Rut_Ing=INGENIERO.Rut_Ing
   	 GROUP BY DESARROLLADOR.LenguajeProg) as T2
WHERE T2.LenguajeProg=T1.LenguajeProg


--(8) 
/*
Se requiere saber el nombre de cada director principal que haya trabajado en los tres contenidos más vistos entre marzo y abril. 
Para esto genere una lista con el nombre de dichos directores principales en orden alfabético, junto con los nombres de dichos contenidos.
*/

SELECT *
FROM (SELECT TRABAJADOR.Nombre_T, CONTENIDO.Nombre_C
      FROM PRODUCE, TRABAJADOR, DIRECTOR, CONTENIDO
      WHERE PRODUCE.IDContenido IN (SELECT TABLA1.IDContenido
                                    FROM (SELECT VISUALIZA.IDContenido, COUNT(VISUALIZA.IDContenido) AS "N_VISUAL"
                                          FROM VISUALIZA
                                          WHERE MONTHNAME(Fecha)= "March" OR MONTHNAME(Fecha)= "April"
                                          GROUP BY VISUALIZA.IDContenido  
                                          ORDER BY `N_VISUAL`  DESC LIMIT 3)AS TABLA1) AND TRABAJADOR.Rut_T = PRODUCE.Rut_T AND DIRECTOR.SeñalPrincipal = 1 AND TRABAJADOR.Rut_T = DIRECTOR.Rut_T AND CONTENIDO.ID_Contenido = PRODUCE.IDContenido) AS TABLA2
                                          ORDER BY TABLA2.Nombre_T 


--(9) 
/*
Una madre de familia quiere solicitar una devolución, ya que no sabía que un mismo plan servía para toda la familia, 
por lo que compró uno mensual para ella y un anual para cada una de sus dos hijas. 
Si, además de eso, su hija menor le pidió comprar el Premium Access de “Raya y el Último Dragón”, 
¿Cuánto gastó la madre? Genere una consulta que muestre el monto neto, el IVA y el monto total en pesos chilenos.
*/
SELECT CONCAT("$", FORMAT(ROUND(SUM(2*T1.Precio+T2.Precio+T3.Precio)/1.19, 0), "###.###.###"), " CLP") AS MontoNeto, CONCAT("$", FORMAT(ROUND(SUM(2*T1.Precio+T2.Precio+T3.Precio)-SUM(2*T1.Precio+T2.Precio+T3.Precio)/1.19, 0), "###.###.###"), " CLP") AS IVA, CONCAT("$", FORMAT((SUM(2*T1.Precio+T2.Precio+T3.Precio)), "###.###.###"), " CLP") AS Total
FROM (SELECT PLAN.Precio
              FROM PLAN
              WHERE IDPlan="PNM001") AS T1, (SELECT PLAN.Precio 
                                                                             FROM PLAN
                                                                             WHERE IDPlan="PNA001") AS T2, ( 
                                                                                      SELECT PREMIUM_ACCESS.Precio_PA AS Precio
                                                                                      FROM PREMIUM_ACCESS INNER JOIN CONTENIDO on CONTENIDO.ID_Contenido=PREMIUM_ACCESS.IDContenido
                                                                                      WHERE CONTENIDO.Nombre_C="Raya y el último dragón") AS T3


--(10) 
/*
Para ver si el modelo de negocios está siendo rentable en esta primera etapa (y pensar si invertir más o retirarse) es necesario conocer las utilidades 
que se están generando y compararlas con lo presupuestado, al menos para el período actual. 
Para esto considere que los ingresos reales corresponden al monto generado por la venta de planes y programas de Premium Access 
(aproximadamente la mitad de usuarios paga el promedio de los precios de Premium Access) y, 
el costo como el desembolso por sueldos de ingenieros (considerando 6 meses) y compra de implementos. 
Muestre todos estos valores: costos netos, ingresos netos y utilidades netas (real y presupuestada), en pesos chilenos.
HINT: Considere que el ingreso presupuestado corresponde a la venta de un plan anual + un contenido con premium access promedio por usuario, 
y que los costos presupuestados son iguales a los reales.
*/


SELECT concat("$",format(IngresoReal,"###.###.###"),"CLP") as Ingreso_Real, concat("$",format(CostoReal,"###.###.###"),"CLP") as Costo_Real, CONCAT("$",format((IngresoReal-CostoReal),"###.###.###"),"CLP") as Utilidad_Real, CONCAT("$",FORMAT((IngresoPresupuestado-CostoPresupuestado),"###.###.###"),"CLP") as Utilidad_Presupuestada
from (SELECT SUM(IR1.IngPA+IR2.TotalPlan) as IngresoReal, Round(SUM(CS.CostoSalario+CC.Compras),0) as CostoReal, IP.IngresoPresupuestado, Round(SUM(CS.CostoSalario+CC.Compras),0) as CostoPresupuestado
FROM
(SELECT ROUND(AVG(PREMIUM_ACCESS.Precio_PA)/2,0) as IngPA
FROM VISUALIZA INNER JOIN CONTENIDO on CONTENIDO.ID_Contenido=VISUALIZA.IDContenido INNER JOIN PREMIUM_ACCESS ON CONTENIDO.ID_Contenido=PREMIUM_ACCESS.IDContenido) as IR1, (SELECT SUM(FACTURA.DesembolsoNeto) as TotalPlan
FROM FACTURA) as IR2, (SELECT sum(INGENIERO.Salario)*6 as CostoSalario from INGENIERO) as CS, (SELECT SUM(COMPRA_A.MontoBruto)*1.19 as Compras FROM COMPRA_A) as CC, (SELECT (PAprom+PP)*QU as IngresoPresupuestado
	  FROM (SELECT round(AVG(PREMIUM_ACCESS.Precio_PA),0) as PAprom
	FROM PREMIUM_ACCESS) as T1, (
	SELECT PLAN.Precio as PP
	FROM PLAN
	WHERE IDPlan="PNM001") as T2, (SELECT COUNT(USUARIO.Rut_U) as QU FROM USUARIO) as T3
    ) as IP
    GROUP BY IP.IngresoPresupuestado)  as Tabla


--(11) 
/*
Por necesidades de un modelo cuantitativo de un analista, a usted se le pide mostrar el nombre de aquellos actores cuyo 
representante tenga requerimientos adicionales, que trabaje con más de seis actores registrados en nuestra plataforma, 
y que la cantidad de premios importantes que tienen sus actores en total sea más de 10. 
Además, debe presentar dos columnas que indiquen si el actor estuvo en películas lanzadas en 2020 y 2021 indicando con un Sí o No su presencia en cada año.
*/

SELECT NombreActor, IF(T3.RutTrabajador in (SELECT DISTINCT produce.Rut_T FROM produce INNER JOIN contenido on produce.IDContenido=contenido.ID_Contenido INNER JOIN pelicula on pelicula.IDContenido=contenido.ID_Contenido WHERE pelicula.AñoLanzamiento="2020"),"Si","No") as "2020", IF(T3.RutTrabajador in (SELECT DISTINCT produce.Rut_T FROM produce INNER JOIN contenido on produce.IDContenido=contenido.ID_Contenido INNER JOIN pelicula on pelicula.IDContenido=contenido.ID_Contenido WHERE pelicula.AñoLanzamiento="2021"),"Si","No") as "2021"
FROM (SELECT DISTINCT trabajador.Nombre_T as NombreActor, trabajador.Rut_T as RutTrabajador
FROM actor, trabajador,
(SELECT representante.Rut_R AS R2, COUNT(actor.Rut_T) AS QA
FROM representante INNER JOIN actor on actor.Rut_R=representante.Rut_R
GROUP BY representante.Rut_R
HAVING COUNT(actor.Rut_T)>6) as T1 inner JOIN (SELECT representante.Rut_R as R1, SUM(actor.PremiosImportantes) as Pr 
                                     FROM representante INNER JOIN actor ON representante.Rut_R=actor.Rut_R
                                               GROUP BY representante.Rut_R
                                    HAVING SUM(actor.PremiosImportantes)>10) as T2 on T1.R2=T2.R1 INNER JOIN requerimiento ON requerimiento.Rut_R=T2.R1
WHERE actor.Rut_R=T1.R2 AND trabajador.Rut_T=actor.Rut_T) AS T3


--(12) 
/*
Para un estudio de mercado, se requiere conocer la proporción de tipos de dispositivos utilizados por hombres y mujeres al ver contenidos 
sugeridos por el algoritmo más reciente durante lo que va del año. Muestre las proporciones distinguiendo por tipo de dispositivo y por hombres/mujeres.
*/

SELECT CONCAT(Round(((Te.QTe)/sum(Te.Qte+S.QS+N.QN+Ta.QTa))*100,2),"%") as "%Televisores", CONCAT(ROUND(((S.QS)/sum(Te.QTe+S.QS+N.QN+Ta.QTa))*100,2),"%") as "%Smartphone", CONCAT(ROUND(((N.QN)/sum(Te.QTe+S.QS+N.QN+Ta.QTa))*100,2),"%") as "%Notebook", CONCAT(ROUND(((Ta.QTa)/sum(Te.QTe+S.QS+N.QN+Ta.QTa))*100,2),"%") as "%Tablet", Te.G1 as Genero
From (SELECT DISTINCT COUNT(DISPOSITIVO.Tipo_D) as QTe, USUARIO.Genero_U as G1
FROM DISPOSITIVO INNER JOIN VISUALIZA ON DISPOSITIVO.MAC_D=VISUALIZA.MAC_D INNER JOIN USUARIO on VISUALIZA.Rut_U=USUARIO.Rut_U INNER JOIN SUGIERE ON USUARIO.Rut_U=SUGIERE.Rut_U INNER JOIN ALGORITMO ON ALGORITMO.Version=SUGIERE.Version
WHERE ALGORITMO.Version="9.83.3K" and DISPOSITIVO.Tipo_D="Televisor" and YEAR(VISUALIZA.Fecha)=2021
GROUP BY USUARIO.Genero_U) as Te, (SELECT DISTINCT COUNT(DISPOSITIVO.Tipo_D) as QS, USUARIO.Genero_U AS G2
FROM DISPOSITIVO INNER JOIN VISUALIZA ON DISPOSITIVO.MAC_D=VISUALIZA.MAC_D INNER JOIN USUARIO on VISUALIZA.Rut_U=USUARIO.Rut_U INNER JOIN SUGIERE ON USUARIO.Rut_U=SUGIERE.Rut_U INNER JOIN ALGORITMO ON ALGORITMO.Version=SUGIERE.Version
WHERE ALGORITMO.Version="9.83.3K" and DISPOSITIVO.Tipo_D="Smartphone" and YEAR(VISUALIZA.Fecha)=2021
GROUP BY USUARIO.Genero_U) as S, (SELECT DISTINCT COUNT(DISPOSITIVO.Tipo_D) as QN, USUARIO.Genero_U AS G3
FROM DISPOSITIVO INNER JOIN VISUALIZA ON DISPOSITIVO.MAC_D=VISUALIZA.MAC_D INNER JOIN USUARIO on VISUALIZA.Rut_U=USUARIO.Rut_U INNER JOIN SUGIERE ON USUARIO.Rut_U=SUGIERE.Rut_U INNER JOIN ALGORITMO ON ALGORITMO.Version=SUGIERE.Version
WHERE ALGORITMO.Version="9.83.3K" and DISPOSITIVO.Tipo_D="Notebook" and YEAR(VISUALIZA.Fecha)=2021
GROUP BY USUARIO.Genero_U) as N, (SELECT DISTINCT COUNT(DISPOSITIVO.Tipo_D) as QTa, USUARIO.Genero_U AS G4
FROM DISPOSITIVO INNER JOIN VISUALIZA ON DISPOSITIVO.MAC_D=VISUALIZA.MAC_D INNER JOIN USUARIO on VISUALIZA.Rut_U=USUARIO.Rut_U INNER JOIN SUGIERE ON USUARIO.Rut_U=SUGIERE.Rut_U INNER JOIN ALGORITMO ON ALGORITMO.Version=SUGIERE.Version
WHERE ALGORITMO.Version="9.83.3K" and DISPOSITIVO.Tipo_D="Tablet" and YEAR(VISUALIZA.Fecha)=2021
GROUP BY USUARIO.Genero_U) as Ta
WHERE Te.G1=S.G2 AND S.G2=N.G3 AND Ta.G4=Te.G1
GROUP BY Te.G1



--(13) Se requiere eliminar de la tabla ACTOR a los actores que no hayan trabajado en películas estrenadas en los últimos 3 años.

--(OPCION A)
DELETE
FROM ACTOR
WHERE ACTOR.Rut_T NOT IN (SELECT DISTINCT TRABAJADOR.Rut_T
                          FROM  TRABAJADOR INNER JOIN PRODUCE ON PRODUCE.Rut_T=TRABAJADOR.Rut_T INNER JOIN CONTENIDO on PRODUCE.IDContenido=CONTENIDO.ID_Contenido INNER JOIN PELICULA on PELICULA.IDContenido=CONTENIDO.ID_Contenido
                         where year(CONTENIDO.FechaEstreno)=2019 or year(CONTENIDO.FechaEstreno)=2020 or year(CONTENIDO.FechaEstreno)=2021)


-- (OPCION B Alternativa)

DELETE 
FROM ACTOR
    WHERE ACTOR.Rut_T NOT IN (SELECT PRODUCE.Rut_T
FROM PRODUCE inner join (SELECT PELICULA.IDContenido,PELICULA.AñoLanzamiento
                  from PELICULA
                  where PELICULA.AñoLanzamiento > 2018) as t1 on PRODUCE.IDContenido = t1.IDContenido)


--(14) 
/*
Para beneficiar a los ingenieros de mayor edad, se aumentará el sueldo de aquellos que sean adultos mayores (60 años o más). 
Si se trata de ingenieros desarrolladores, se aumentará en $100.000 CLP su remuneración, mientras que a los analistas se les dará un aumento de $120.000 CLP. 
Realice las modificaciones pertinentes en una sola consulta.
*/
UPDATE INGENIERO
SET INGENIERO.Salario=IF(INGENIERO.Rut_Ing IN
(SELECT T1.Rut_Ing
FROM (SELECT INGENIERO.Rut_Ing
             FROM INGENIERO
             WHERE INGENIERO.Edad_Ing>=60 AND INGENIERO.Rut_Ing IN (SELECT DESARROLLADOR.Rut_Ing
                                                                                                                               FROM DESARROLLADOR)) AS T1), INGENIERO.Salario+100000, IF(INGENIERO.Rut_Ing IN
(SELECT T2.Rut_Ing
FROM (SELECT INGENIERO.Rut_Ing
             FROM INGENIERO
             WHERE INGENIERO.Edad_Ing>=60 AND INGENIERO.Rut_Ing IN (SELECT ANALISTA.Rut_Ing
                                                                                                                               FROM ANALISTA)) AS T2), INGENIERO.Salario+120000, INGENIERO.Salario))
--#13 filas afectadas


--(15)
/*
Tras una primera buena impresión, la organización ha decidido agregar tres nuevos servidores en tierras sudamericanas. 
Se le pide que ingrese la siguiente información a las tablas correspondientes:

-Servidor 112: 
Dirección MAC: 00:1B:44:11:3A:B7
Dirección IP: 10.168.1.200
Sistema Operativo: Ubuntu 20.04 LTS
Ubicación: Diagonal Paraguay #257, Santiago, RM, Chile

-Servidor 113:
Dirección MAC: E1:B1:CF:3D:4A:AA
Dirección IP: 10.255.1.5
Sistema Operativo: Red Hat Enterprise Linux 8
Ubicación: Avenida Siempreviva #742, Asunción, Paraguay

-Servidor 114:
Dirección MAC: 01:00:5E:00:00:C8
Dirección IP: 10.168.255.16
Sistema Operativo: SUSE Linux Enterprise Server 15 SP2
Ubicación: Baker Street  #221B, Rancagua, Chile

*/
INSERT INTO SERVIDOR VALUES ("00:1B:44:11:3A:B7", "10.168.1.200", "Ubuntu 20.04 LTS", "Diagonal Paraguay", "257", "Santiago", "Chile")
;
INSERT INTO SERVIDOR VALUES ("E1:B1:CF:3D:4A:AA", "10.255.1.5", "Red Hat Enterprise Linux 8", "Avenida Siempreviva", "742", "Asunción", "Paraguay")
;
INSERT INTO SERVIDOR VALUES ("01:00:5E:00:00:C8", "10.168.255.16", "SUSE Linux Enterprise Server 15 SP2", "Baker Street",  "221", "Rancagua", "Chile");


--(16) 
/*
Se le pide que agregue a la tabla PELÍCULA un atributo que indique si esa película está siendo tendencia o no, es decir, 
si la película está dentro de las 10 más visualizadas de la plataforma. El atributo debe llamarse “Es Tendencia” y obtener 
el valor 1 si corresponde a este tipo de películas y el valor 0 si no. 
*/
ALTER TABLE PELICULA ADD Es_TendenciaI INT(1) DEFAULT 0;
UPDATE PELICULA
set PELICULA.Es_Tendencia = "1"
where PELICULA.IDContenido in (select t1.IdContenido
                               from (select VISUALIZA.IDContenido, COUNT(VISUALIZA.IDContenido) as "Q_VISUAL"
from VISUALIZA inner join CONTENIDO on VISUALIZA.IDContenido =CONTENIDO.ID_Contenido
GROUP by VISUALIZA.IDContenido
order by Q_VISUAL DESC
LIMIT 10) as t1)


--(17) Duplique la tabla PREMIUM_ACCESS, generando una nueva tabla llamada “FREEMIUM_ACCESS” que debe poseer las mismas características y datos de la tabla original.

CREATE TABLE FREEMIUM_ACCESS SELECT * FROM PREMIUM_ACCESS;
ALTER TABLE FREEMIUM_ACCESS ADD PRIMARY KEY(ID_PA, IDContenido);
ALTER TABLE FREEMIUM_ACCESS ADD FOREIGN KEY(IDContenido) REFERENCES CONTENIDO(ID_Contenido) ON DELETE CASCADE ON UPDATE CASCADE;



