-- REQUERIMIENTOS DE CONSULTAS

/* 1. Muestre la cantidad de personas que se han inoculado con cada vacuna de la base de datos, además de
mostrar su porcentaje con respecto al total de personas vacunadas, independiente de la vacuna
administrada. Asimismo, se pide mostrar los resultados por orden alfabético en base a la vacuna. */

SELECT  T1.Vacuna ,
        T1.Cantidad_Persona,
        CONCAT( TRUNCATE((T1.Cantidad_Persona	/T2.Total)*100,2),"%") AS Porcentaje_Personas
FROM (
SELECT Vacuna, count(*) AS Cantidad_Persona
FROM `SE_INOCULA` GROUP BY VACUNA ORDER BY VACUNA ASC
    ) AS T1,
(SELECT COUNT(*) AS Total 
              FROM `SE_INOCULA`) AS T2

-- 2. Se le pide que muestre la cantidad de personas afectadas por enfermedad. */

-- 3. Muestre un listado de los médicos que hayan ejercido por más de 30 años. */

/* 4. Se pide que muestre las dos nacionalidades de mayor representatividad, considerando aquellas personas
que no vivan en la región metropolitana, y pertenezcan a un rango etario entre 25 y 50 años. Para esto,
genere una lista que contenga la nacionalidad de las personas, junto con su porcentaje de
representatividad en relación al total de personas. */

/* 5. Se requiere conocer cuáles han sido las 3 enfermedades con mayor presencia dentro de la gente infectada.
Para esto, genere una tabla que contenga la cantidad de personas por cada enfermedad. Considere que los
resultados deben estar ordenados de forma descendente. */

/* 6. Se requiere mostrar los puntos de vacunación y su dirección, de aquellos lugares que distribuyan alguna de
las vacunas contra el COVID-19 y que posean certificación extranjera. */

-- 7. Se solicita mostrar el rut y los años de titulado que tienen los enfermeros que hayan salido de la Universidad Diego Portales. */

/* 8. Se requiere mostrar el rut y el tipo de profesión (médico, enfermero, otro) de las dos personas del personal
médico que se hayan tomado la mayor cantidad de años para comenzar a trabajar luego de su titulación */

/* 9. Se requiere conocer el promedio de edad por nacionalidad de aquellas personas que han tenido COVID-19.
Para esto, genere una tabla con la nacionalidad, y su promedio de edad (en números enteros). */

/* 10. Muestre el parentesco y la cantidad de veces que una persona se contagió por un pariente, considerando
sólo a las personas de rango etario entre 18 y 70 años, cuya cantidad de contagios sea mayor a 10. */

/* 11. Se solicita mostrar cada enfermedad junto con la frecuencia de contagio y la vacuna que busca prevenirla.
Para esto, se solicita presentar una columna que indique esta clasificación, siendo “Común” si la
enfermedad se encuentra dentro del 25% con mayor tasa de contagio, &quot;Sospechoso&quot; si se encuentra en el
60% más bajo y &quot;Estándar&quot; en cualquier otro caso. Finalmente, ordene la tabla por el nombre de
enfermedad, clasificación y Nombre de vacuna. */

/* 12. Obtenga el promedio de casos confirmados (truncado) y el máximo de recuperados de enfermedades, sin
embargo, únicamente de aquellos que cumplan con tener vacunas certificadas en el extranjero */

/* 13. Muestra una lista con el rut y el tiempo trabajado de aquellos médicos que hayan trabajado en centros de
salud que cuenten con previsión Fonasa e Isapre */


/* 14. Obtenga rut, tiempo trabajando y la institución de aquellos empleados que cumplan con ser enfermeros y
ser aquellos 5 que llevan más tiempo trabajando. Además, el nombre de la institución se debe mostrar
únicamente por sus tres primeras letras.*/

-- REQUERIMIENTOS DE ACTUALIZACIÓN

-- 15. Se requiere eliminar de la tabla PERSONAL_MEDICO a todos aquellos funcionarios que lleven menos de 5 años trabajando.

/* 16. Se tiene gran preocupación hacia los jóvenes (menores a 25 años) que han contagiado a más de una
persona de la enfermedad que padecen, por lo que se realizó una campaña 100% exitosa para que todas
aquellas personas que estén dentro de este grupo y que sean Fonasa se cambien a Isapre. Efectúe este
cambio en la base de datos.
Suponga que se efectúa un cambio en el programa, de manera que, a cada persona que haya realizado al
menos 2 prácticas y pertenezca a algún pueblo originario, ahora se le tramitará en seguida su acreditación
de pensión (si es que no la tenía). Efectúe estos cambios en la base de datos.*/

/* 17. El encargado cometió una equivocación y se olvidó de agregar algunos datos en la base, por lo que él le
pide a usted que agregue en las tablas que sean necesarias los siguientes datos de médicos, de manera que
se refleje de la mejor forma la información para su posterior uso:

RUT_PM Tiempo_trabajando Titulado Institución
27101620-4 6 23-06-2004 Universidad Mayor
10924256-K 18 12-07-2002 Universidad Arturo Prat
23778599-1 23 19-02-1998 Universidad de Chile
*/

/* 18. Agregue a la tabla PERSONAL_MEDICO un atributo llamado “Experiencia”, siendo Mucha Experiencia si está
dentro del 20% con más experiencia, Experiencia Regular si está en el siguiente 20% y Poca Experiencia si
no se encuentra en ninguno de los dos anteriores. Sin embargo, si se encuentra en esta última clasificación
y fue estudiante de la Universidad de Chile, automáticamente sube una clasificación, es decir, se clasifica
como Experiencia Regular. */

/* 19. Duplique la tabla DIAGNOSTICO_MEDICO, generando una nueva tabla llamada “DIAGNOSTICO_MEDICO2”
que debe poseer las mismas características de la tabla original, pero solo los diagnósticos entregados por
médicos titulados desde el año 2000, aunque en esta nueva tabla se pide que el atributo correspondiente al
médico debe decir “ID_MedicoNuevo”. */
