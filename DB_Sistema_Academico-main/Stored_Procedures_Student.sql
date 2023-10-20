USE dbs_sistema_academico
GO

-- =============================================
-- Author:      <Author, Juan Carlos Llorente Bedoya>
-- Create date: <Create Date, 10 de septiembre 2023>
-- Description: <Description, Registrar Estudiante>
-- =============================================
CREATE PROCEDURE sp_registrarestudiante
    @id varchar(10),
    @nombre varchar(100),
    @contacto varchar(10),
    @correo varchar(80),
    @direccion varchar(100),
    @acudiente varchar(100),
    @fkcodigo_estrato int,
    @fkcodigo_sexo int,
    @observaciones varchar(500)
AS
BEGIN
    INSERT INTO tbl_estudiantes (pkid, nombre, contacto, correo, direccion, acudiente, fkcodigo_tbl_estrato, fkcodigo_tbl_sexo, observaciones)
    VALUES (@id, @nombre, @contacto, @correo, @direccion, @acudiente, @fkcodigo_estrato, @fkcodigo_sexo, @observaciones)
END


use dbs_sistema_academico
go
ALTER PROCEDURE sp_consultarestudiante
    @id varchar(10)
AS
BEGIN
    DECLARE @buscar int 
    SELECT @buscar = COUNT(*) FROM tbl_estudiantes WHERE pkid = @id

    -- Agregar un mensaje de registro para depuración
    PRINT 'Valor de @buscar: ' + CAST(@buscar AS varchar(10))

    IF @buscar = 1 
    BEGIN 
        PRINT 'La persona ya está registrada'
    END
    ELSE
    BEGIN 
        SELECT * FROM tbl_estudiantes WHERE pkid = @id
    END
END


-- =============================================
-- Author:      <Author, Juan Carlos Llorente Bedoya>
-- Create date: <Create Date, 10 de septiembre 2023>
-- Description: <Description, Actualizar Estudiante por pkid>
-- =============================================
CREATE PROCEDURE sp_actualizarestudiante
    @id varchar(10),
    @nombre varchar(100),
    @contacto varchar(10),
    @correo varchar(80),
    @direccion varchar(100),
    @acudiente varchar(100),
    @fkcodigo_estrato int,
    @fkcodigo_sexo int,
    @observaciones varchar(500)
AS
BEGIN
    -- Verificar si existe un estudiante con el pkid proporcionado
    IF EXISTS (SELECT 1 FROM tbl_estudiantes WHERE pkid = @id)
    BEGIN
        -- Actualizar el estudiante si existe
        UPDATE tbl_estudiantes
        SET nombre = @nombre,
            contacto = @contacto,
            correo = @correo,
            direccion = @direccion,
            acudiente = @acudiente,
            fkcodigo_tbl_estrato = @fkcodigo_estrato,
            fkcodigo_tbl_sexo = @fkcodigo_sexo,
            observaciones = @observaciones
        WHERE pkid = @id
    END
END
