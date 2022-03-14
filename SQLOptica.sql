DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;
CREATE TABLE proveedor (
id_number INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
calle VARCHAR (50) NOT NULL,
número INT NOT NULL,
piso INT,
puerta CHAR,
CP VARCHAR (10) NOT NULL,
país VARCHAR (15) NOT NULL,
teléfono INT NOT NULL,
fax INT,
NIF VARCHAR (20) NOT NULL,
PRIMARY KEY (id_number)


);

CREATE TABLE gafas (
id_number INT NOT NULL AUTO_INCREMENT,
marca VARCHAR (30) NOT NULL,
graduacionDerecha FLOAT,
graduacionIzquierda FLOAT,
montura ENUM ('flotante', 'pasta', 'metalica') NOT NULL,
colorDerecho VARCHAR (20) NOT NULL,
colorIzquierdo VARCHAR (20) NOT NULL,
precio FLOAT NOT NULL,
proveedor_id INT DEFAULT NULL,
PRIMARY KEY (id_number),
FOREIGN KEY (proveedor_id) REFERENCES proveedor (id_number)

);

CREATE TABLE vendedor (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (50),
PRIMARY KEY (id)
);

CREATE TABLE clientes (
id_number INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (250) NOT NULL,
calle VARCHAR (50) NOT NULL,
número INT NOT NULL,
piso INT,
puerta CHAR,
CP VARCHAR (10) NOT NULL,
país VARCHAR (15) NOT NULL,
teléfono INT NOT NULL,
correoElectronico VARCHAR (50) NOT NULL,
fechaRegistro DATE NOT NULL,
recomendacion VARCHAR (250),
vendedor_id INT NOT NULL,
PRIMARY KEY (id_number),
FOREIGN KEY (vendedor_id) REFERENCES vendedor (id)


);



CREATE TABLE facturas (
id INT NOT NULL AUTO_INCREMENT,
cliente_id INT,
proveedor_id INT NOT NULL,
gafa_id INT NOT NULL,
vendedor_id INT NOT NULL,
fecha DATE,
PRIMARY KEY (id),

 FOREIGN KEY (proveedor_id) REFERENCES proveedor (id_number),
 FOREIGN KEY (cliente_id) REFERENCES clientes (id_number),
 FOREIGN KEY (gafa_id) REFERENCES gafas (id_number),
 FOREIGN KEY (vendedor_id) REFERENCES vendedor (id)

);






      
INSERT INTO proveedor (id_number,nombre,calle, número, piso, puerta, CP, país,teléfono,fax,NIF)
VALUES (1,'Gafas Campiño', 'Olérdola', '78', '5', null, '08034', 'España', '666778899', '912456123', '98764326Y'),
	(2,'Modelos Ron', 'Mallory', '234', '2', null, '67543', 'Inglaterra', '689784237', '987654342', '67542318H'),
    (3,'Visión Clara', 'Hormais', '345', '3', null, '08024', 'España', '678921145', '967845123', '89256724J'),
    (4,'Monturas Valdés', 'Llopart', '56', null, null, '08045', 'España', '678453216', '981245263', '67452918O');
    
INSERT INTO gafas (id_number,marca,graduacionDerecha,graduacionIzquierda,montura,colorDerecho,colorIzquierdo,precio)
VALUES (1,'Rayban', NULL, NUll, 'pasta', 'oscuro', 'oscuro', '175'),
	   (2,'Chanel', '8.5', '6.7', 'metalica', 'claro', 'claro', '200'),
       (3,'Ski', NULL, NULL, 'flotante', 'oscuro', 'oscuro', '120'),
       (4,'Benetton', '3.4', '2.3', 'metalica', 'claro', 'claro', '205');

INSERT INTO clientes (id_number,nombre,calle, número, piso, puerta, CP, país,teléfono,correoElectronico,fechaRegistro,recomendacion,vendedor_id)
VALUES (1,'Alfredo', 'Muntaner', '34', '1', 'A', '08023', 'España', '678998765', 'alfredo@gmail.com', '2018-03-29', 'Ana', '1'),
	  (2,'Alba', 'Aribau', '45', null, null, '08026', 'España', '675432546', 'alba@yahoo.es', '2018-09-23', NULL, '2'),
      (3,'Marta', 'Sicilia', '21', '2', null, '08021', 'España', '652341781', 'marta@gmail.com', '2018-09-28', NULL, '2'),
      (4,'Rodrigo', 'MataroStrasse', '90', '6', 'B', '99887', 'Alemania', '675119988', 'rodrigo@yahoo.es', '2019-08-17', 'Federico', '1');
       
INSERT INTO vendedor (id,nombre)
VALUES (1,'Roberto'), (2,'Marta');

INSERT INTO facturas (id,cliente_id,proveedor_id,gafa_id,vendedor_id,fecha)
VALUES (1, 2, 3, 1, 2, '2019-04-13'), (2, 1, 1, 2, 1, '2019-05-17'), (3, 3, 2, 3, 1, '2020-01-15'), (4, 4, 4, 4, 2, '2020-02-12');


