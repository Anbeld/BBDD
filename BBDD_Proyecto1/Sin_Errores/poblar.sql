-- Inserción de tipos de matrimonio
INSERT INTO TIPO_MATRIMONIO (TIPO_MATRIMINIO)
VALUES 
('Religioso'),
('Civil');

-- Inserción de tipos de documento de acreditación
INSERT INTO TIPO_DOCUMENTO_ACREDITACION (TIPO_DOCUMENTO_ACREDITACION)
VALUES ('Acta Religiosa'),
       ('Escritura de Protocolización');

-- Inserción Tipo de documento: Cédula de ciudadanía, Tarjeta de Identidad, Pasaporte, Cédula de Extranjería.
INSERT INTO TIPO_DOCUMENTO (TIPO_DOCUMENTO)
VALUES ('Cédula de ciudadanía'),
       ('Tarjeta de Identidad'),
       ('Pasaporte'),
       ('Cédula de Extranjería');

-- Inserción de tipo de oficina de expedición: Registraduría, notaría, consulado, corregimiento, inspección de policía, juzgado, parroquia.
INSERT INTO TIPO_OFICINA_EXPEDICION (TIPO_OFICINA_EXPEDICION)
VALUES 
   ('Registraduría'),
   ('Notaría'),
   ('Consulado'),
   ('Corregimiento'),
   ('Inspección de Policía'),
   ('Juzgado'),
   ('Parroquia');

-- Inserción de datos para pais
INSERT INTO PAIS (NOMBRE_PAIS)
VALUES 
('Colombia');

-- Inserción de datos para departamento
INSERT INTO DEPARTAMENTO (
PAIS_ID, 
NOMBRE_DEPARTAMENTO)
VALUES 
(1, 'Antioquia'),
(1, 'Bogotá D.C.'),
(1, 'Cundinamarca'),
(1, 'Valle del Cauca');

-- Inserción de datos para municipio
INSERT INTO MUNICIPO (DEPARTAMENTO_ID, MUNICIPIO)
VALUES 
(1, 'Envigado'),
(2, 'Bogotá'),
(3, 'Soacha'),
(4, 'Cali'),
(4, 'Palmira');

-- Inserción de datos para factor RH
INSERT INTO FACTOR_RH_RECIEN_NACIDO (FACTOR_RH)
VALUES 
('+'), -- Positivo
('-');  -- Negativo

-- Inserción de datos para grupo sanguíneo (sin factor RH)
INSERT INTO GRUPO_SANGUINEO_RECIEN_NACIDO (GRUPO_SANGUINEO)
VALUES 
('A'),
('B'),
('AB'),
('O');

-- Inserción de datos para sexo
INSERT INTO SEXO_RECIEN_NACIDO (SEXO)
VALUES 
('M'), -- Masculino
('F'); -- Femenino

-- Inserción de roles de persona en el registro civil de nacimiento (RCN)
INSERT INTO ROL_PERSONA_RCN (ROL_PERSONA_RCN)
VALUES 
('Inscrito'),
('Madre'),
('Padre'),
('Declarante'),
('Testigo'),
('Funcionario que autoriza'),
('Funcionario ante quien se hace el reconocimiento');

-- Inserción de roles de persona RCM
INSERT INTO ROL_PERSONA_RCM (ROL_PERSONA_RCM)
VALUES 
('Contrayente'),
('Denunciante'),
('Funcionario que autoriza');

-- Inserción nacionalidad: Colombiana
INSERT INTO NACIONALIDAD_PERSONA (NACIONALIDAD)
VALUES 
('Colombiana');

-- Inserción datos para oficina de expedicion:
INSERT INTO OFICINA_EXPEDICION (
MUNICIPIO_ID, 
TIPO_OFICINA_EXPEDICION_ID, 
CODIGO_OE, 
NUMERO_NOTARIA)
VALUES 
 (1, 1, 104, NULL),
 (3, 2, 203, 8),
 (2, 1, 4001, NULL),
 (4, 2, 1122, 13),
 (4, 5, 1004, NULL);

