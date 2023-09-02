Create database Veterinaria;


use Veterinaria;

-- Tabla: Departamento
CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Departamento VARCHAR(50)
);

-- Tabla: Municipio
CREATE TABLE Municipio (
    ID_Municipio INT PRIMARY KEY,
    Municipio VARCHAR(50),
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Tabla: Distrito
CREATE TABLE Distrito (
    ID_Distrito INT PRIMARY KEY,
    Distrito VARCHAR(50),
    ID_Municipio INT,
    FOREIGN KEY (ID_Municipio) REFERENCES Municipio(ID_Municipio)
);

-- Tabla: Direcciones
CREATE TABLE Direcciones (
    ID_Direccion INT PRIMARY KEY,
    Linea1 VARCHAR(50),
    Linea2 VARCHAR(50),
    ID_Distrito INT,
    CP VARCHAR(10),
    FOREIGN KEY (ID_Distrito) REFERENCES Distrito(ID_Distrito)
);

-- Tabla: Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(15),
    Correo_Electronico VARCHAR(100),
    Direccion_ID INT,
    FOREIGN KEY (Direccion_ID) REFERENCES Direcciones(ID_Direccion)
);

-- Tabla: Medicamentos
CREATE TABLE Medicamentos (
    ID_Medicamento INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(200),
    Precio DECIMAL(8, 2),
    Proveedor_ID INT,
    FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(ID_Proveedor)
);

CREATE TABLE Tipo_Empleado (
	ID_Tipo INT PRIMARY KEY,
	Tipo_Empleado varchar(50)
);

-- Tabla: Empleados
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
	ID_Tipo INT,
    DUI VARCHAR(9),
    ISS VARCHAR(50),
    Telefono VARCHAR(8),
    ID_Direccion INT NOT NULL,
    Puesto VARCHAR(50),
    Fecha DATE,
    email VARCHAR(100),
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion),
	FOREIGN KEY (ID_Tipo) REFERENCES Tipo_Empleado(ID_Tipo)
);



-- Tabla: Clientes
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Telefono VARCHAR(8),
    Fecha DATE,
    email VARCHAR(100),
    ID_Direccion INT NOT NULL,
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)
);

-- Tabla: Doctores
CREATE TABLE Doctores (
    ID_Doctor INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Especialidad VARCHAR(100),
    Fecha_Inicio DATE,
    Salario DECIMAL(10, 2),
    ID_Direccion INT,
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)
);

-- Tabla: Pacientes
CREATE TABLE Pacientes (
    ID_Paciente INT PRIMARY KEY,
	ID_Cliente INT,
    Nombre VARCHAR(50),
    Especie VARCHAR(50),
    Raza VARCHAR(50),
    Edad INT,
    Peso DECIMAL(5, 2),
    Fecha_Registro DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabla: Ventas
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    Fecha DATE,
    Total DECIMAL(10, 2)
);

-- Tabla: Medicamentos_Venta
CREATE TABLE Medicamentos_Venta (
    ID_Medicamento INT PRIMARY KEY, -- Esto debería ser la clave primaria
    ID_Venta INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(8, 2),
    FOREIGN KEY (ID_Medicamento) REFERENCES Medicamentos(ID_Medicamento),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta)
);



CREATE TABLE Recetas (
    ID_Receta INT PRIMARY KEY,
    Nombre VARCHAR(50),
    descripcion TEXT,
    ingredientes TEXT,
    instrucciones TEXT,
    Sobredosis TEXT,
    ID_Medicamento INT,
    FOREIGN KEY (ID_Medicamento) REFERENCES Medicamentos(ID_Medicamento)
);

-- Tabla: Citas
CREATE TABLE Citas (
    ID_Cita INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Doctor INT,
    Fecha DATE,
    Hora TIME,
    Motivo VARCHAR(200),
    Diagnostico VARCHAR(200),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Doctor) REFERENCES Doctores(ID_Doctor)
);

-- Tabla: Tratamientos
CREATE TABLE Tratamientos (
    ID_Tratamiento INT PRIMARY KEY,
    Nombre_del_Tratamiento VARCHAR(100),
    Descripcion VARCHAR(200),
    Duracion INT,
    Costo DECIMAL(8, 2)
);

-- Tabla: Historiales_Medicos
CREATE TABLE Historiales_Medicos (
    ID_Historial INT PRIMARY KEY,
    ID_Paciente INT,
    Fecha DATE,
    Descripcion TEXT,
    ID_Tratamiento INT,
    Notas TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
	FOREIGN KEY (ID_Tratamiento) REFERENCES Tratamientos(ID_Tratamiento)
);

-- Tabla: Facturas
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY,
    ID_Venta INT,
    ID_Paciente INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente)
);
