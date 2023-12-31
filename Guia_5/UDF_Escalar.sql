USE [Veterinaria]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcularPromedioEdadPacientes]    Script Date: 13-oct-23 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[CalcularPromedioEdadPacientes]()
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @PromedioEdad DECIMAL(5, 2)

    SELECT @PromedioEdad = AVG([Edad])
    FROM [dbo].[Pacientes]

    RETURN @PromedioEdad
END
