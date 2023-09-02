-- Mostrar Nombre paciente y propietario
SELECT p.Nombre AS Mascota, concat(c.Nombres,' ',c.Apellidos ) AS Propietario
FROM Pacientes p
JOIN Clientes c ON p.ID_Cliente = c.ID_Cliente;

-- Mostrar el nombre de los medicamentos y sus proveedores
SELECT m.Nombre AS Nombre_Medicamento, pr.Nombre AS Nombre_Proveedor
FROM Medicamentos m
JOIN Proveedores pr ON m.Proveedor_ID = pr.ID_Proveedor;

-- Mostrar los nombres de los pacientes y sus tratamientos asociados
SELECT p.Nombre AS Paciente, t.Nombre_del_Tratamiento AS Tratamiento
FROM Pacientes p
LEFT JOIN Historiales_Medicos hm ON p.ID_Paciente = hm.ID_Paciente
LEFT JOIN Tratamientos t ON hm.ID_Tratamiento = t.ID_Tratamiento;

-- Mostrar los doctores que han realizado citas para pacientes de más de 2 años de edad
SELECT ID_Doctor, concat(Nombre, ' ', Apellido) AS Nombre
FROM Doctores
WHERE ID_Doctor IN (
    SELECT DISTINCT c.ID_Doctor
    FROM Citas c
    JOIN Pacientes p ON c.ID_Paciente = p.ID_Paciente
    WHERE p.Edad > 2
);

-- Mostrar los medicamentos que tienen un precio superior al promedio de precios de todos los medicamentos:
SELECT Nombre, Precio
FROM Medicamentos
WHERE Precio > (SELECT AVG(Precio) FROM Medicamentos);

