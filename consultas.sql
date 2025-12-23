
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

-- esta es una consulta monoregistro o monovalor
SELECT
  cliente_cedula, -- esta es una consulta monoregistro o monovalor
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
FROM medicinafrecuente
ORDER;


USE saludtotal;

SELECT
  c.cedula                          AS cliente_cedula,
  c.nombre                          AS cliente_nombre,
  c.email                           AS cliente_email,
  mf.medicina_id,
  m.nombre                          AS medicina_nombre,
  m.tipo                            AS medicina_tipo,         -- GEN / COM
  m.precio                          AS precio_sin_descuento,  -- precio base
  mf.descuento                      AS descuento_porcentaje,  -- ej. 7.50
  ROUND(m.precio * (1 - mf.descuento / 100), 2) AS precio_final,
  mf.condicion,
  mf.frecuencia
FROM medicinafrecuente mf
JOIN clientes  c ON c.cedula  = mf.cliente_cedula
JOIN medicinas m ON m.id      = mf.medicina_id
ORDER BY c.cedula;

-- NUEVO EJERCICIO
-- usando subconsultas
-- CASO: las medicinas comerciales pueden ser reemplazadas
-- por su correspondiente medicinas genéricas.
-- Elaborar un listado que compare el precio de la medicina comercial
-- con su equivalente genérico

-- empezamos a trabajar en la tabla comercial-generica
-- id_comercial
-- id_generica

-- llenamos las tablas con registros

-- TAREA TRABAJO EN GRUPO
-- CONCEPTO A TRATAR: PRODUCTO CARTECIANO
-- descuento de plan de medicina frecuente
-- comparativa con las comerciales GEN, COM

-- ************************
-- CONSULTA SOBRE INNERJOIN
-- ************************
-- En la consulta puntual, el JOIN sirve para combinar filas de varias tablas que están relacionadas por una clave (por ejemplo, la cédula del cliente o el ID de la medicina). Así puedes mostrar en un mismo resultado datos que viven en tablas distintas.
-- ¿Por qué usar JOIN aquí?
--En tu caso:
-- medicinafrecuente guarda qué medicina usa cada cliente, más la condición, frecuencia y descuento.
-- clientes tiene los datos del cliente (nombre, email, etc.).
-- medicinas tiene los datos de la medicina (nombre, tipo, precio, etc.).

-- Con JOIN “unes” esas tablas por sus campos relacionados:
-- medicinafrecuente.cliente_cedula ↔ clientes.cedula
-- medicinafrecuente.medicina_id ↔ medicinas.id

-- Así obtienes, por ejemplo, el precio desde medicinas y el descuento desde medicinafrecuente, 
-- todo en la misma fila junto con el nombre del cliente desde clientes.

-- PRODUCTO CARTESIANO
-- En la consulta puntual, el JOIN sirve para combinar filas de varias tablas que están relacionadas por una clave (por ejemplo, la cédula del cliente o el ID de la medicina). Así puedes mostrar en un mismo resultado datos que viven en tablas distintas.

-- FECHA:19-12-2025
-- caso: crear todas las combinaciones posible entre la tabla de clientes y la table de medicinas frecuentes (es decir el roducto cartesiano)

-- generamos la explosión carteciana
use saludtotal;
select * 
FROM clientes, 
  medicinafrecuente;

select * 
FROM clientes, 
  medicinafrecuente
WHERE 
clientes.cedula = medicinafrecuente.cliente_cedula;

-- columna medicinas y medicina frecuente

SELECT *
from 
  medicinas, 
  medicinafrecuente;

-- combinamos las columnas de las 2 tablas
-- podemos alias para las tablas 
-- m = medicinas
-- mf = medicinafrecuente
select
  c.cedula,
  c.nombre,
  m.nombre,
  mf.descuento,
  m.tipo
from
  clientes c,
  medicinas m, 
  medicinafrecuente mf
WHERE
  m.id = mf.medicina_id
  and c.cedula = mf.cliente_cedula
  and m.tipo = 'COM'; -- aquí condicinamos para que solo se muestren los datos solicitados

-- FORMA CORRECTA DE ESCRIBIR LAS SENTENCIAS
-- Usamos la palabra reservada JOIN
-- seleccionamos cual de las 3 tablas es de pigote que sirve de unión de las otras tablas
use saludtotal;
SELECT
  c.cedula,
  c.nombre,
  m.nombre,
  mf.descuento,
  m.tipo
FROM 
  medicinafrecuente mf
JOIN clientes c ON c.cedula = mf.cliente_cedula  -- colocamos la tabla satelite
JOIN medicinas m ON m.id = mf.medicina_id
WHERE 
  m.tipo = 'COM'; -- aquí condicinamos para que solo se muestren los datos solicitados 

