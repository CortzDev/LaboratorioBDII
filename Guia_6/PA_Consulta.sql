USE [Veterinaria]
GO
/****** Object:  StoredProcedure [dbo].[ConsultaCitasDetalladas]    Script Date: 13-oct-23 9:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Javier And Tani>
-- Create date: <09-10-2023>
-- Description:	<PA Consulta de datos>
-- =============================================

ALTER PROCEDURE [dbo].[ConsultaCitasDetalladas]
AS
BEGIN
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
        INNER JOIN Clientes AS d ON c.ID_Cliente = d.ID_Cliente;
END
