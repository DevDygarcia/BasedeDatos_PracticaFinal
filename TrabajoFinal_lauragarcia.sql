DROP DATABASE IF EXISTS EquiposRedes;
-- Crear base de datos
CREATE DATABASE EquiposRedes;

-- Usar la base de datos
USE EquiposRedes;

-- Crear tablas
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(15)
);

CREATE TABLE Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Cargo VARCHAR(50)
);

CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Precio DECIMAL(10, 2)
);

CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(15)
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ClienteID INT,
    EmpleadoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

CREATE TABLE DetallePedido (
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    PRIMARY KEY (PedidoID, ProductoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

CREATE TABLE Suministros (
    ProductoID INT,
    ProveedorID INT,
    PRIMARY KEY (ProductoID, ProveedorID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Insertar registros

-- Clientes
INSERT INTO Clientes (Nombre, Dirección, Teléfono) VALUES
('Empresa A', 'Calle Falsa 123', '555-1234'),
('Empresa B', 'Avenida Siempre Viva 742', '555-5678');

-- Empleados
INSERT INTO Empleados (Nombre, Cargo) VALUES
('Juan Pérez', 'Vendedor'),
('Ana Gómez', 'Gerente de Ventas');

-- Productos
INSERT INTO Productos (Nombre, Descripción, Precio) VALUES
('Router X1000', 'Router de alta velocidad', 150.00),
('Switch S2000', 'Switch de 24 puertos', 250.00);

-- Proveedores
INSERT INTO Proveedores (Nombre, Dirección, Teléfono) VALUES
('Proveedor 1', 'Calle del Proveedor 1', '555-1111'),
('Proveedor 2', 'Calle del Proveedor 2', '555-2222');

-- Pedidos
INSERT INTO Pedidos (Fecha, ClienteID, EmpleadoID) VALUES
('2024-06-01', 1, 1),
('2024-06-02', 2, 2);

-- DetallePedido
INSERT INTO DetallePedido (PedidoID, ProductoID, Cantidad) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 1, 1);

-- Suministros
INSERT INTO Suministros (ProductoID, ProveedorID) VALUES
(1, 1),
(2, 2);

-- Ver todos los registros
SELECT * FROM Clientes;

SELECT * FROM Empleados;

SELECT * FROM Productos;

SELECT * FROM Proveedores;

SELECT * FROM Pedidos;

SELECT * FROM DetallePedido;

SELECT * FROM Suministros;
