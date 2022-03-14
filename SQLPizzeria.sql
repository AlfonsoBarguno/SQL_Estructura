DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria;
USE Pizzeria;

CREATE TABLE Cliente (
Id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
apellido VARCHAR (20) NOT NULL,
direccion VARCHAR (50) NOT NULL,
CP INT (5) NOT NULL,
Id_localidad INT NOT NULL,
Id_provincia INT NOT NULL,
telefono INT NOT NULL,

PRIMARY KEY (Id_cliente),
FOREIGN KEY (Id_localidad) REFERENCES Localidad (Id_localidad),
FOREIGN KEY (Id_provincia) REFERENCES Provincia (Id_provincia)
);

INSERT INTO Cliente (nombre, apellido, direccion, CP, Id_localidad, Id_provincia, telefono)
VALUES ('Clara', 'Vázques', 'C/Muntaner 33', '08067', 1, 2, '678564321'),
    ('Alberto', 'Ruiz', 'C/Aribau 43', '08057', 2, 1, '648543212'),
    ('Ana', 'Martes', 'C/Casanovas 89', '08034', 3, 4, '678565551'),
    ('Iván', 'Rutter', 'C/Balmes 39', '08067', 4, 3, '678560099');


CREATE TABLE Provincia (
Id_provincia INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
PRIMARY KEY (Id_provincia)
);

INSERT INTO Provincia (nombre)
VALUES ('Girona'), ('Lleida'), ('Tarragona'), ('Barcelona');


CREATE TABLE Localidad (
Id_localidad INT NOT NULL AUTO_INCREMENT,
Id_provincia INT NOT NULL,
nombre VARCHAR (50),
PRIMARY KEY (Id_localidad),
FOREIGN KEY (Id_provincia) REFERENCES Provincia (Id_provincia)

);

INSERT INTO Localidad (nombre)
VALUES ('Barcelona'), ('Flix'), ('Barrira'), ('Granollers');

CREATE TABLE Tienda (
Id_tienda INT NOT NULL AUTO_INCREMENT ,
direccion VARCHAR (50) NOT NULL,
CP VARCHAR (5) NOT NULL,
Id_localidad INT NOT NULL,
Id_provincia INT NOT NULL,
PRIMARY KEY (Id_tienda),
FOREIGN KEY (Id_provincia) REFERENCES Provincia (Id_provincia),
FOREIGN KEY (Id_localidad) REFERENCES Localidad (Id_localidad)

);

INSERT INTO Tienda (direccion, CP)
VALUES ('Av. Meridiana 13', '08028'), ('Av. Paral·lel 23', '08034'), ('C/Rossend 12', '08056'), ('C/Marimon 98', '08023');

CREATE TABLE Pedido (
Id_pedido INT NOT NULL AUTO_INCREMENT,
fecha DATE NOT NULL,
hora TIME NOT NULL,
Tipo_entrega ENUM ('domicilo', 'tienda') NOT NULL,
Tipo_producto ENUM ('pizza', 'hamburguesa', 'bebida') NOT NULL,
cantidadProductos INT NOT NULL,
precioTotal INT NOT NULL,
hora_entrega TIME NOT NULL,
PRIMARY KEY (Id_pedido)

);

INSERT INTO Pedido (fecha, hora, Tipo_entrega, Tipo_producto, cantidadProductos, precioTotal, hora_entrega)
VALUES ('2020-09-18', '20:34:23', 'domicilio', 'pizza' '6', '34', '21:05:56'),
		('2020-09-19', '20:55:13', 'tienda', 'hamburguesa', '3', '14', '21:35:23'),
        ('2020-09-18', '21:44:21', 'tienda', 'bebida','12', '74', '22:23: 12'),
        ('2020-09-19', '21:54:45', 'domicilio', 'pizza','1', '12', '22:35:14');

CREATE TABLE Producto (
Id_producto INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
descripcion VARCHAR (250) NOT NULL,
imagen BLOB, 
precio INT NOT NULL,
PRIMARY KEY (Id_producto)

);

INSERT INTO Producto (nombre, descripcion, imagen, precio)
VALUES ('Pizza', 'Masa italiana artesanal', null, '10'),
		('Hamburguesa', 'Ternera ecológica', null, '12'),
		('Té verde', 'Tranquilidad a media tarde', null, '3'),
		('Agua', 'Natural sin gas', null, '2');

CREATE TABLE Categoria (
Id_categoria INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
Id_producto INT NOT NULL,
PRIMARY KEY (Id_categoria),
FOREIGN KEY (Id_producto) REFERENCES Producto (Id_producto)


);

INSERT INTO Categoria (nombre)
VALUES ('Vegetariano'), ('Vegano');


CREATE TABLE Repartidor (
Id_repartidor INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL,
NIF VARCHAR (11),
telefono VARCHAR (9),
Id_tienda INT NOT NULL,
PRIMARY KEY (Id_repartidor),
FOREIGN KEY (Id_tienda) REFERENCES Tienda (Id_tienda)

);

INSERT INTO Repartidor (nombre, apellido, NIF, telefono)
VALUES ('Marcos', 'Redada', '89876546Y', '678567890'),
		('Juana', 'Muñoz', '96776549P', '622567888');
        
CREATE TABLE Empleado (
Id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
apellido VARCHAR (50),
NIF VARCHAR (11),
telefono VARCHAR (9),
TIPO_EMPLEADO ENUM ('cocinero', 'repartidor'),
Id_tienda INT NOT NULL,
PRIMARY KEY (Id_empleado),
FOREIGN KEY (Id_tienda) REFERENCES Tienda (Id_tienda)


);

INSERT INTO Empleado (nombre, apellido, NIF, etlefono, TIPO_EMPLEADO)
VALUES ('Roberto', 'López', '85676544G', '678567890', 'cocinero'),
		('Marcos', 'Redada', '78676541L', '645567887', 'repartidor');


