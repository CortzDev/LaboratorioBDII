CREATE TABLE ReportePacientes (
    ID_ReportePaciente INT PRIMARY KEY IDENTITY(1, 1),
    ID_Paciente INT,
    FechaInsercion DATETIME,
    Nombre VARCHAR(50)
);
