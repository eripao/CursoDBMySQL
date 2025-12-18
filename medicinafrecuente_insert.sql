-- Archivo: medicinafrecuente_insert.sql

-- 50 instrucciones INSERT; cada instrucción inserta 4 medicamentos por cliente (200 filas en total)

use saludtotal;

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3122951257', 11, 'dolor/fiebre', '3xD', 7.50),
    ('3122951257', 12, 'dolor/inflamación', '3xD', 7.50),
    ('3122951257', 13, 'infección bacteriana', '3xD', 7.50),
    ('3122951257', 14, 'acidez/gastritis', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0234756721', 15, 'dolor/inflamación', '2xD', 7.50),
    ('0234756721', 16, 'dolor/inflamación', '2xD', 7.50),
    ('0234756721', 17, 'infección respiratoria', '1xD', 7.50),
    ('0234756721', 18, 'infección cutánea', '2xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2266140792', 19, 'dolor agudo', '2xD', 7.50),
    ('2266140792', 20, 'prevención cardiovascular', '1xD', 7.50),
    ('2266140792', 21, 'diabetes tipo 2', '2xD', 7.50),
    ('2266140792', 22, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2870198940', 23, 'hipercolesterolemia', '1xD', 7.50),
    ('2870198940', 24, 'hipercolesterolemia', '1xD', 7.50),
    ('2870198940', 25, 'hipertensión arterial', '1xD', 7.50),
    ('2870198940', 26, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1704165186', 27, 'uso común', '1xD', 7.50),
    ('1704165186', 28, 'alergia', '1xD', 7.50),
    ('1704165186', 29, 'alergia', '1xD', 7.50),
    ('1704165186', 30, 'asma/broncoespasmo', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1783012672', 31, 'dolor leve', '3xD', 12.00),
    ('1783012672', 32, 'dolor/fiebre', '3xD', 12.00),
    ('1783012672', 33, 'acidez/gastritis', '1xD', 12.00),
    ('1783012672', 34, 'infección bacteriana', '3xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2840999164', 35, 'dolor/inflamación', '2xD', 12.00),
    ('2840999164', 36, 'dolor/inflamación', '2xD', 12.00),
    ('2840999164', 37, 'infección respiratoria', '1xD', 12.00),
    ('2840999164', 38, 'alergia', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0318803623', 39, 'alergia', '1xD', 12.00),
    ('0318803623', 40, 'asma/broncoespasmo', 'SOS', 12.00),
    ('0318803623', 41, 'diabetes tipo 2', '2xD', 12.00),
    ('0318803623', 42, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3540896101', 43, 'uso común', '1xD', 12.00),
    ('3540896101', 44, 'uso común', '1xD', 12.00),
    ('3540896101', 45, 'hipertensión arterial', '1xD', 12.00),
    ('3540896101', 46, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1599296902', 47, 'edema/hipertensión', '1xD', 12.00),
    ('1599296902', 48, 'reflujo gástrico', '1xD', 7.50),
    ('1599296902', 49, 'acidez', '2xD', 7.50),
    ('1599296902', 50, 'cólico abdominal', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1226209182', 11, 'dolor/fiebre', '3xD', 7.50),
    ('1226209182', 12, 'dolor/inflamación', '3xD', 7.50),
    ('1226209182', 13, 'infección bacteriana', '3xD', 7.50),
    ('1226209182', 14, 'acidez/gastritis', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0694313093', 15, 'dolor/inflamación', '2xD', 7.50),
    ('0694313093', 16, 'dolor/inflamación', '2xD', 7.50),
    ('0694313093', 17, 'infección respiratoria', '1xD', 7.50),
    ('0694313093', 18, 'infección cutánea', '2xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3836113809', 19, 'dolor agudo', '2xD', 7.50),
    ('3836113809', 20, 'prevención cardiovascular', '1xD', 7.50),
    ('3836113809', 21, 'diabetes tipo 2', '2xD', 7.50),
    ('3836113809', 22, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2468070249', 23, 'hipercolesterolemia', '1xD', 7.50),
    ('2468070249', 24, 'hipercolesterolemia', '1xD', 7.50),
    ('2468070249', 25, 'hipertensión arterial', '1xD', 7.50),
    ('2468070249', 26, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0059863500', 27, 'uso común', '1xD', 7.50),
    ('0059863500', 28, 'alergia', '1xD', 7.50),
    ('0059863500', 29, 'alergia', '1xD', 7.50),
    ('0059863500', 30, 'asma/broncoespasmo', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3134055431', 31, 'dolor leve', '3xD', 12.00),
    ('3134055431', 32, 'dolor/fiebre', '3xD', 12.00),
    ('3134055431', 33, 'acidez/gastritis', '1xD', 12.00),
    ('3134055431', 34, 'infección bacteriana', '3xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2724833307', 35, 'dolor/inflamación', '2xD', 12.00),
    ('2724833307', 36, 'dolor/inflamación', '2xD', 12.00),
    ('2724833307', 37, 'infección respiratoria', '1xD', 12.00),
    ('2724833307', 38, 'alergia', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3905882262', 39, 'alergia', '1xD', 12.00),
    ('3905882262', 40, 'asma/broncoespasmo', 'SOS', 12.00),
    ('3905882262', 41, 'diabetes tipo 2', '2xD', 12.00),
    ('3905882262', 42, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3995727255', 43, 'uso común', '1xD', 12.00),
    ('3995727255', 44, 'uso común', '1xD', 12.00),
    ('3995727255', 45, 'hipertensión arterial', '1xD', 12.00),
    ('3995727255', 46, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1048523307', 47, 'edema/hipertensión', '1xD', 12.00),
    ('1048523307', 48, 'reflujo gástrico', '1xD', 7.50),
    ('1048523307', 49, 'acidez', '2xD', 7.50),
    ('1048523307', 50, 'cólico abdominal', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3480939986', 11, 'dolor/fiebre', '3xD', 7.50),
    ('3480939986', 12, 'dolor/inflamación', '3xD', 7.50),
    ('3480939986', 13, 'infección bacteriana', '3xD', 7.50),
    ('3480939986', 14, 'acidez/gastritis', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3753055442', 15, 'dolor/inflamación', '2xD', 7.50),
    ('3753055442', 16, 'dolor/inflamación', '2xD', 7.50),
    ('3753055442', 17, 'infección respiratoria', '1xD', 7.50),
    ('3753055442', 18, 'infección cutánea', '2xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0638222700', 19, 'dolor agudo', '2xD', 7.50),
    ('0638222700', 20, 'prevención cardiovascular', '1xD', 7.50),
    ('0638222700', 21, 'diabetes tipo 2', '2xD', 7.50),
    ('0638222700', 22, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2195685536', 23, 'hipercolesterolemia', '1xD', 7.50),
    ('2195685536', 24, 'hipercolesterolemia', '1xD', 7.50),
    ('2195685536', 25, 'hipertensión arterial', '1xD', 7.50),
    ('2195685536', 26, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3114320721', 27, 'uso común', '1xD', 7.50),
    ('3114320721', 28, 'alergia', '1xD', 7.50),
    ('3114320721', 29, 'alergia', '1xD', 7.50),
    ('3114320721', 30, 'asma/broncoespasmo', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2709540638', 31, 'dolor leve', '3xD', 12.00),
    ('2709540638', 32, 'dolor/fiebre', '3xD', 12.00),
    ('2709540638', 33, 'acidez/gastritis', '1xD', 12.00),
    ('2709540638', 34, 'infección bacteriana', '3xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2454012702', 35, 'dolor/inflamación', '2xD', 12.00),
    ('2454012702', 36, 'dolor/inflamación', '2xD', 12.00),
    ('2454012702', 37, 'infección respiratoria', '1xD', 12.00),
    ('2454012702', 38, 'alergia', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3162691107', 39, 'alergia', '1xD', 12.00),
    ('3162691107', 40, 'asma/broncoespasmo', 'SOS', 12.00),
    ('3162691107', 41, 'diabetes tipo 2', '2xD', 12.00),
    ('3162691107', 42, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0695327825', 43, 'uso común', '1xD', 12.00),
    ('0695327825', 44, 'uso común', '1xD', 12.00),
    ('0695327825', 45, 'hipertensión arterial', '1xD', 12.00),
    ('0695327825', 46, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1869040351', 47, 'edema/hipertensión', '1xD', 12.00),
    ('1869040351', 48, 'reflujo gástrico', '1xD', 7.50),
    ('1869040351', 49, 'acidez', '2xD', 7.50),
    ('1869040351', 50, 'cólico abdominal', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0276242694', 11, 'dolor/fiebre', '3xD', 7.50),
    ('0276242694', 12, 'dolor/inflamación', '3xD', 7.50),
    ('0276242694', 13, 'infección bacteriana', '3xD', 7.50),
    ('0276242694', 14, 'acidez/gastritis', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3448512197', 15, 'dolor/inflamación', '2xD', 7.50),
    ('3448512197', 16, 'dolor/inflamación', '2xD', 7.50),
    ('3448512197', 17, 'infección respiratoria', '1xD', 7.50),
    ('3448512197', 18, 'infección cutánea', '2xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2020717610', 19, 'dolor agudo', '2xD', 7.50),
    ('2020717610', 20, 'prevención cardiovascular', '1xD', 7.50),
    ('2020717610', 21, 'diabetes tipo 2', '2xD', 7.50),
    ('2020717610', 22, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1505819776', 23, 'hipercolesterolemia', '1xD', 7.50),
    ('1505819776', 24, 'hipercolesterolemia', '1xD', 7.50),
    ('1505819776', 25, 'hipertensión arterial', '1xD', 7.50),
    ('1505819776', 26, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3987183626', 27, 'uso común', '1xD', 7.50),
    ('3987183626', 28, 'alergia', '1xD', 7.50),
    ('3987183626', 29, 'alergia', '1xD', 7.50),
    ('3987183626', 30, 'asma/broncoespasmo', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3133813719', 31, 'dolor leve', '3xD', 12.00),
    ('3133813719', 32, 'dolor/fiebre', '3xD', 12.00),
    ('3133813719', 33, 'acidez/gastritis', '1xD', 12.00),
    ('3133813719', 34, 'infección bacteriana', '3xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2954011702', 35, 'dolor/inflamación', '2xD', 12.00),
    ('2954011702', 36, 'dolor/inflamación', '2xD', 12.00),
    ('2954011702', 37, 'infección respiratoria', '1xD', 12.00),
    ('2954011702', 38, 'alergia', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2844751898', 39, 'alergia', '1xD', 12.00),
    ('2844751898', 40, 'asma/broncoespasmo', 'SOS', 12.00),
    ('2844751898', 41, 'diabetes tipo 2', '2xD', 12.00),
    ('2844751898', 42, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3783686133', 43, 'uso común', '1xD', 12.00),
    ('3783686133', 44, 'uso común', '1xD', 12.00),
    ('3783686133', 45, 'hipertensión arterial', '1xD', 12.00),
    ('3783686133', 46, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2884244707', 47, 'edema/hipertensión', '1xD', 12.00),
    ('2884244707', 48, 'reflujo gástrico', '1xD', 7.50),
    ('2884244707', 49, 'acidez', '2xD', 7.50),
    ('2884244707', 50, 'cólico abdominal', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('2778310749', 11, 'dolor/fiebre', '3xD', 7.50),
    ('2778310749', 12, 'dolor/inflamación', '3xD', 7.50),
    ('2778310749', 13, 'infección bacteriana', '3xD', 7.50),
    ('2778310749', 14, 'acidez/gastritis', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0053148298', 15, 'dolor/inflamación', '2xD', 7.50),
    ('0053148298', 16, 'dolor/inflamación', '2xD', 7.50),
    ('0053148298', 17, 'infección respiratoria', '1xD', 7.50),
    ('0053148298', 18, 'infección cutánea', '2xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0108990884', 19, 'dolor agudo', '2xD', 7.50),
    ('0108990884', 20, 'prevención cardiovascular', '1xD', 7.50),
    ('0108990884', 21, 'diabetes tipo 2', '2xD', 7.50),
    ('0108990884', 22, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('3396080002', 23, 'hipercolesterolemia', '1xD', 7.50),
    ('3396080002', 24, 'hipercolesterolemia', '1xD', 7.50),
    ('3396080002', 25, 'hipertensión arterial', '1xD', 7.50),
    ('3396080002', 26, 'hipertensión arterial', '1xD', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0559330684', 27, 'uso común', '1xD', 7.50),
    ('0559330684', 28, 'alergia', '1xD', 7.50),
    ('0559330684', 29, 'alergia', '1xD', 7.50),
    ('0559330684', 30, 'asma/broncoespasmo', 'SOS', 7.50);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1413235958', 31, 'dolor leve', '3xD', 12.00),
    ('1413235958', 32, 'dolor/fiebre', '3xD', 12.00),
    ('1413235958', 33, 'acidez/gastritis', '1xD', 12.00),
    ('1413235958', 34, 'infección bacteriana', '3xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('0860393805', 35, 'dolor/inflamación', '2xD', 12.00),
    ('0860393805', 36, 'dolor/inflamación', '2xD', 12.00),
    ('0860393805', 37, 'infección respiratoria', '1xD', 12.00),
    ('0860393805', 38, 'alergia', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1132567069', 39, 'alergia', '1xD', 12.00),
    ('1132567069', 40, 'asma/broncoespasmo', 'SOS', 12.00),
    ('1132567069', 41, 'diabetes tipo 2', '2xD', 12.00),
    ('1132567069', 42, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1104843938', 43, 'uso común', '1xD', 12.00),
    ('1104843938', 44, 'uso común', '1xD', 12.00),
    ('1104843938', 45, 'hipertensión arterial', '1xD', 12.00),
    ('1104843938', 46, 'hipertensión arterial', '1xD', 12.00);

INSERT INTO medicinafrecuente (cliente_cedula, medicina_id, condicion, frecuencia, descuento)
VALUES
    ('1788453044', 47, 'edema/hipertensión', '1xD', 12.00),
    ('1788453044', 48, 'reflujo gástrico', '1xD', 7.50),
    ('1788453044', 49, 'acidez', '2xD', 7.50),
    ('1788453044', 50, 'cólico abdominal', 'SOS', 7.50);
