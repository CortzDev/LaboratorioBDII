DROP DATABASE IF EXISTS veterinaria
create database veterinaria

USE veterinaria

GO
-- Creación de la tabla Departamento
CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Departamento VARCHAR(50)
);

-- Creación de la tabla Municipio
CREATE TABLE Municipio (
    ID_Municipio INT PRIMARY KEY,
    Municipio VARCHAR(50),
    ID_Departamento INT,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

-- Creación de la tabla Distrito
CREATE TABLE  Distrito (
    ID_Distrito INT PRIMARY KEY,
    Distrito VARCHAR(50),
    ID_Municipio INT,
    FOREIGN KEY (ID_Municipio) REFERENCES Municipio(ID_Municipio)
);

-- Creación de la tabla Direcciones
CREATE TABLE  Direcciones (
    ID_Direccion INT PRIMARY KEY,
    Linea1 VARCHAR(50),
    Linea2 VARCHAR(50),
    ID_Distrito INT,
    CP VARCHAR(10),
    FOREIGN KEY (ID_Distrito) REFERENCES Distrito(ID_Distrito)
);

-- Creación de la tabla Proveedores
CREATE TABLE  Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(15),
    Correo_Electronico VARCHAR(100),
    Direccion_ID INT,
    FOREIGN KEY (Direccion_ID) REFERENCES Direcciones(ID_Direccion)
);

-- Creación de la tabla Medicamentos
CREATE TABLE Medicamentos (
    ID_Medicamento INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(200),
    Precio DECIMAL(8, 2),
    Proveedor_ID INT,
    FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(ID_Proveedor)
);

-- Creación de la tabla Tipo_Empleado
CREATE TABLE Cargo (
    ID_Cargo INT PRIMARY KEY,
    Cargo VARCHAR(50)
);

-- Creación de la tabla Roles en el esquema 222
CREATE TABLE Roles (
    ID_Rol INT NOT NULL,
    NombreRol VARCHAR(60) NULL,
    PRIMARY KEY (ID_Rol)
)

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    ID_Cargo INT,
    DUI VARCHAR(9),
    ISS VARCHAR(50),
    Telefono VARCHAR(8),
    ID_Direccion  INT NOT NULL,
    Puesto VARCHAR(50),
    Fecha DATE,
    email VARCHAR(100),
    FOREIGN KEY (ID_Direccion ) REFERENCES Direcciones(ID_Direccion ),
    FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
);

-- Creación de la tabla Clientes
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

-- Creación de la tabla Doctores
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

-- Creación de la tabla Pacientes
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

-- Creación de la tabla Ventas
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    Fecha DATE,
    Total DECIMAL(10, 2)
);

-- Creación de la tabla Medicamentos_Venta
CREATE TABLE Medicamentos_Venta (
    ID_Medicamento INT PRIMARY KEY,
    ID_Venta INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(8, 2),
    FOREIGN KEY (ID_Medicamento) REFERENCES Medicamentos(ID_Medicamento),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta)
);

-- Creación de la tabla Recetas
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

-- Creación de la tabla Citas
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

-- Creación de la tabla Tratamientos
CREATE TABLE Tratamientos (
    ID_Tratamiento INT PRIMARY KEY,
    Nombre_del_Tratamiento VARCHAR(100),
    Descripcion VARCHAR(200),
    Duracion INT,
    Costo DECIMAL(8, 2)
);

-- Creación de la tabla Historiales_Medicos
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

-- Creación de la tabla Facturas
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY,
    ID_Venta INT,
    ID_Paciente INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente)
);

CREATE TABLE Usuarios (
    ID_Usuarios INT NOT NULL,
    ID_Rol INT NOT NULL,
    ID_Empleado INT NOT NULL,
    Usuario VARCHAR(60) NOT NULL,
    Clave VARCHAR(60) NOT NULL,
    PRIMARY KEY (ID_Usuarios),
    INDEX FK1_idx (ID_Empleado ASC) ,
    INDEX FK2_idx (ID_Rol ASC) ,
    CONSTRAINT FK1
        FOREIGN KEY (ID_Empleado)
        REFERENCES Empleados (ID_Empleado)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK2
        FOREIGN KEY (ID_Rol)
        REFERENCES Roles (ID_Rol)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- Creación de la tabla Opciones
CREATE TABLE Opciones (
    ID_Opciones INT NOT NULL,
    NombreOpcion VARCHAR(60) NOT NULL,
    Opcionescol VARCHAR(60) NOT NULL,
    PRIMARY KEY (ID_Opciones)
);

-- Creación de la tabla AsignacionRolesOpciones
CREATE TABLE AsignacionRolesOpciones (
    ID_AsignacionRol INT NOT NULL,
    ID_Rol INT NOT NULL,
    ID_Opcion INT NOT NULL,
    NombreOpcion VARCHAR(60) NOT NULL,
    PRIMARY KEY (ID_AsignacionRol),
    INDEX FK3_idx (ID_Rol ASC) ,
    INDEX FK4_idx (ID_Opcion ASC) ,
    CONSTRAINT FK3
        FOREIGN KEY (ID_Rol)
        REFERENCES Roles (ID_Rol)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK4
        FOREIGN KEY (ID_Opcion)
        REFERENCES Opciones (ID_Opciones)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);