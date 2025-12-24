
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

-- ********************
-- FECHA: 23-12-2025
-- ********************
-- 13. Un ordenamiento sobre un atributo de forma descendente
select *
from clientes
order by 
  nombre; -- permite establecer criterios de ordenamiento

-- cambiar el criterio por la fecha de nacimiento
select *
from clientes
order by 
  fechadenacimiento; -- permite realizar varias 
                     -- comparaciones, podemos consultar quien es el cliente más joven

select 
  nombre,
  fechadenacimiento
from clientes
order by 
  fechadenacimiento desc -- permite realizar varias 
LIMIT 1; -- mysql recupera el primer de la lista, así contestamos a la pregun
-- quien es el cliente más joven

-- caso: conocer las cinco medicinas más caras de la farmacia


SELECT
    id,
    nombre,
    tipo,
    precio,
    stock,
    fechadecaducidad
FROM medicinas
ORDER BY precio DESC
LIMIT 5;


-- caso: conocer las cinco medicinas más baratas

SELECT
    id,
    nombre,
    tipo,
    precio,
    stock,
    fechadecaducidad
FROM medicinas
ORDER BY precio ASC
LIMIT 5;


-- caso: la medicina comercial más barata

SELECT
    id,
    nombre,
    tipo,
    precio,
    stock,
    fechadecaducidad
FROM medicinas
WHERE tipo = 'COM'
LIMIT 1;


-- caso: la medicina generica más cara

SELECT
    id,
    nombre,
    tipo,
    precio,
    stock,
    fechadecaducidad
FROM medicinas
WHERE tipo = 'GEN'
ORDER BY precio DESC -- parta desde la mayor
LIMIT 1;
-- por defecto orden acsendentemente

-- caso: queremos saber las 5 medicinas COM con el menor descuento
select
  id,
  nombre,
  precio,
  descuento
from medicinafrecuente
join medicinas on id = medicina_id
where tipo = 'COM'
AND descuento is not NULL
ORDER BY
  descuento
LIMIT 5;

select * from medicinas where nombre LIKE '%Voltare%';

select * from medicinafrecuente where medicina_id = 30;
use saludtotal;
-- revisar no se ejecuta
INSERT into medicinafrecuente values (
 '1704165186', '30', 'Dolor frecuenterodillas','2xD',5.34
);

select * from medicinafrecuente;
SELECT * from medicinas;
-- revisar video 8:00 am
select
  id,
  nombre,
  precio,
  descuento
from medicinafrecuente
join medicinas on id = medicina_id
where tipo = 'COM'
ORDER BY
  descuento

-- REVISAR INSTRCUCCIÓN MAL COMPLETADA
-- medicina frecuente

select DISTINCT
  id,
  nombre,
  descuento
from medicinafrecuente
join medicinas on id = medicina_id
WHERE
  id in ( -- con este mecanismo evitanos
    SELECT
      id
    from medicinafrecuente
    JOIN medicinas on id = medicina_id
    WHERE
      tipo = 'COM'
  )
order by
  descuento
limit 5 -- cuando le incluimos dentro de una subconsulta lo podemos usar de la siguiente manera
;
-- revisar video 8:08 AM

-- Un agrupamiento sobre un atributo que no posee una restricción de unicidad y una operación de conteo
-- conteo basico sobre clientes
-- permite agrupar los registros

select 
  tipo,
  count (*) as numero
from clientes
group by 
  tipo
;
-- función de agregación
SELECT
  id,
  nombre,
  precio,
  stock,
  precio * stock
from medicinas;

-- ambos suman el valor total
-- con esta instrucción
select
  tipo,
  sum(precio * stock)
from medicinas
group BY
  tipo;

-- caso: factura detalles. queremos saber el valor monetareo por medicina vendida
-- consulta de medicinas vendidas
select * from facturadetalle;

-- vamos a ordenar medicamentos
select 
  medicamento_id,
  cantidad,
  precio,
  cantidad * precio as suntotal
from facturadetalle
ORDER BY medicamento_id;

-- VALOR TOTAL VENDIDO
SELECT
  fd.medicamento_id,
  m.nombre,
  sum(fd.cantidad * fd.precio)
from facturadetalle fd
join medicinas m on m.id = fd.medicamento_id
group BY
  medicamento_id
  ORDER BY medicamento_id;

-- **************************
-- TAREA EN CLASE
-- **************************
-- Encontrar al mejor cliente

SELECT 
  cedula,
  total
FROM factura
WHERE total = (SELECT MAX(total) FROM factura);

