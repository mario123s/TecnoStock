CREATE DATABASE IF NOT EXISTS tecnstock CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tecnstock;

CREATE TABLE usuarios (
    id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    clave VARCHAR(255) NOT NULL,
    estado TINYINT(1) NOT NULL DEFAULT 1,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NULL,
    estado TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE productos (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(40) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL,
    descripcion TEXT NULL,
    precio DECIMAL(12,2) NOT NULL DEFAULT 0 CHECK (precio >= 0),
    stock_actual INT UNSIGNED NOT NULL DEFAULT 0,
    stock_minimo INT UNSIGNED NOT NULL DEFAULT 0,
    estado TINYINT(1) NOT NULL DEFAULT 1,
    id_categoria INT UNSIGNED NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE movimientos (
    id_movimiento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo ENUM('entrada','salida') NOT NULL,
    cantidad INT UNSIGNED NOT NULL CHECK (cantidad > 0),
    observacion VARCHAR(255) NULL,
    id_producto INT UNSIGNED NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    CONSTRAINT fk_movimiento_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CONSTRAINT fk_movimiento_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO usuarios (nombre, correo, clave) VALUES
('Administrador TecnoStock', 'admin@tecnstock.cl', 'DEMO:password');
INSERT INTO categorias (nombre, descripcion) VALUES
('Cables', 'Cables y adaptadores'), ('Audio', 'Audifonos y parlantes'), ('Perifericos', 'Accesorios para computador');
INSERT INTO productos (codigo, nombre, descripcion, precio, stock_actual, stock_minimo, id_categoria) VALUES
('CAB-HDMI-01', 'Cable HDMI 2 metros', 'Cable HDMI de alta velocidad', 8990, 12, 5, 1),
('AUD-BT-01', 'Audifonos Bluetooth', 'Audifonos inalambricos', 24990, 4, 6, 2),
('MOU-USB-01', 'Mouse USB ergonomico', 'Mouse optico para oficina', 7990, 20, 5, 3);
