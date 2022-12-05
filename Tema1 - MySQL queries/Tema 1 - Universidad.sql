/*
Base de datos "Universidad"

Por favor, descarga la base de datos del archivo schema_universidad.sql, visualiza el diagrama E-R en un editor y efectúa las siguientes consultas:
*/
-- 1 - Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
USE universidad;
SELECT apellido1 AS 'primer apellido', apellido2 AS 'segundo apellido', nombre  FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2 - Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1 AS 'primer apellido', apellido2 AS 'segundo apellido'  FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3 - Devuelve el listado de los alumnos/as que nacieron en 1999.
SELECT nombre, apellido1 AS 'primer apellido', apellido2 AS 'segundo apellido'  FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
-- 4 - Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K' ;
-- 5 - Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6 - Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados/as. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', persona.nombre AS nombre, departamento.nombre AS 'nombre del departamento' FROM persona INNER JOIN departamento ON persona.id = departamento.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 7 - Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', persona.nombre AS nombre, persona.nif AS NIF, asignatura.nombre AS 'nombre de la asignaturas', curso_escolar.anyo_inicio AS 'año de inicio', curso_escolar.anyo_inicio AS 'año de fin' FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id  WHERE persona.nif = '26902806M';
-- 8 Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT departamento.nombre AS 'nombre' FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND asignatura.id_profesor IS NOT NULL;
-- 9 - Devuelve un listado con todos los alumnos/as que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT persona.nombre AS 'nombre', persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido' FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id  WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019 AND alumno_se_matricula_asignatura.id_alumno IS NOT NULL;

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
-- 1 - Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados/as. El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT departamento.nombre AS 'nombre del departamento', persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', persona.nombre AS 'nombre' FROM persona LEFT JOIN profesor ON  profesor.id_profesor = persona.id LEFT JOIN departamento ON  profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC; 
-- 2 - Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT  persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', persona.nombre AS 'nombre' FROM persona LEFT JOIN profesor ON  profesor.id_profesor = persona.id LEFT JOIN departamento ON  profesor.id_departamento = departamento.id WHERE departamento.nombre IS NULL ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC; 
-- 3 - Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.nombre AS 'nombre del departamento' FROM departamento LEFT JOIN profesor ON  profesor.id_departamento = departamento.id WHERE profesor.id_profesor IS NULL; 
-- 4 - Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT DISTINCT persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', persona.nombre AS 'nombre' FROM persona LEFT JOIN profesor ON  profesor.id_profesor = persona.id LEFT JOIN asignatura ON  profesor.id_departamento = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL  ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC; 
-- 5 - Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT asignatura.nombre AS 'nombre de la asignatura' FROM asignatura LEFT JOIN profesor ON  profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_profesor IS NULL; 
-- 6 - Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT DISTINCT departamento.nombre AS 'nombre del departamento' FROM departamento LEFT JOIN profesor ON  profesor.id_departamento = departamento.id LEFT JOIN asignatura ON  profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON  alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN curso_escolar ON  curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio IS NULL AND asignatura.nombre IS NULL; 

-- Consultas resumen:
-- 1 - Devuelve el número total de alumnos existentes.
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno';
-- 2 - Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(id) FROM persona WHERE fecha_nacimiento LIKE '1999%';
-- 3 - Calcula cuántos/as profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT  DISTINCT departamento.nombre AS 'nombre del departamento', (SELECT COUNT(id_profesor) FROM profesor WHERE profesor.id_departamento = departamento.id) AS 'numero_profesores' FROM departamento LEFT JOIN profesor ON  departamento.id = profesor.id_departamento WHERE profesor.id_departamento = departamento.id ORDER BY numero_profesores DESC ; 
-- 4 - Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tiene en cuenta que pueden existir departamentos que no tienen profesores/as asociados/as. Estos departamentos también deben aparecer en el listado.
SELECT  DISTINCT departamento.nombre AS 'nombre del departamento', (SELECT COUNT(id_profesor) FROM profesor WHERE profesor.id_departamento = departamento.id) AS 'numero_profesores' FROM departamento LEFT JOIN profesor ON  departamento.id = profesor.id_departamento ORDER BY numero_profesores DESC ; 
-- 5 - Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tiene en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT  DISTINCT grado.nombre AS 'nombre del grado', (SELECT COUNT(id_grado) FROM asignatura WHERE asignatura.id_grado = grado.id) AS 'numero_asignaturas' FROM grado LEFT JOIN asignatura ON  grado.id = asignatura.id_grado ORDER BY numero_asignaturas DESC ; 
-- 6 - Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT  DISTINCT grado.nombre AS 'nombre del grado', (SELECT COUNT(id_grado) FROM asignatura WHERE asignatura.id_grado = grado.id) AS 'numero_asignaturas' FROM grado LEFT JOIN asignatura ON  grado.id = asignatura.id_grado WHERE (SELECT count(id_grado) FROM asignatura WHERE asignatura.id_grado = grado.id) >= 40; -- entiendo que esto es redundante pero no encontre como escribirlo con el ALIAS
-- 7 - Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT  DISTINCT grado.nombre AS 'nombre del grado', asignatura.tipo AS  'tipo_asignatura', (SELECT COUNT(creditos) FROM asignatura WHERE asignatura.tipo = tipo_asignatura) AS 'numero_creditos' FROM grado LEFT JOIN asignatura ON  grado.id = asignatura.id_grado ORDER BY numero_creditos DESC;
-- 8 - Devuelve un listado que muestre cuántos/as alumnos/as se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos/as matriculados/as.
SELECT  DISTINCT curso_escolar.anyo_inicio  AS 'año', (SELECT COUNT(id_alumno) FROM alumno_se_matricula_asignatura ) AS 'numero_alumnos' FROM alumno_se_matricula_asignatura LEFT JOIN asignatura ON  alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN curso_escolar ON  alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id ;
-- 9 - Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT  DISTINCT persona.id AS 'id', persona.nombre AS 'nombre', persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido',(SELECT COUNT(id) FROM asignatura WHERE profesor.id_profesor = asignatura.id_profesor) AS 'numero_asignaturas' FROM persona LEFT JOIN profesor ON  persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor ORDER BY numero_asignaturas DESC;
-- 10 - Devuelve todos los datos del alumno más joven.
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 11 - Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT  DISTINCT persona.id AS 'id', persona.nombre AS 'nombre', persona.apellido1 AS 'primer apellido', persona.apellido2 AS 'segundo apellido', departamento.nombre AS 'nombre del departamento' FROM persona LEFT JOIN profesor ON  persona.id = profesor.id_profesor LEFT JOIN departamento ON  departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor  = asignatura.id_profesor WHERE asignatura.id IS NULL AND departamento.id IS NOT NULL;




