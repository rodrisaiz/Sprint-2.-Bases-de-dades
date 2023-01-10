-- 1 - Lista el nombre de todos los productos que hay en la mesa "producto".
USE tienda; 
SELECT nombre FROM producto;
-- 2 - Lista los nombres y precios de todos los productos de la tabla "producto".
SELECT nombre, precio FROM producto;
-- 3 - Lista todas las columnas de la tabla "producto".
SHOW COLUMNS FROM producto;
-- 4 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, CONCAT(precio ,' ', '€') AS EURO, CONCAT(precio * 0.96  ,' ', '$') AS DOLAR  FROM producto;
-- 5 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de "producto", euros, dólares estadounidenses.
SELECT nombre AS 'nombre de los productos' , CONCAT(precio ,' ', '€') AS 'euros', CONCAT(precio * 0.96  ,' ', '$') AS 'dólares estadounidenses'  FROM producto;
-- 6 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a mayúscula
SELECT  UPPER(nombre) AS nombre, precio  FROM producto;
-- 7 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.
SELECT  LOWER(nombre) AS nombre, precio  FROM producto;
-- 8 - Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(LEFT(nombre, 2)) AS ID FROM fabricante;
-- 9 - Lista los nombres y precios de todos los productos de la mesa "producto", redondeando el valor del precio.
SELECT nombre, ROUND(precio) AS precio FROM producto;
-- 10 - Lista los nombres y precios de todos los productos de la tabla "producto", truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, FLOOR(precio) AS precio FROM producto;
-- 11 - Lista el código de los fabricantes que tienen productos en la mesa "producto".
SELECT codigo_fabricante AS 'código de los fabricantes' FROM producto;
-- 12 - Lista el código de los fabricantes que tienen productos en la mesa "producto", eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante AS 'código de los fabricantes' FROM producto;
-- 13 - Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14 - Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15 - Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16 - Devuelve una lista con las 5 primeras filas de la mesa "fabricante".
SELECT * FROM fabricante LIMIT 5;
-- 17 - Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa "fabricante". La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 3,2;
-- 18 - Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19 - Lista el nombre y precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20 - Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre AS nombre, precio, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo;
-- 22 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre AS nombre, precio, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
-- 23 - Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo AS 'código del producto', producto.nombre AS 'nombre del producto', fabricante.codigo AS 'código del fabricante ', fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo;
-- 24 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre AS 'nombre del producto', precio, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;
-- 25 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre AS 'nombre del producto', precio, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
-- 26 - Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre AS nombre, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
-- 27 - Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT producto.nombre AS nombre, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND precio >= 200;
-- 28 - Devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT producto.nombre AS nombre, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE 'Asus' OR fabricante.nombre LIKE 'Hewlett-Packard' OR fabricante.nombre LIKE 'Seagate' ;
-- 29 - Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
SELECT producto.nombre AS nombre, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30 - Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT producto.nombre AS nombre, precio FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
-- 31 - Devuelve un listado con el nombre y precio de todos los productos de cuyos fabricantes contenga el carácter w en su nombre.
SELECT producto.nombre AS nombre, precio FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
-- 32 - Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT producto.nombre AS nombre, precio, fabricante.nombre AS 'nombre del fabricante' FROM producto INNER JOIN  fabricante ON  producto.codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY precio DESC, producto.nombre ASC ;
-- 33 - Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.codigo AS codigo , fabricante.nombre AS 'nombre del fabricante' FROM fabricante INNER JOIN  producto ON  producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NOT NULL;
-- 34 - Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.nombre AS 'nombre del fabricante', producto.nombre AS 'nombre del producto' FROM fabricante LEFT JOIN  producto ON  producto.codigo_fabricante = fabricante.codigo;
-- 35 - Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.nombre AS 'nombre del fabricante' FROM fabricante LEFT JOIN  producto ON  producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NULL;
-- 36 - Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
-- 37 - Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto WHERE precio =(SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1);
-- 38 - Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1;
-- 39 - Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio ASC LIMIT 1;
-- 40 - Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto WHERE precio >=(SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1);
-- 41 - Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio >= (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));


