CREATE TRIGGER InsercionPaciente
ON Pacientes
AFTER INSERT
AS
BEGIN
    DECLARE @ID_Paciente int
    DECLARE @FechaInsercion datetime
    DECLARE @Nombre varchar(50)
    DECLARE @Mensaje NVARCHAR(MAX)

    SELECT TOP 1
        @ID_Paciente = ID_Paciente,
        @FechaInsercion = GETDATE(),
		@Nombre = Nombre
    FROM inserted

    INSERT INTO ReportePacientes (ID_Paciente, FechaInsercion, Nombre)
    VALUES (@ID_Paciente, @FechaInsercion, @Nombre)

    SET @Mensaje = 'Se realizó una nueva inserccion con Fecha y Hora: ' + 
                   CONVERT(NVARCHAR, @FechaInsercion, 120) + 
                   ' del paciente ' + @Nombre 

    PRINT @Mensaje
END;
