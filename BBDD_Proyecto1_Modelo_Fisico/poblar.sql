-- Tipo_Matrimonio:

-- Inserción de tipos de matrimonio
INSERT INTO TIPO_MATRIMONIO (TIPO_MATRIMONIO)
VALUES 
('Religioso'),
('Civil');



-- Tipos_Documento_Acreditacion:

-- Inserción de tipos de documento de acreditación
INSERT INTO TIPO_DOCUMENTO_ACREDITACION (TIPO_DOCUMENTO_ACREDITACION)
VALUES ('Acta Religiosa'),
       ('Escritura de Protocolización');



-- Tipo_Documento:

-- Inserción Tipo de documento: Cédula de ciudadanía, Tarjeta de Identidad, Pasaporte, Cédula de Extranjería.
INSERT INTO TIPO_DOCUMENTO (TIPO_DOCUMENTO)
VALUES ('Cédula de ciudadanía'),
       ('Tarjeta de Identidad'),
       ('Pasaporte'),
       ('Cédula de Extranjería');




-- Tipo_Oficina_Expedicion:

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



-- Pais:

-- Inserción de datos para pais
INSERT INTO PAIS (NOMBRE_PAIS)
VALUES 
('Colombia');



-- Departamento:

-- Inserción de datos para departamento
INSERT INTO DEPARTAMENTO (
PAIS_ID, 
NOMBRE_DEPARTAMENTO,
CODIGO_DIVIPOLA)
VALUES 
(1, 'Antioquia', 5),
(1, 'Bogotá D.C.', 1),
(1, 'Cundinamarca', 25),
(1, 'Valle del Cauca', 76);


-- Municipio:

-- Inserción de datos para municipio
INSERT INTO MUNICIPIO (
DEPARTAMENTO_ID, 
NOMBRE_MUNICIPIO,
CODIGO_DIVIPOLA)
VALUES 
(1, 'Envigado', 266),
(2, 'Bogotá', 1),
(3, 'Soacha', 754),
(4, 'Cali', 1),
(4, 'Palmira', 520);



-- Factor_RH_Recien_Nacido:

-- Inserción de datos para factor RH
INSERT INTO FACTOR_RH_RECIEN_NACIDO (FACTOR_RH)
VALUES 
('+'), -- Positivo
('-');  -- Negativo



-- Grupo_Sanguineo_Recien_Nacido:

-- Inserción de datos para grupo sanguíneo (sin factor RH)
INSERT INTO GRUPO_SANGUINEO_RECIEN_NACIDO (GRUPO_SANGUINEO)
VALUES 
('A'),
('B'),
('AB'),
('O');



-- Sexo:

-- Inserción de datos para sexo
INSERT INTO SEXO_RECIEN_NACIDO (SEXO)
VALUES 
('M'), -- Masculino
('F'); -- Femenino



-- Rol_Persona_RCN:

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



-- Rol_Persona_RCM:

-- Inserción de roles de persona RCM
INSERT INTO ROL_PERSONA_RCM (ROL_PERSONA_RCM)
VALUES 
('Contrayente'),
('Denunciante'),
('Funcionario que autoriza');



-- Nacionalidad_Persona:

-- Inserción datos para nacionalidad persona
INSERT INTO NACIONALIDAD_PERSONA (NACIONALIDAD)
VALUES 
('Colombiana');



-- Oficina_Expedicion:

-- Inserción datos para oficina de expedicion
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



-- Persona:

-- Inserción datos para persona
INSERT INTO PERSONA (
TIPO_DOCUMENTO_ID, 
NUMERO_DOCUMENTO,
NACIONALIDAD_ID,
NUIP, 
NOMBRES, 
APELLIDOS) 
VALUES 
(1, 1909823846, 1, 1909823846, 'Juan Camilo', 'Gutiérrez Mora'),
(2, 1909877746, 1, 1909877746, 'Andrea Paola', 'Fuentes Morales'),
(1, 1569823846, 1, 1569823846, 'Juan Sebastián', 'Rodríguez Caro'),
(1, 1902388999, 1, 1902388999,  'Ana María', 'Gómez Gaitán'),
(1, 1978340846, 1, 1978340846, 'Rafael Andrés', 'Enrique Cruz'),
(2, 1111123846, 1, 1111123846, 'María Isabel', 'Díaz López'),
(2, 1222247746, 1, 1222247746, 'Pedro José', 'Martínez Salazar'),
(1, 1333363846, 1, 1333363846, 'Laura Marcela', 'García Ramírez'),
(2, 1444488999, 1, 1444488999, 'David Alejandro', 'Hernández Sánchez'),
(1, 1555560846, 1, 1555560846, 'Valentina', 'Pérez Gómez'),
(1, 1666693846, 1, 1666693846, 'Gabriel', 'Torres López');



-- Firma_Persona:

-- Inserción datos para firma persona
INSERT INTO FIRMA_PERSONA (
PERSONA_ID, 
URL_FIRMA_PERSONA)
VALUES
(1, 'https://www.ejemplo.com/firma_persona_1.png'),
(2, 'https://www.ejemplo.com/firma_persona_2.png'),
(3, 'https://www.ejemplo.com/firma_persona_3.png');



-- Documento_Acreditacion:

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



-- Registro_Civil:
	
-- Inserción datos para registro civil
INSERT INTO REGISTRO_CIVIL (
OFICINA_EXPEDICION_ID, 
INDICATIVO_SERIAL_RC,
FECHA_EXPEDICION)
VALUES
	(1, 987654321001, '2023-08-12'),
(2, 654321098765, '2024-02-29'),
(3, 321098765432, '2022-12-05'),
(1, 890123456012, '2023-06-18'),
(2, 567890123901, '2021-10-03'),
(3, 234567890112, '2022-04-15');




-- Registro_Civil_Matrimonio:

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
(1, 1, 1, 1, 4, '2023-05-20', '2023-06-10', 12345),
(2, 2, 2, 2, 2, '2022-11-15', '2022-12-05', 54321),
(1, 3, 3, 3, NULL, '2024-02-08', NULL, NULL);



-- Hijo_Legitimado:

-- Inserción datos para hijo legitimado
INSERT INTO HIJO_LEGITIMADO (
REGISTRO_CIVIL_MATRINOMIO_ID, 
PERSONA_ID)
VALUES
-- Ejemplo de la inserción de hijos en diferentes matrimonio
(1, 5),
(2, 6), 
(3, 7); 



-- Registro_Civil_Nacimiento:

-- Inserción datos para registro civil de nacimiento
INSERT INTO REGISTRO_CIVIL_NACIMIENTO (
GRUPO_SANGUINEO_ID, 
SEXO_ID, 
MUNICIPIO_ID, 
REGISTRO_CIVIL_ID, 
FACTOR_RH_ID, 
NACIDO_VIVO, 
FECHA_DE_NACIMIENTO, 
NOTAS) 
VALUES
(1, 1, 1, 4, 1, 'A1288301', '2023-05-10', NULL),
(2, 2, 1, 5, 2, 'B2834325', '2022-11-25', NULL),
(3, 1, 2, 6, 1, 'ZF123411', '2024-02-15', 'Parto prematuro');



-- Persona_RCM:

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



-- Persona_RCN:

-- Inserción datos para persona rcn
INSERT INTO PERSONA_RCN (
ROL_PERSONA_RCN_ID, 
REGISTRO_CIVIL_NACIMIENTO_ID, 
PERSONA_ID)
VALUES
-- Inserción diferentes personas con roles diferentes, en mismos o diferentes registros civiles
(1, 1, 1), 
(2, 2, 1),
(1, 3, 2);
