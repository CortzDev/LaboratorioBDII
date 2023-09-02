-- Obtener el nombre y el salario de los doctores cuyo salario sea mayor que $5000
SELECT Nombre, Salario
FROM Doctores
WHERE Salario > 5000;

-- Calcular el costo total de todos los tratamientos
SELECT SUM(Costo) AS Costo_Total
FROM Tratamientos;

-- Obtener el nombre del medicamento y su precio ordenados de forma desendentes 
SELECT Nombre, Precio
FROM Medicamentos
ORDER BY Precio DESC;


-- Obtener el nombre y la especie de los pacientes ademas de mostrar los que tienen más de 2 años de edad
SELECT Nombre, Especie , edad as Anios
FROM Pacientes
WHERE Edad > 2;

-- Calcular el promedio de edad de los pacientes
SELECT AVG(Edad) AS Edad_Promedio
FROM Pacientes;