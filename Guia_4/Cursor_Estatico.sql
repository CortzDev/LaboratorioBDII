USE [Veterinaria];


-- Declarar el cursor estático
DECLARE Citas CURSOR STATIC FOR
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

-- Abrir el cursor
OPEN Citas

-- Declarar variables para almacenar los datos de cada fila
DECLARE @ID_Cita INT, @Paciente VARCHAR(255), @Duenio VARCHAR(255), 
@Doctor VARCHAR(255), @Fecha DATE, @Hora TIME, @Motivo VARCHAR(255)


-- Leer la primera fila
FETCH NEXT FROM Citas INTO @ID_Cita, @Paciente, @Duenio, @Doctor, @Fecha, @Hora, @Motivo

-- Iniciar el bucle para recorrer los resultados
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Realizar acciones con los datos de la fila actual
    PRINT '---------------------------------------------------------' + CHAR(13) +
		'ID_Cita: ' + CONVERT(VARCHAR(10), @ID_Cita) + CHAR(13) +
			  ' Paciente: ' + @Paciente + CHAR(13) +
			  ' Dueño: ' + @Duenio + CHAR(13) +
			  ' Doctor: ' + @Doctor + CHAR(13) +
			  ' Fecha: ' + CONVERT(VARCHAR(10), @Fecha, 120) + CHAR(13) +
			  ' Hora: ' + CONVERT(VARCHAR(10), @Hora, 120) + CHAR(13)  +
			  ' Motivo: ' + @Motivo;


-- Leer la siguiente fila
FETCH NEXT FROM Citas INTO @ID_Cita, @Paciente, @Duenio, @Doctor,@Fecha, @Hora, @Motivo
END

-- Cerrar y desasignar el cursor
CLOSE Citas
DEALLOCATE Citas