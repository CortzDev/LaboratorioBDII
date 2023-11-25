-- Vistas: Mostrar empleados con su respectiva dirección.

-- Crear vista
CREATE VIEW Empleados_view AS
    SELECT 
        id_empleado,
        CONCAT(A.Nombres, ' ', A.Apellidos) AS nombre_empleado,
        B.Linea1 AS 'Direccion-1',
        B.Linea2 AS 'Direccion-2',
        B.CP
    FROM
        Empleados AS A,
        Direcciones AS B
    WHERE
        A.ID_Direccion = B.ID_Direccion;

-- Consultar vista
select* from dbo.Empleados_view;

-- Eliminar vista
DROP VIEW dbo.Empleados_view;