-- Sobre la base de datos EMPRESA, se pide escribir las siguientes consultas SQL:

-- 1. (0.5 puntos) Listar el nombre y número de departamentos que NO tienen proyectos.
SELECT NombreD, NúmeroD
FROM DEPARTAMENTO
WHERE NúmeroD NOT IN (SELECT ND 
                      FROM PROYECTO
                     )
