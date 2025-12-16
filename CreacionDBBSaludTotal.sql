
CREATE DATABASE SaludTotal;

USE SaludTotal;

create table medicinas 
(
id int primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
tipo CHAR(3), -- valores que puede tener (GEN - generico // COM - comercial)
precio DECIMAL(15,2), -- indicamos los digtos enteros y decimales
stock int, -- siempre tenemos cantidades enteras
fechadecaducidad date
);

insert into medicinas
values (1, 'Acetaminofen','COM',0.50, 12,'2026-01-01');
insert into medicinas
values (2, 'Paracetamol','COM',0.34, 43,'2028-01-01');
insert into medicinas
values (3, 'Ibuprofeno','COM',0.75, 12,'2026-01-01');
insert into medicinas
values (4, 'Zocor','COM',1.52, 12,'2026-01-01');
insert into medicinas
values (5, 'Norvasc','COM',1.52, 12,'2026-01-01');
insert into medicinas
values (6, 'Glucophage','COM',1.52, 12,'2026-01-01');
insert into medicinas
values (7, 'Cozaar','COM',1.52, 12,'2026-01-01');

-- Medicamentos genéricos
insert into medicinas
values (10, 'Paracetamol','GEN',0.53, 23,'2027-01-01');
insert into medicinas
values (11, 'Ácido acetilsalicílico','GEN',1.74, 50,'2030-01-01');
insert into medicinas
values (12, 'Omeprazol','GEN',2.00, 43,'2028-01-01');
insert into medicinas
values (13, 'Simvastatina','GEN',1.00, 50,'2028-01-01');
insert into medicinas
values (14, 'Amlodipino','GEN',1.00, 50,'2028-01-01');
insert into medicinas
values (15, 'Metformina','GEN',1.00, 50,'2028-01-01');


SELECT * from medicinas;

use saludtotal;
create table cliente 
(
cedula CHAR (10) primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
fechadenacimiento datetime,
tipodecliente CHAR(3)
);

insert into cliente
values ('0602596587', 'Viviana Perez', '1990-03-24 00:00:00', 'NT');

insert into cliente
values ('1804141479', 'Juan Guaman', '1990-03-24 00:00:00', 'JUR');
insert into cliente
values ('1720477171', 'Betty Bowen', '1990-03-24 00:00:00', 'NT');
insert into cliente
values ('1802278604', 'Manuel Avalos', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('1723006035', 'Soledad Perez', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('1720026663', 'Patricio Villacis', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('1758357162', 'Diego Jimenez', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('0300885506', 'Fabian Romero', '1990-03-24 00:00:00', 'INS');


use saludtotal;
create table medicinafrecuente
( 
 cliente_cedula CHAR (10),
 medicina_id int,
 condicion VARCHAR (100),
 frecuencia CHAR(3),
 descuento DECIMAL(5,2)  -- 123,45
);

select * from medicinafrecuente;
alter table medicinafrecuente
add constraint clientecedulafx
Foreign Key (cliente_cedula) 
REFERENCES cliente (cedula);

alter table medicinafrecuente
add constraint medicionaid_fk
Foreign Key (medicina_id) 
REFERENCES medicinas (id);

alter table medicinafrecuente
add primary key (cliente_cedula, medicina_id);
-- colocar correctamente los datos en entre cliente y medicamento

use saludtotal;
SELECT * from cliente;
SELECT * from medicinas;

select * from medicinafrecuente;
insert into medicinafrecuente
values ('0300885506',1,'Panadol','MEN', 1.52);

insert into medicinafrecuente
values ('0602596587',2,'Aspirina','MEN', 2.73);

insert into medicinafrecuente
values ('1720026663',3,'Paracetamol','CRI', 0.53);

insert into medicinafrecuente
values ('1720477171',12,'Omeprazol','SEM', 2.00);

-- ANÁLISIS

-- como almacenar que final es comercil y paracetamol es generico
-- reporte debe salir que este medicamento comercial tiene la siguiente lista de generico

-- DIA 5
-- FECHA: 12-12-2025
-- datos de la factura nombre de la empresa ruc
-- fecha de creación de la factura
-- número de factura
-- datos del cliente
-- datos de los productos

-- TABLAS A CREAR
-- empresa
-- RUC, nombre de la empresa, dirección
-- factura 
-- Consulta (id_factura, nombreempresa, ruc_empresa, cedula_cliente, nombre_cliente,  fechaemision, cantidad, nombre_medicamento, tipo_medicamento, precio, subtotal, total_factura)
-- factura_detalle
-- 
use saludtotal;
-- creación de tabla datos de la empresa
create table empresa(
    RUC CHAR(13),
    razonsocial VARCHAR(100),
    direccion_empresa VARCHAR(100),
    telefono_empresa VARCHAR(14),
    correo_empresa VARCHAR (25)
);

use saludtotal;
insert into empresa values ('17265458001','Salud Total S.A', 'Av. 10 de Agosto S/N','0997624384','saludtotal@gmail.com');

-- añadimos campos a la tabla clientes
alter table cliente
add column email VARCHAR (20);

desc cliente;
SELECT * from cliente;

-- actualizamos los datos del cliente
UPDATE cliente
set email = "fabian1@gmail.com"
where cedula = '0300885506';

UPDATE cliente
set email = "viviana5@gmail.com"
where cedula = '0602596587';

UPDATE cliente
set email = "patricio3@gmail.com"
where cedula = '1720026663';

UPDATE cliente
set email = "betty8@gmail.com"
where  cedula = '1720477171';

UPDATE cliente
set email = "soledad6@gmail.com"
where cedula = '1723006035';

UPDATE cliente
set email = "diego4@gmail.com"
where cedula = '1758357162';

UPDATE cliente
set email = "manuel9@gmail.com"
where cedula = '1802278604';

UPDATE cliente
set email = "juan34@gmail.com"
where cedula = '1804141479';


-- Creación de la tabla de facturas y facturasdetalle
use saludtotal;
create table factura (
    facturanumero CHAR(10) PRIMARY KEY,
    fecha date,
    cedula CHAR(10),
    total DECIMAL(15,2)
);
insert into factura values ('0000000001','2025-12-12','0300885506',5.25);
insert into factura values ('0000000002','2025-12-12','0602596587',7.90);
insert into factura values ('0000000003','2025-12-12','1720026663',9.00);

-- ingresamos validaciones
-- en mi caso en el cliente el campo cedula se llama id
alter table factura
add constraint facturacedulafx
Foreign Key (cedula) -- nombre de la columna que estoy aplicando 
REFERENCES cliente (cedula); -- a que tabla estamos apuntando

-- creamos la tabla detalle_factura

create table facturadetalle(
    facturanumero CHAR(10),
    medicamento_id int,
    cantidad int,
    precio DECIMAL(15,2)
);

-- la tabla factura detalle tendra 2 campos de validacion, primary key compuesta

use saludtotal;
alter table facturadetalle
add PRIMARY key (facturanumero, medicamento_id);

insert into facturadetalle values ('0000000001',3,12,2.73);
-- se repite el número de factura pero agregamos más medicamentos
insert into facturadetalle values ('0000000001',1,5,1.52);
insert into facturadetalle values ('0000000001',2,3,0.53);
insert into facturadetalle values ('0000000002',1,4,1.52);
insert into facturadetalle values ('0000000002',4,3,1.74);
insert into facturadetalle values ('0000000003',3,4,1.52);
insert into facturadetalle values ('0000000003',5,3,1.74);
SELECT * FROM factura;
SELECT * from facturadetalle;
SELECT * from medicinas;

-- validamos de que no se ingrese un número de factura que no existe
-- que la tabla 
alter table facturadetalle
add constraint facturanumero_fk
Foreign Key (facturanumero) 
REFERENCES factura (facturanumero);


SELECT * from medicinas;

select * from facturadetalle;
-- validación para no ingresa números negativos
alter table facturadetalle
add constraint facturadetalle_cantidad_ck
check(cantidad > 0);

-- validación para precio
alter table facturadetalle
add constraint facturadetalle_precio_ck
check(precio > 0);

-- confirmar que nuestro archivo funcione

use saludtotal;
select * from medicinafrecuente;

-- SEMANA 2
-- FECHA: 15-12-2025
-- Crear las tablas definidas en el excel y subur

show tables;

--creación tabla proveedor
create table proveedor(
    ruc_proveedor CHAR(13),
    nombre_proveedor VARCHAR(100),
    contacto_proveedor VARCHAR(14),
    email_proveedor VARCHAR(25)
);

insert into proveedor values ('17000000001','Bayer Ecuador','Luis Mayorga','mayorga@bayer.com');
insert into proveedor values ('17000000002','HealthCom','Andrés Zotos','soto@health.com');

select * from proveedor;

-- creación tabla proveedor_medicinas

create table proveedor_medicinas(
    ruc_proveedor CHAR(13),
    medicina_id int,
    precio_proveedor DECIMAL(15,2),
    Lote int,
    Plazo int
);
desc medicinas;

SELECT * from proveedor_medicinas;

alter table proveedor_medicinas
add PRIMARY key (ruc_proveedor, medicina_id);


alter table proveedor_medicinas
add constraint proveedor_medicinas_precio_ck
check(precio_proveedor > 0);

alter table proveedor_medicinas
add constraint proveedor_medicinas_lote_ck
check(lote > 0);

alter table proveedor_medicinas
add constraint proveedor_medicinas_plazo_ck
check(plazo > 0);

insert into proveedor_medicinas values('17000000001',1,0.25,100,15);
insert into proveedor_medicinas values('17000000001',2,0.12,200,30);
insert into proveedor_medicinas values('17000000001',3,0.32,300,7);
insert into proveedor_medicinas values('17000000002',2,0.10,800,7);
insert into proveedor_medicinas values('17000000002',3,0.30,250,7);

SELECT * from proveedor_medicinas;