-- Inserción datos para persona
INSERT INTO PERSONA (
TIPO_DOCUMENTO_ID, 
NACIONALIDAD_ID,
NUIP, 
NOMBRES, 
APELLIDOS) 
VALUES 
(1, 1, 1909823846, 'Juan Camilo', 'Gutiérrez Mora'),
(2, 1, 1909877746, 'Andrea Paola', 'Fuentes Morales'),
(1, 1, 1569823846, 'Juan Sebastián', 'Rodríguez Caro'),
(1, 1, 1902388999, 'Ana María', 'Gómez Gaitán'),
(1, 1, 1978340846, 'Rafael Andrés', 'Enrique Cruz'),
(2, 1, 1111123846, 'María Isabel', 'Díaz López'),
(2, 1, 1222247746, 'Pedro José', 'Martínez Salazar'),
(1, 1, 1333363846, 'Laura Marcela', 'García Ramírez'),
(2, 1, 1444488999, 'David Alejandro', 'Hernández Sánchez'),
(1, 1, 1555560846, 'Valentina', 'Pérez Gómez'),
(1, 1, 1666693846, 'Gabriel', 'Torres López');

-- Inserción datos para firma persona
INSERT INTO FIRMA_PERSONA (
PERSONA_ID, 
URL_FIRMA_PERSONA)
VALUES
(1, 'https://www.ejemplo.com/firma_persona_1.png'),
(2, 'https://www.ejemplo.com/firma_persona_2.png'),
(3, 'https://www.ejemplo.com/firma_persona_3.png');

-- Inserción datos para persona rcm
INSERT INTO PERSONA_RCM (
ROL_PERSONA_RCM_ID, 
PERSONA_ID, 
REGISTRO_CIVIL_MATRINOMIO_ID)
VALUES
-- Inserción diferentes personas con roles diferentes, en mismos o diferentes registros civiles
(1, 1, 1), 
(2, 2, 1),
(1, 3, 2),
(2, 4, 2);

-- Inserción datos para persona rcn
INSERT INTO PERSONA_RCN (
ROL_PERSONA_RCN_ID, 
REGISTRO_CIVIL_NACIMIENTO_ID, 
PERSONA_ID)
VALUES
-- Inserción diferentes personas con roles diferentes, en mismos o diferentes registros civiles
(1, 1, 1), 
(2, 2, 1),
(1, 3, 2),
(2, 4, 2);

-- Inserción datos para documento acreditacion
INSERT INTO DOCUMENTO_ACREDITACION (
OFICINA_EXPEDICION_ID, 
TIPO_DOCUMENTO_ACREDITACION_ID)
VALUES 
 (5, 1),
 (3, 2),
 (2, 1),
 (4, 2),
 (4, 1);

-- Inserción datos para registro civil
INSERT INTO REGISTRO_CIVIL (
OFICINA_EXPEDICION_ID, 
INDICATIVO_SERIAL_RC,
FECHA_EXPEDICION)
VALUES
(1, 123456789012, '2023-01-15'),
(2, 987654321098, '2022-09-30'),
(3, 456789012345, '2024-03-10');

-- Inserción datos para registro civil de matrimonio
	INSERT INTO REGISTRO_CIVIL_MATRIMONIO ( 
TIPO_MATRIMONIO_ID, 
MUNICIPIO_ID, 
REGISTRO_CIVIL_ID, 
DOCUMENTO_ACREDITACION_ID, 
OFICINA_EXPEDICION_ID, 
FECHA_CELEBRACION, 
FECHA_OTORGAMIENTO_ESCRITURA_CA,
NUMERO_ESCRITURA_CAPITULACIONES)
VALUES
(1, 1, 1, 1, 1, '2023-05-20', '2023-06-10', 12345),
(2, 2, 2, 2, 2, '2022-11-15', '2022-12-05', 54321),
(1, 3, 3, 3, 3, '2024-02-08', NULL, NULL);

-- Inserción datos para hijo legitimado
INSERT INTO HIJO_LEGITIMADO (
REGISTRO_CIVIL_MATRINOMIO_ID, 
PERSONA_ID)
VALUES
-- Ejemplo de la inserción de hijos en diferentes matrimonio
(1, 1),
(2, 2), 
(3, 3); 

INSERT INTO REGISTRO_CIVIL_NACIMIENTO (
GRUPO_SANGUINEO_ID, 
SEXO_ID, MUNICIPIO_ID, 
REGISTRO_CIVIL_ID, 
FACTOR_RH_ID, 
NACIDO_VIVO, 
FECHA_DE_NACIMIENTO, 
NOTAS) 
VALUES
(1, 1, 1001, 2001, 1, 'SI', '2023-05-10', NULL),
(2, 2, 1002, 2002, 2, 'SI', '2022-11-25', NULL),
(3, 1, 1003, 2003, 1, 'SI', '2024-02-15', 'Parto prematuro'),
(4, 2, 1004, 2004, 2, 'SI', '2021-08-30', 'Peso bajo al nacer');