-- EJERCICIO: vamos a recuperar la info de la tabla medicinacomercialgenerica, 
-- que nos indique cuales son los nombres de la medicina comercial y genérica
use saludtotal;
SELECT
  mcom.id,
  mcom.nombre,
  mcom.precio,
  mcg.medicinagenerica_id,
  mgen.nombre,
  mgen.precio,
  mcom.precio - mgen.precio as diferencia
FROM
  medicinacomercialgenerica mcg
join medicinas mcom on mcom.id = mcg.medicinacomercial_id
join medicinas mgen on mgen.id = mcg.medicinagenerica_id;
-- Debemos cargar de datos las tablas

-- CASO: Presentar una factura y sus detalles, que incluya,
--      Los datos de la farmacia: nombre, ruc, correo
--      los datos del cliente nombre, cedula
--      los datos de la cabecera de la factura: numero, fecha
--      las medicina vendidas: nombre medicina, id, cant, precio, subtotal
--      los datos al pie de la factura: total y la forma de pago
-- 1. cargar de datos en facturas cabecera y detalles
--    usar los datos ya existentes
-- 2. select para cabecera de factura
-- 3. select para los detalles de factura
-- 4. select para el pie de factura

-- PRESENTACIÓN DE TAREA DÍA VIERNES
use saludtotal;
SELECT
    e.razonsocial              AS empresa,
    e.ruc                      AS ruc_empresa,
    e.direccion_empresa        AS direccion_empresa,
    e.telefono_empresa         AS telefono_empresa,
    e.correo_empresa           AS correo_empresa,

    f.facturanumero            AS numero_factura,
    f.fecha                    AS fecha_emision,

    c.cedula                   AS cedula_cliente,
    c.nombre                   AS nombre_cliente,
    c.email                    AS email_cliente,

    m.nombre                   AS medicamento,
    m.tipo                     AS tipo_medicamento,
    fd.cantidad                AS cantidad,
    fd.precio                  AS precio_unitario,
    (fd.cantidad * fd.precio)  AS subtotal,
    f.total                    AS total_factura
FROM factura f
JOIN clientes c 
    ON c.cedula = f.cedula
JOIN facturadetalle fd 
    ON fd.facturanumero = f.facturanumero
JOIN medicinas m 
    ON m.id = fd.medicamento_id
JOIN empresa e
    ON 1 = 1   -- la empresa es única
WHERE f.facturanumero = '0000000001';

-- ************************************
-- FECHA 22-12-2025
-- ************************************
-- CORRECCIÓN DEL DEBER
use saludtotal;
drop column total; -- eliminamos la columna total de la tabla factura
SELECT * from clientes;
select * from factura;
select count(*) from factura;
select count(*) from facturadetalle;
select * from factura;
-- ******************
-- ****************** 
select
  -- aquí hacemos la operación de proyecto en una consulta sql
  fd.facturanumero,
  fd.medicamento_id,
  m.nombre,
  fd.precio,
  fd.cantidad,
  fd.precio * fd.cantidad as subtotal
from 
  facturadetalle fd
join medicinas m on m.id = fd.medicamento_id
where 
  facturanumero = '0000000002';

-- pie de la factura
select
  sum(fd.precio * fd.cantidad) as subtotal
from 
  facturadetalle fd 
  join medicina m -- falta completar
where;

-- **********************
-- CREACIÓN DE UNA VISTA
-- **********************
CREATE VIEW vista_medicina_comercial_cliente_juridico AS
SELECT
    c.cedula,
    c.nombre AS nombre_cliente,
    m.nombre AS nombre_medicamento,
    mf.descuento,
    m.tipo  AS tipo_medicamento,
    c.tipo  AS tipo_cliente
FROM medicinafrecuente mf
JOIN clientes c 
    ON c.cedula = mf.cliente_cedula
JOIN medicinas m 
    ON m.id = mf.medicina_id
WHERE 
    m.tipo = 'COM'
    AND c.tipo = 'JUR';
use saludtotal;
select * from clientes;

select * from vista_medicina_comercial_cliente_juridico;

-- LEFT JOIN
-- Consultar las medicinas declaradas en el plan de mediciona frecuente

use saludtotal;
select count (*) from medicinas;
select count (*) from medicinafrecuente;

-- cuales son la médicinas que no estan en medicina frecuente
select *
from medicinas
where id not in -- hacemos una subconsulta
(
  select medicina_id from medicinafrecuente
);

-- con un join
-- left join

select *
from medicinas m
left join medicinafrecuente mf on m.id = mf.medicina_id;

select *
from medicinafrecuente mf 
left join medicinas m on m.id = mf.medicina_id;

