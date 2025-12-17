drop DATABASE saludtotal;
CREATE DATABASE saludtotal;

USE SaludTotal;

create table medicinas 
(
id int primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
tipo CHAR(3) default 'GEN', -- valores que puede tener (GEN - generico // COM - comercial)
precio DECIMAL(15,2), -- indicamos los digtos enteros y decimales
stock int, -- siempre tenemos cantidades enteras
fechadecaducidad date
);

select * from medicinas;
-- tabla de medicinas tiene un tipo puede tomar 3 valores 
insert into medicinas
values (1, 'Acetaminofen', 'COM', 5.50, 100, '2026-08-31');
insert into medicinas 
values (2, 'Paracetamol', 'GEN', 1.80, 300, '2026-10-15');
insert into medicinas
values (3, 'Tylenol', 'COM', 18.90, 60, '2025-12-20');
insert into medicinas
values (4, 'Amoxicilina + Ácido Clavulánico', 'GEN', 9.50, 120, '2026-01-30');
insert into medicinas
values (5, 'Advil', 'COM', 6.40, 90, '2026-05-18');
insert into medicinas
values (6, 'Ibuprofeno', 'GEN', 2.10, 250, '2026-07-25');
insert into medicinas
values (7, 'Voltaren', 'COM', 7.80, 70, '2025-11-10');

insert into medicinas
values (8, 'Diclofenaco', 'GEN', 2.50, 200, '2026-02-28');
insert into medicinas
values (9, 'Bayer Aspirina', 'COM', 4.20, 85, '2026-04-05');
insert into medicinas
values (10, 'Ácido Acetilsalicílico', 'GEN', 1.60, 220, '2026-06-30');

create table clientes 
(
cedula CHAR (10) primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
fechadenacimiento date,
tipo CHAR(3),
email VARCHAR(100),
direccion VARCHAR(100),
telefono VARCHAR(13)
);

insert into clientes
values ('0602596587', 'Viviana Perez', '1990-03-24', 'NT','viviana5@gmail.com','Av. Gaspar de Villarroel N79-813, Carcelén, Quito', '0910647731');

insert into clientes
values ('1804141479', 'Juan Guaman', '1990-03-24', 'JUR','juan34@gmail.com','Av. De los Shyris N92-345, Carcelén, Quito', '0973666927');
insert into clientes
values ('1720477171', 'Betty Bowen', '1990-03-24', 'NT','betty8@gmail.com','Av. Colón N39-452, Turubamba, Quito', '0976632750');
insert into clientes
values ('1802278604', 'Manuel Avalos', '1990-03-24', 'INS','manuel9@gmail.com','Av. República N18-902, Calderón, Quito', '0934473990');

insert into clientes
values ('1723006035', 'Soledad Perez', '1990-03-24', 'INS','soledad6@gmail.com','Av. Gaspar de Villarroel N39-698, Iñaquito, Quito', '0909111159');

insert into clientes
values ('1720026663', 'Patricio Villacis', '1990-03-24', 'INS','patricio3@gmail.,com','Calle Whymper N88-718, La Floresta, Quito','0934567990');

insert into clientes
values ('1758357162', 'Diego Jimenez', '1990-03-24', 'INS','diego4@gmail.com','Av. Mariana de Jesús N92-284, Quitumbe, Quito', '0978884020');

insert into clientes
values ('0300885506', 'Fabian Romero', '1990-03-24', 'INS','fabian1@gmail.com','Calle Whymper N31-522, La Mariscal, Quito', '0961655576');

use saludtotal;
create table medicinafrecuente
( 
 cliente_cedula CHAR (10),
 medicina_id int,
 condicion VARCHAR (100),
 frecuencia CHAR(3),
 descuento DECIMAL(5,2)  -- 123,45
);

alter table medicinafrecuente
add constraint clientecedulafx
Foreign Key (cliente_cedula) 
REFERENCES clientes (cedula);

alter table medicinafrecuente
add constraint medicionaid_fk
Foreign Key (medicina_id) 
REFERENCES medicinas (id);

alter table medicinafrecuente
add primary key (cliente_cedula, medicina_id);
-- colocar correctamente los datos en entre cliente y medicamento

use saludtotal;

insert into medicinafrecuente
values ('0300885506',1,'Acetaminofen','MEN', 1.52);

insert into medicinafrecuente
values ('0602596587',2,'Paracetamol','MEN', 2.73);

insert into medicinafrecuente
values ('1720026663',3,'Ibuprofeno','CRI', 0.53);


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

-- creación de tabla datos de la empresa
create table empresa(
    ruc CHAR(13) PRIMARY key,
    razonsocial VARCHAR(100),
    direccion_empresa VARCHAR(100),
    telefono_empresa VARCHAR(14),
    correo_empresa VARCHAR (25)
);

use saludtotal;
insert into empresa values ('17265458001','Salud Total S.A', 'Av. 10 de Agosto S/N','0997624384','saludtotal@gmail.com');

-- añadimos campos a la tabla clientes
alter table clientes
add column email VARCHAR (20);

-- actualizamos los datos del cliente
UPDATE clientes
set email = "fabian1@gmail.com"
where cedula = '0300885506';

UPDATE clientes
set email = "viviana5@gmail.com"
where cedula = '0602596587';

UPDATE clientes
set email = "patricio3@gmail.com"
where cedula = '1720026663';

UPDATE clientes
set email = "betty8@gmail.com"
where  cedula = '1720477171';

UPDATE clientes
set email = "soledad6@gmail.com"
where cedula = '1723006035';

UPDATE clientes
set email = "diego4@gmail.com"
where cedula = '1758357162';

UPDATE clientes
set email = "manuel9@gmail.com"
where cedula = '1802278604';

UPDATE clientes
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
REFERENCES clientes (cedula); -- a que tabla estamos apuntando

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


-- validamos de que no se ingrese un número de factura que no existe
-- que la tabla 
alter table facturadetalle
add constraint facturanumero_fk
Foreign Key (facturanumero) 
REFERENCES factura (facturanumero);


-- validación para no ingresa números negativos
alter table facturadetalle
add constraint facturadetalle_cantidad_ck
check(cantidad > 0);

-- validación para precio
alter table facturadetalle
add constraint facturadetalle_precio_ck
check(precio > 0);

-- confirmar que nuestro archivo funcione


-- SEMANA 2
-- FECHA: 15-12-2025
-- Crear las tablas definidas en el excel y subur


-- creación tabla proveedor
create table proveedor(
    ruc CHAR(13) PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(14),
    email VARCHAR(100)
);

insert into proveedor values ('17000000001','Bayer Ecuador','Luis Mayorga','mayorga@bayer.com');
insert into proveedor values ('17000000002','HealthCom','Andrés Zotos','soto@health.com');


-- creación tabla proveedor_medicinas

create table proveedor_medicinas(
    proveedor_ruc CHAR(13),
    medicina_id int,
    proveedor_precio DECIMAL(10,2),
    lote int,
    plazo int
);

-- creamos la primary key y la id compuesta
use saludtotal;
ALTER TABLE proveedor_medicinas
ADD CONSTRAINT fk_proveedor
FOREIGN KEY (proveedor_ruc)
REFERENCES proveedor (ruc);

ALTER TABLE proveedor_medicinas
ADD CONSTRAINT fk_medicina
FOREIGN KEY (medicina_id)
REFERENCES medicinas (id);

ALTER TABLE proveedor_medicinas
ADD CONSTRAINT pk_proveedor_medicinas
PRIMARY KEY (proveedor_ruc, medicina_id);

alter table proveedor_medicinas
add constraint proveedor_medicinas_precio_ck
check(proveedor_precio > 0);

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


-- FECHA: 16-12-2025
-- CAMBIOS REALIZADOS EN LA TABLA MEDICINAS

-- validaciones para que el nombre del medicamento sea único

alter table medicinas
add constraint medicinas_nombre_uq
unique (nombre);

-- realizamos pruebas de la validación indicando que el nombre paracetamol ya esta ingresado
-- insert into medicinas values (200,'Paracetamol','GEN', 1.50,12,'2026-01-01');
-- vamos a definir que el valor GEN sera el valor por defecto

-- poner aquí el comando modify
alter table medicinas
modify column tipo char (3) default 'GEN';

-- otra manera como insertar datos
insert into medicinas (id, nombre, precio, stock, fechadecaducidad) values (15,'Terminafina',3.43,12,'2028-01-01');

-- debemos modicar el diseño de la tabla para evitar que se ingresen nombre con valores null, null es ausencia de datos, no es un dato
alter table medicinas
modify COLUMN nombre VARCHAR(100) not null;

-- control para validar como estan escritos los valores de los atributos
alter table medicinas
add constraint medicinas_tipo_val
check ( -- valores que estan permitidos y verifique que los valores sean los de este conjunto
    tipo in ('GEN','COM')
);

insert into medicinas (id, nombre, tipo, precio, stock, fechadecaducidad)
values (17, 'Acetamenofen PLU','GEN',0.50, 12,'2026-01-01');

select * from medicinas;

-- validación que no se puede ingresar nombres con valor null
insert into medicinas (id, nombre, tipo, precio, stock, fechadecaducidad)
values (16, null,'COM',0.50, 12,'2026-01-01');

-- CAMBIOS REALIZADOS EN LA TABLA CLIENTES

-- atributo email único en la tabla clientes
alter table clientes
add constraint cliente_email_uq
unique (email);


-- agregamos un cliente con un mismo correo y validamos que da un error al momento de ingresarlo
insert into clientes values ('1726439415','Danilo Rodriguez','2000-01-01','NAT','viviana5@gmail.com');

--  hacemos esto para la tabla cliente
alter table clientes
modify column email VARCHAR (100) not null;
-- validamos que no se pueda ingresar un email con valor null
alter table medicinas
modify COLUMN nombre VARCHAR(100) not null;

-- insertamos datos
insert into clientes (cedula, nombre, fechadenacimiento) values ('182929004', 'Jose Perez','1990-07-23',null);

SELECT * from clientes;

-- FECHA: 17-12-2025
-- FUNDAMENTOS ED  CONSULTAS EN SQL
