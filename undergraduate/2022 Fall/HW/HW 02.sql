-- REQUERIMIENTOS DE CONSULTAS

-- 1. Muestre la cantidad de personas que cuentan con cada tipo de acreditación, además de su porcentaje con respecto al total de personas.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion

|Tipo Acreditación | N  | % |
|------------------|----|---|
|SeñalC            |  # | % |
|SeñalP            |  # | % |

-- 2. Se le pide que muestre la cantidad de emprendimientos que hay por rubro.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT

|Tipo Rubro | N  |
|-----------|----|
|1          |  # |
|2          |  # |
|...        |  # |

-- 3. Muestre un listado de las personas con un nivel educativo medio completo.

SELECT *
FROM PERSONA P
LEFT JOIN ACREDITACION A ON A.IDAcreditacion=P.IDAcreditacion
LEFT JOIN EMPRENDIMIENTO E ON E.RUT=P.RUT
LEFT JOIN NIVEL_EDUCACION ED ON ED.RUT=P.RUT

-- NIVEL_EDUCACION (IDNivel, Completitud, RUT, SenalB, SenalT, TituloProfesionT, SenalM, SenalU, TituloProfesionU)

| RUT   |
|-------|
| 1     |
| 2     |
| ...   |


/*
4. Se pide que muestre las dos nacionalidades, de los usuarios nacidos entre 1980 y 1989, que tienen mayor
representatividad en la plataforma, sin considerar Chile. Para esto genere una lista que contenga la
nacionalidad junto con su porcentaje de representatividad en relación al total.
*/

SELECT * -- Nacionalidad
FROM PERSONA P
WHERE FechaNac 
WHERE P.Nacionalidad <> 'Chile'

| Nacionalidad   |  RANK % Representación |
|----------------|------------------------|
| Nacionalidad 1 |    1er %               |
| Nacionalidad 2 |    2do %               |


/*
5. Se requiere conocer cuáles han sido las 10 regiones con más presencia en la plataforma. Para esto, genere una
tabla que contenga la cantidad de personas por cada región. Considere que los resultados deben estar
ordenados de forma descendente.
*/

SELECT * --Region
FROM PERSONA P

-- QUITAR VACIOS

|Region      | N  |
|------------|----|
|R1          |  # |
|R2          |  # |
|...         |  # |

/*
6. Se le solicita que muestre la cantidad de personas que no tienen credencial, pero que sí tienen interés en
conseguirla, junto a su rango porcentual del registro social de hogares.
*/

SELECT * --Region, InteresCredencial
FROM PERSONA P

ACREDITACION 
IDAcreditacion in (1,3)

|RSH         | N  |
|------------|----|
|0-40%       |
|41%-50%     |
|51%-60%     |
|61%-70%     |
|71%-80%     |
|81%-90%     |



/*
7. Se solicita mostrar el nombre y la edad (en años) de las personas que han realizado un postgrado y han
recibido ayuda técnica.
*/


SELECT Nombre, FechaNac -- (en años)
FROM PERSONA

POSTGRADO -- Excluir los 1 NULL
SE_PROPORCIONA

|NOMBRE         | EDAD  |
|---------------|-------|
|Name 1         | #     |

/*
8. Se requiere conocer el nombre de la persona con mayor antigüedad lograda en el programa de inclusión
laboral, además de si tiene experiencia en relatoría o no.
*/

|NOMBRE         | EDAD  |
|---------------|-------|
|Name 1         | #     |

SELECT Nombre
FROM PERSONA

INCLUSION LABORAL 
FechaInicContrato
FechaTermContrato

FICHA_LABORAL
ExpRelatoria <> NULL

/*
9. Se requiere conocer la cantidad de prácticas promedio de las personas por edad. Para esto, genere una tabla
con la edad, y el número (entero) promedio de prácticas.
*/

SELECT EDAD
FROM PERSONA
REALIZA

|EDAD #         | AVG PRACTIVA  |
|---------------|---------------|
|Name 1         | #             |


/*
10. Se requiere conocer cuál fue la empresa con mayor participación en el programa de inclusión laboral. Para
esto, genere una tabla que contenga el nombre de la empresa, y la cantidad de veces que ésta participó del
programa.
*/



/*
11. Se le solicita mostrar el tipo de ayuda técnica que más veces ha sido prestada. Además, presente dos
columnas que indiquen si la ayuda ha sido otorgada para una persona que ha estado en un programa de
inclusión laboral, o de práctica, indicando con un Sí o un No si la ayuda ha sido usada en el respectivo ítem.
Las columnas deben llamarse “Ayuda IL” y “Ayuda Practica”.
*/

/*
12. Se requiere conocer los 3 canales de captación existentes más efectivos, considerando todos los años
presentes en la base de datos.
*/



-- REQUERIMIENTOS DE ACTUALIZACIÓN
/*
13. Se requiere eliminar de la tabla FICHA_RSH a las fichas que no tengan rango porcentual asociado.
*/

/*
14. Suponga que se efectúa un cambio en el programa, de manera que, a cada persona que haya realizado más de
2 prácticas y pertenezca a algún pueblo originario, ahora se le tramitará en seguida su acreditación de pensión
(si es que no la tenía). Efectúe estos cambios en la base de datos.
*/

/*

15. El encargado de la base de datos se dió cuenta que existen 2 tipos de acreditaciones que no fueron
ingresados, él le pide a usted que agregue los siguientes datos en la tabla proveedor.
-SenalP:
2: Tramitando Pensión.
-SenalC:
2: Tramitando Credencial.
*/

/*
16. Agregue a la tabla PERSONA un atributo llamado “Candidato”, el cual valdrá 1 si es que la persona tiene
ambas acreditaciones, está en el 40% más vulnerable, y cuenta con postgrado.
*/

/*
17. Duplique la tabla INCLUSION_LABORAL, generando una nueva tabla llamada
“INCLUSION_LABORAL2022” que debe poseer las mismas características de la tabla original, pero solo
los datos del año 2021, aunque esta nueva tabla debe decir 2022 en vez de 2021, en el atributo
correspondiente.
*/
