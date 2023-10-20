USE dbs_sistema_academico
GO
INSERT INTO tbl_sexo (pkcodigo, nombre, nomenclatura) VALUES 
(1, 'Hombre', 'H'),
(2, 'Mujer', 'M');

USE dbs_sistema_academico
GO
INSERT INTO tbl_estrato (pkcodigo, nombre, nomenclatura)
VALUES 
    (1, 'Pobreza Extrema', 'Grupo A'),
    (2, 'Hogares Pobres', 'Grupo B'),
    (3, 'Vulnerable', 'Grupo C'),
    (4, 'No Pobre, ni Vulnerable', 'Grupo D');

USE dbs_sistema_academico
GO
INSERT INTO tbl_estado (pkcodigo, nombre, nomenclatura)
VALUES
    (1, 'Matriculado', 'MAT'),
    (2, 'En Espera', 'ESP'),
    (3, 'Aprobado', 'APR'),
    (4, 'Rechazado', 'REC'),
    (5, 'En Lista de Espera', 'LDE'),
    (6, 'Transferido', 'TRA'),
    (7, 'Retirado', 'RET'),
    (8, 'Matrícula en Proceso', 'MENP'),
    (9, 'En Evaluación', 'EEV'),
    (10, 'Aprobado con Condiciones', 'ACC');
