/*
 * Para potenciar el algoritmo de recomendación de contenidos, se requiere clasificar a los usuarios según su continente:
 * América del Sur, América Central o América del Norte. Agregue el continente respectivo a la tabla de usuarios.
 */
 
 
ALTER TABLE USUARIO ADD Continente TEXT;
UPDATE USUARIO
SET Continente = IF(USUARIO.Pais_U = &quot;Argentina&quot; OR USUARIO.Pais_U = &quot;Brasil&quot; OR USUARIO.Pais_U =
&quot;Chile&quot; OR USUARIO.Pais_U = &quot;Colombia&quot; OR USUARIO.Pais_U = &quot;Peru&quot;, &quot;America del Sur&quot;, IF(USUARIO.Pais_U
= &quot;Costa Rica&quot;, &quot;America Central&quot;, &quot;America del Norte&quot;))
