-- Crear base de datos
CREATE DATABASE IF NOT EXISTS sistema_servicio_tecnico;
USE sistema_servicio_tecnico;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(255),
    tipo_usuario ENUM('cliente', 'personal técnico') NOT NULL
);

-- Crear tabla Solicitudes
CREATE TABLE Solicitudes (
    id_solicitud INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    fecha_solicitud DATE NOT NULL,
    descripcion_problema TEXT,
    estado ENUM('pendiente', 'en proceso', 'finalizada') NOT NULL,
    fecha_finalizacion DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Inventario
CREATE TABLE Inventario (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(255) NOT NULL,
    tipo_equipo VARCHAR(100),
    marca VARCHAR(100),
    cantidad_disponible INT NOT NULL
);

-- Crear tabla Mantenimientos
CREATE TABLE Mantenimientos (
    id_mantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_solicitud INT,
    id_tecnico INT,
    fecha_programada DATE NOT NULL,
    descripcion_mantenimiento TEXT,
    estado_mantenimiento ENUM('pendiente', 'completado') NOT NULL,
    FOREIGN KEY (id_solicitud) REFERENCES Solicitudes(id_solicitud),
    FOREIGN KEY (id_tecnico) REFERENCES Usuarios(id_usuario)
);

-- Crear tabla Notificaciones
CREATE TABLE Notificaciones (
    id_notificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    tipo_notificacion ENUM('alerta de mantenimiento', 'solicitud de servicio') NOT NULL,
    mensaje TEXT,
    fecha_envio DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
