-- 1. Crear Base de Datos
CREATE DATABASE Veterinaria;
GO
USE Veterinaria;
GO

-- 2. Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(200) NOT NULL
);

-- 3. Tabla Mascotas (Relación 1:N con Clientes)
CREATE TABLE Mascotas (
    id_mascota INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 4. Tabla Veterinarios
CREATE TABLE Veterinarios (
    id_veterinario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

-- 5. Tabla Consultas (Representa el Historial / Expediente Clínico)
CREATE TABLE Consultas (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    diagnostico VARCHAR(500) NOT NULL,
    tratamiento VARCHAR(500) NOT NULL,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id_veterinario)
);

-- 6. Tabla Recetas ( Relación 1:1 o 0:1 con Consulta)
CREATE TABLE Recetas (
    id_receta INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    id_consulta INT UNIQUE NOT NULL, -- UNIQUE garantiza que una consulta genera como máximo una receta
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);

-- 7. Tabla Medicamentos
CREATE TABLE Medicamentos (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NULL
);

-- 8. Tabla DetalleReceta (Relación N:M entre Recetas y Medicamentos)
CREATE TABLE DetalleReceta (
    id_receta INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    indicaciones VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_receta, id_medicamento),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamentos(id_medicamento)
);