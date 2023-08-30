CREATE DATABASE EmpresaPlus

----------------------------------Creacion de Tablas------------------------------------------------------
CREATE TABLE Producto 
(
  ID_Producto INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Descripcion TEXT,
  Precio DECIMAL,
  Cantidad_en_stock INT,
  Categoria VARCHAR(255),
  Proveedor VARCHAR(255)
);
CREATE TABLE Cliente 
(
  ID_Cliente INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Apellido VARCHAR(255),
  Direccion TEXT,
  Correo_electronico VARCHAR(255),
  Numero_de_telefono VARCHAR(20)
);
CREATE TABLE Pedido 
(
  ID_Pedido INT PRIMARY KEY,
  ID_Cliente INT,
  Fecha_pedido DATETIME,
  Estado_pedido VARCHAR(50),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);
CREATE TABLE DetallePedido 
(
  ID_Detalle INT PRIMARY KEY,
  ID_Pedido INT,
  ID_Producto INT,
  Cantidad INT,
  Subtotal DECIMAL,
  FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
  FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);
CREATE TABLE Factura 
(
  ID_Factura INT PRIMARY KEY,
  ID_Pedido INT,
  Fecha_facturacion DATETIME,
  Total_factura DECIMAL,
  Datos_de_pago TEXT,
  FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);
CREATE TABLE Empleado 
(
  ID_Empleado INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Apellido VARCHAR(255),
  Cargo VARCHAR(100),
  Salario DECIMAL,
  Fecha_contratacion DATE
);

---------------------Llenado de tablas------------------
INSERT INTO Producto (ID_Producto, Nombre, Descripcion, Precio, Cantidad_en_stock, Categoria, Proveedor)
VALUES
  (1, 'Producto 1', 'Descripción del producto 1', 19.99, 100, 'Electrónica', 'Proveedor A'),
  (2, 'Producto 2', 'Descripción del producto 2', 29.99, 50, 'Ropa', 'Proveedor B');

INSERT INTO Cliente (ID_Cliente, Nombre, Apellido, Direccion, Correo_electronico, Numero_de_telefono)
VALUES
  (1, 'Juan', 'Pérez', 'Calle 123, Ciudad', 'juan@example.com', '123-456-7890'),
  (2, 'María', 'Gómez', 'Avenida 456, Otra Ciudad', 'maria@example.com', '987-654-3210');

INSERT INTO Pedido (ID_Pedido, ID_Cliente, Fecha_pedido, Estado_pedido)
VALUES
  (1, 1, '2023-08-23 10:00:00', 'Pendiente'),
  (2, 2, '2023-08-22 15:30:00', 'En proceso');

INSERT INTO DetallePedido (ID_Detalle, ID_Pedido, ID_Producto, Cantidad, Subtotal)
VALUES
  (1, 1, 1, 3, 59.97),
  (2, 1, 2, 2, 59.98),
  (3, 2, 1, 1, 19.99);

INSERT INTO Factura (ID_Factura, ID_Pedido, Fecha_facturacion, Total_factura, Datos_de_pago)
VALUES
  (1, 1, '2023-08-23 11:30:00', 119.95, 'Tarjeta de crédito'),
  (2, 2, '2023-08-22 16:45:00', 19.99, 'PayPal');

INSERT INTO Empleado (ID_Empleado, Nombre, Apellido, Cargo, Salario, Fecha_contratacion)
VALUES
  (1, 'Luis', 'González', 'Vendedor', 2500.00, '2023-01-15'),
  (2, 'Ana', 'Martínez', 'Gerente', 4000.00, '2022-05-03');


---------------------------------Consultas-----------------------------------------------------------
SELECT * FROM Producto;
SELECT Nombre, Descripcion FROM Producto;
SELECT * FROM Producto WHERE Condicion;
SELECT * FROM Producto ORDER BY Columna ASC/DESC;
SELECT * FROM Cliente ORDER BY Apellido ASC;
SELECT * FROM Cliente
SELECT COUNT(*) FROM Pedido;
SELECT Categoria, COUNT(*) FROM Producto GROUP BY Categoria;