
CREATE DATABASE SaludTotal;

USE SaludTotal;

create table medicinas 
(
id int primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
tipo CHAR(3), -- valores que puede tener (GEN - generico // COM - comercial)
precio DECIMAL(15,2), -- indicamos los digtos enteros y decimales
stock int, -- siempre tenemos cantidades enteras
fechadecaducidad datetime
);

insert into medicinas
values (1, 'Paracetamol','GEN',1.52, 12,'2026-01-01 00:00:00');

insert into medicinas
values (2, 'Acetaminofen','GEN',0.53, 23,'2027-01-01 00:00:00');
insert into medicinas
values (3, 'Finalin','COM',2.73, 43,'2028-01-01 00:00:00');
insert into medicinas
values (4, 'Losartan','COM',1.74, 50,'2030-01-01 00:00:00');
insert into medicinas
values (5, 'Metformina','GEN',2.00, 43,'2028-01-01 00:00:00');

insert into medicinas
values (5, 'Metformina','GEN',2.00, 43,'2028-01-01 00:00:00');

insert into medicinas
values (12, 'Losartan','GEN',1.00, 50,'2028-01-01 00:00:00');

SELECT * from medicinas;

use saludtotal;
create table cliente 
(
cedula CHAR (10) primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
fechadenacimiento datetime,
tipodecliente CHAR(3)
);

DESC cliente;
insert into cliente
values ('1726543256', 'Viviana Perez', '1990-03-24 00:00:00', 'NT');

insert into cliente
values ('2387773256', 'Juan Guaman', '1990-03-24 00:00:00', 'JUR');
insert into cliente
values ('3426503996', 'Betty Bowen', '1990-03-24 00:00:00', 'NT');
insert into cliente
values ('662dfd3244', 'Manuel Avalos', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('1933203323', 'Soledad Perez', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('0435355355', 'Patricio Villacis', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('0983727823', 'Diego Jimenez', '1990-03-24 00:00:00', 'INS');

insert into cliente
values ('0123234344', 'Fabian Romero', '1990-03-24 00:00:00', 'INS');

SELECT * from cliente;

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
REFERENCES cliente (id);

alter table medicinafrecuente
add constraint medicionaid_fk
Foreign Key (medicina_id) 
REFERENCES medicinas (id)

alter table medicinafrecuente
add primary key (cliente_cedula, medicina_id);

DELETE table medicinafrecuente;
delete from medicinafrecuente;
SELECT * from medicinafrecuente;

-- REGISTRO DE DATOS
insert into medicinafrecuente
values ('1726543256',1,'Diabetes','MEN', 0.2);

insert into medicinafrecuente
values ('1726543256',2,'Diabetes','MEN', 0.2);

insert into medicinafrecuente
values ('2387773256',3,'Hipertensión','MEN', 0.1);

insert into medicinafrecuente
values ('3426503996',4,'Hipertensión','MEN', 0.1);

insert into medicinafrecuente
values ('662dfd3244',2,'Diabetes','CRI', 0.2);

insert into medicinafrecuente
values ('0435355355',5,'Hipertensión','SEM', 0.1);


-- Ingreso clientes
insert into cliente
values ('0983727823', 5, 'Hipertensión','SEM', 0.1);

insert into cliente
values ('0123234344',  5, 'Hipertensión','SEM');


use saludtotal;
SELECT * from medicinas;
SELECT * from cliente;
SELECT * from medicinafrecuente;

-- ANÁLISIS

-- como almacenar que final es comercil y paracetamol es generico
-- reporte debe salir que este medicamento comercial tiene la siguiente lista de generico


use saludtotal;
SELECT * FROM medicinas;

desc medicinas;

ALTER TABLE medicinas
ADD CONSTRAINT fk_medicina_generico
FOREIGN KEY (id_generico)
REFERENCES medicinas(id);

