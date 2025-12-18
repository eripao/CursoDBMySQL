
-- FECHA: 17-12-2025
-- FUNDAMENTOS DE CONSULTAS EN SQL
-- funciones que facilitan la extracción de info que contine nuestrs BDD
-- Consultas de la BDD salud total
-- generación de 50 registros
-- nos falta generar datos para medicamentes

-- CONSULTAS
select count (*) from clientes;

select count (*) from medicinas;

-- consultar los datos de un cliente por su número de cedula
-- ejem:

select *
from clientes
where cedula = '1720026663';-- aqui establecemos una condicion, dato si existe

select *
from clientes
where cedula = '09898999999';-- aqui establecemos una condicion, dato si existe

-- caso: Proyeccion: Consultar el email de un cliente por su cédula
select email
from clientes
where cedula = '1723006035';

-- caso consulta el nombre de un cliente por medio de su cedula
SELECT nombre
from clientes
where cedula = '1723006035';

-- caso consultar dos atributos de la tabla cliente por su número de cedula
select nombre, telefono
from clientes
where cedula = '1723006035';

-- caso consultamos el nombre una medicina por su id
-- ******

-- caso queremos saber todos los clientes cuyo nombre empiece con la letra A o V
SELECT nombre
from clientes
where nombre LIKE 'V%';

-- 
use saludtotal;
SELECT * from medicinas;

-- caso queremos saber todas las medicinas cuyo nombre empiece con la letra F
select nombre
from medicinas
where nombre LIKE 'B%';

-- caso: queremos saber si en nuestra base de datos tenemos algun cliente que se llame juan
SELECT cedula, nombre
from clientes
where nombre LIKE 'juan%';

-- caso: vamos a buscar una palabra dentro de los caracteres de un atributo, en este caso vamos a buscar todos los clientes con apellido perez
SELECT cedula, nombre
from clientes
where nombre LIKE '%perez%' -- indicamos a sql que busque entre los caracteres del atributo

-- DEBER: indagación queremos saber las personas juridicas que tengan como nombre juan
SELECT cedula, nombre
FROM clientes
WHERE tipo = 'NAT';

SELECT cedula, nombre
FROM clientes
WHERE tipo = 'JUR'
  AND nombre LIKE '%Juan%';

-- DEBER: analizar el siguiente caso: buscar los clientes cuyo email tenga dominio gmail y sean juridicas
SELECT *
FROM clientes
WHERE tipo = 'JUR'
  AND email LIKE '%@gmail.com%';

-- DEBER: Aplicamos la consulta anterior en donde podamos consultar el nombre de los médicamentes de tipo sea GEN que tenga menos costo
use saludtotal;
SELECT nombre, precio
FROM medicinas
WHERE tipo = 'GEN'
  AND precio > 2
ORDER BY precio ASC;

-- Operadores de comparación encontrados en el libro: BETWEEN
SELECT *
FROM medicinas
WHERE precio BETWEEN 1 AND 2;

SELECT * FROM clientes;
SELECT * from medicinas;

-- ******************************
-- FECHA: 18-12-2025
-- TEMA SUBCONSULTA
-- ******************************
-- REGISTRO DE DATOS Y CONSULTAS TABLA MEDICINAFRECUENTE

SELECT * from medicinafrecuente;
select count (*) from medicinafrecuente;

-- CASO: Consultar los pacientes del plan de medicina frecuente en una lista que incluye: nombre y cedula del paciente, nombre e Id de la mediciona, Descuento
use saludtotal;
SELECT
  cliente_cedula, -- esta es una consulta mono
  (select nombre from clientes where cedula = cliente_cedula),
  medicina_id,
  (select nombre from medicinas where id = medicina_id),
  descuento
from medicinafrecuente;

-- vamos a mejorar la presentación del reporte
-- vamos a usar la etiqueta ALIAS la cual colocamos al final para asignar un nombre
-- ALIAS facilita que el resultado sea amigable
SELECT
  cliente_cedula, -- esta es una consulta mono
  (select nombre from clientes where cedula = cliente_cedula) as cliente,
  medicina_id as id,
  (select nombre from medicinas where id = medicina_id) as medicina,
  descuento
from medicinafrecuente;

-- diseño de subconsulta ejercicio 6.3
use saludtotal;
SELECT
  cliente_cedula, -- esta es una consulta mono
  (select nombre from clientes where cedula = cliente_cedula) as cliente,
  medicina_id as id,
  (select nombre from medicinas where id = medicina_id) as medicina,
  AND descuento > (select cliente_cedula from medicinafrecuente where descuento = 7.50)
from medicinafrecuente;

SELECT
  cliente_cedula, -- esta es una consulta mono
  (select nombre from clientes where cedula = cliente_cedula) as cliente,
  medicina_id as id,
  (select nombre from medicinas where id = medicina_id) as medicina,
  descuento
from medicinafrecuente
where descuento < (
  select descuento 
  from medicinafrecuente
  where cliente_cedula = '1720026663'
);

-- Caso: listado de pacientes del plan medicina frecuente
-- presente el precio final de la medicina junto
-- con el precio  sin descuento
-- publicar en el foro

SELECT * from medicinas;
select precio
from medicinas
where id = 18;

-- PRACTICA EN CLASE
-- Caso: listado de pacientes del plan medicina frecuente
-- presente el precio final de la medicina junto
-- con el precio  sin descuento
-- publicar en el foro
USE saludtotal;
select * from clientes;
SELECT
  cliente_cedula,
  /* datos del cliente mediante subconsultas */
  (SELECT nombre, email  FROM clientes WHERE cedula = cliente_cedula),
  medicina_id,
  /* datos de la medicina mediante subconsultas */
  (SELECT nombre, tipo, precio  FROM medicinas WHERE id = mf.medicina_id),
  descuento,
  /* precio final calculado con subconsulta del precio */
  ROUND(
    (SELECT precio FROM medicinas WHERE id = medicina_id)
    * (1 - mf.descuento / 100),
    2
  ) AS precio_final
FROM medicinafrecuente;