-- correción
select
  fd.facturanumero,
  f.cedula,
  sum(fd.cantidad * fd.precio)
from facturadetalle fd
join factura f on f.facturanumero =fd.facturanumero
join clientes c on c.cedula = f.cedula
GROUP BY
  fd.facturanumero
ORDER BY
  sum(fd.cantidad * fd.precio) DESC
LIMIT 1;

-- STOCK


-- ***********
-- FECHA 24_12_2025
-- ***********
-- revision de libro
use saludtotal;

select *
FROM factura
join facturadetalle;

select count(*) from facturadetalle;

-- *************************
-- PRACTICA EN CLASE
-- *************************
-- Caso: proyección de la venta total del stock, 
-- tomando en cuanta el descuento para las medicinas del plan de medicina frecuente

select 
  id,
  nombre,
  precio,
  stock,
  precio * stock
from medicinas;
-- acercamiento entre la tabla medicinafrecunte y medicinas
-- APLICAMOS EL CONCEPTO DE UNION DE CONSULTAS
use saludtotal;
select 
  mf.medicina_id,
  m.nombre,
  m.precio,
  m.stock,
  mf.descuento,
  m.precio * (1-mf.descuento/100) as nuevo_precio -- formula para plicar descuento
from medicinafrecuente mf
join medicinas m on m.id = mf.medicina_id
UNION -- uso del comando UNION
select 
  mf.medicina_id,
  m.nombre,
  m.precio,
  m.stock,
  0.0 as descuento,
  m.precio as nuevo_precio
from medicinafrecuente mf
right join medicinas m on m.id = mf.medicina_id
where mf.descuento is not NULL;

-- ahora utilizando la misma consulta creamos una vista
create view v_proyeccion_ventas
as 
select 
  mf.medicina_id,
  m.nombre,
  m.precio,
  m.stock,
  mf.descuento,
  m.precio * (1-mf.descuento/100) as nuevo_precio -- formula para plicar descuento
from medicinafrecuente mf
join medicinas m on m.id = mf.medicina_id
UNION -- uso del comando UNION, las consultas deben tener los mismo datos para poder hacer la únion
select 
  mf.medicina_id,
  m.nombre,
  m.precio,
  m.stock,
  0.0 as descuento, -- sin descuento, es descuento cero
  m.precio as nuevo_precio
from medicinafrecuente mf
right join medicinas m on m.id = mf.medicina_id
where mf.descuento is NULL;

-- vamos hacer uso de la vista
-- suma de venta por stock

select 
  sum(nuevo_precio * stock) -- sumamos y vemos la proyecto del stock, tomando en cuenta el valor del descuento
from 
  v_proyeccion_ventas;

-- CASO: averiguar que medicinas vencen en el próximo mes
-- propuesta 
use saludtotal;
SELECT nombre, tipo, stock, fechadecaducidad
FROM medicinas
WHERE fechadecaducidad 
BETWEEN CURDATE() 
AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH);

-- primer opción compañer erick
select 
  id,
  nombre,
  fechadecaducidad
FROM
  medicinas
WHERE 
  fechadecaducidad >= date_add(last_day(curdate()), interval 1 day)
  and fechadecaducidad <= last_day(date_add(curdate(),INTERVAL 1 MONTH))
ORDER BY
  fechadecaducidad;

select id, fechadecaducidad from medicinas;

-- **************
-- CASO: Cronograma de vencimientos de medicinas a tres meses vista
-- podemos usar unión, crear una vista

CREATE VIEW cronograma_vencimientos_3_meses AS
SELECT 
  id,
  nombre,
  fechadecaducidad,
  'Mes 1' AS periodo
FROM medicinas
WHERE fechadecaducidad 
BETWEEN 
  DATE_ADD(LAST_DAY(CURDATE()), INTERVAL 1 DAY)
  AND LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 1 MONTH))

UNION

SELECT 
  id,
  nombre,
  fechadecaducidad,
  'Mes 2' AS periodo
FROM medicinas
WHERE fechadecaducidad 
BETWEEN 
  DATE_ADD(LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 1 MONTH)), INTERVAL 1 DAY)
  AND LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 2 MONTH))

UNION

SELECT 
  id,
  nombre,
  fechadecaducidad,
  'Mes 3' AS periodo
FROM medicinas
WHERE fechadecaducidad 
BETWEEN 
  DATE_ADD(LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 2 MONTH)), INTERVAL 1 DAY)
  AND LAST_DAY(DATE_ADD(CURDATE(), INTERVAL 3 MONTH));

select * from cronograma_vencimientos_3_meses;
