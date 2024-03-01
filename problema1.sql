-- Active: 1708696221825@@bhorl7ix1poouxmxta1y-mysql.services.clever-cloud.com@3306@bhorl7ix1poouxmxta1y
 
CREATE TABLE plazas(
  id INT UNIQUE KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

/*tablas*/

 CREATE TABLE tipo_vehiculos(
  id INT UNIQUE KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE colores(
  id INT UNIQUE KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

CREATE TABLE marcas(
  id INT UNIQUE KEY AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(45) UNIQUE NOT NULL
);

 CREATE TABLE vehiculos(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  modelo INT(4),
  usuario_id INT  ,
  tipo_vehiculo_id INT  ,
  colores_id INT  ,
  marca_id INT,
  placa VARCHAR(20) UNIQUE NOT NULL
   
 );

 CREATE TABLE tipo_documento(
  id INT KEY UNIQUE AUTO_INCREMENT NOT NULL ,
  nombre VARCHAR(45) UNIQUE NOT NULL
 );

 CREATE TABLE usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
  tipo_documento_id INT UNIQUE,
  nombres VARCHAR(45),
  apellidos VARCHAR(45),
  correo VARCHAR(125) UNIQUE,
  numero_documento VARCHAR(45) UNIQUE NOT NULL ,
  genero VARCHAR(25) NOT NULL
 );

 /*tablas///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////7*/



 INSERT INTO usuarios(nombres,apellidos,correo,genero,numero_documento, tipo_documento_id)
 VALUES('carlo','fernandes','carlos@gmail.com','m','7849574489',2),('marta','mendoza','mendoza@gmail.com','f','948793438',1);

INSERT INTO vehiculos(placa, modelo, usuario_id, tipo_vehiculo_id,colores_id,marca_id)
VALUES('001-h2dg' ,2002 ,2,2,2,2),('666-hrg' ,2008 ,2,2,2,2);

INSERT INTO tipo_vehiculos(nombre)VALUES('moto'),('carro');

INSERT INTO colores(nombre)VALUES('blanco'),('negro');

INSERT INTO marcas(nombre)VALUES('kia'),('ford');


INSERT INTO tipo_documento(nombre)
VALUES('cc'),('nuit');

SELECT * FROM vehiculos INNER JOIN usuarios on vehiculos.placa = '001-hdg';

SELECT usuarios.nombres, usuarios.apellidos, vehiculos.placa tipo_documento_id FROM vehiculos 
INNER JOIN usuarios ON usuarios.id = vehiculos.usuario_id and vehiculos.placa = '001-hdg';

SELECT vehiculos.placa, marcas.nombre, colores.nombre FROM vehiculos 
INNER JOIN marcas ON vehiculos.marca_id = marcas.id 
INNER JOIN colores ON vehiculos.colores_id = colores.id;

ALTER TABLE vehiculos ADD FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


ALTER TABLE vehiculos ADD FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipo_vehiculos(id);


ALTER TABLE vehiculos ADD FOREIGN KEY (colores_id) REFERENCES colores(id);


ALTER TABLE vehiculos ADD FOREIGN KEY (marca_id) REFERENCES marcas(id);


ALTER TABLE usuarios ADD FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id);




/* crear VIEW   para guardar funciones y dejarlas como un despliegue rapido */

/* CREATE VIEW usuario_vehiculo_espesifico AS SELECT usuarios.nombres, usuarios.apellidos, vehiculos.placa tipo_documento_id 
FROM vehiculos INNER JOIN usuarios WHERE usuarios.id = vehiculos.usuario_id and vehiculos.placa = '001-hdg'; */