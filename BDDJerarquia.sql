create database empleadojerarquia;

-- ***********************************
-- Creación de la Tabla empleados 
-- ***********************************
CREATE TABLE empleados (
    cedula CHAR(13) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula_jefe CHAR(10),
    CONSTRAINT fk_jefe
        FOREIGN KEY (cedula_jefe)
        REFERENCES empleados(cedula)
);

-- ***********************************
-- Registro de datos de tabla empleado
-- ***********************************
INSERT INTO empleados (cedula, nombre, cedula_jefe) VALUES
('0100000001', 'Ana', NULL),
('0100000002', 'Marco', '0100000001'),
('0100000003', 'Susana', '0100000001'),
('0100000004', 'María', '0100000002'),
('0100000005', 'Juan', '0100000003'),
('0100000006', 'Marcelo', '0100000003');

-- ***********************************
-- Consulta Jerarquia Jefe-Empleado
-- ***********************************
SELECT 
    e.nombre AS empleado,
    j.nombre AS jefe
FROM empleados e
LEFT JOIN empleados j
    ON e.cedula_jefe = j.cedula;