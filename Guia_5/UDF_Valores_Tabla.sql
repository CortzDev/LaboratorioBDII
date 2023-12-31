USE [Veterinaria]
GO
/****** Object:  UserDefinedFunction [dbo].[CitasDoctorPaciente]    Script Date: 13-oct-23 9:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[CitasDoctorPaciente] (@Paciente INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
    a.ID_Cita,
    c.Nombre AS Paciente,
    CONCAT(d.Nombres, ' ', d.Apellidos) AS Dueño,
    CONCAT(b.Nombre, ' ', b.Apellido) AS Doctor,
    a.Fecha, a.Hora, a.Motivo
FROM
    Citas AS a
    INNER JOIN Doctores AS b ON a.ID_Doctor = b.ID_Doctor
    INNER JOIN Pacientes AS c ON a.ID_Paciente = c.ID_Paciente
    INNER JOIN Clientes AS d ON c.ID_Cliente = d.ID_Cliente
WHERE
    C.ID_Paciente = @Paciente
)
