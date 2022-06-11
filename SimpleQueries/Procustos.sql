/*Creacion de base de datos con llave primaria*/
CREATE TABLE Productos(
	IdProductos serial primary key,
	Nombre varchar,
	Precio integer,
	Descuento bool,
	Fecha_Caducidad date
);

/*Inserción de datos multiples en la base de datos*/
INSERT INTO productos (Nombre, Precio, Descuento, Fecha_Caducidad)
	VALUES
		('Atún', 20, FALSE, '05-03-2022'),
		('Aceite', 10, FALSE, '06-03-2022'),
		('Arroz', 5, FALSE, '15-03-2022'),
		('Azúcar', 10, True, '05-05-2023'),
		('CANELA', 2, FALSE, '25-10-2022');
INSERT INTO productos (Nombre, Precio, Descuento, Fecha_Caducidad)
	VALUES
		('Atún', 10, TRUE, '05-03-2022')

/*Seleccion simple*/
SELECT * FROM productos;

/*Consulta con operadores or y where*/
SELECT * FROM productos where nombre='Mayonesa' or nombre='Aceite';

/*Actualizacion de todos los campos en una instrucción
en este caso se actualizo el descuento en todos los campos*/
UPDATE productos SET descuento = 'TRUE' 

/*Actualización de campos de acuerdo a condiciones especificas*/
UPDATE productos SET nombre = 'Atún Real' WHERE precio = 20;

/*Actualizacion de descuento en base a una condicion de precio*/
UPDATE productos SET descuento = FALSE WHERE precio<10;

/*Eliminar campo con un valor en especifico*/
DELETE FROM productos where nombre = 'CANELA';

/*ELIMINAR CAMPOS EN BASE A UNA CONDICION WHERE*/
	/*Primero crear valores similares AJAJJAJAA*/
	INSERT INTO productos (Nombre, Precio, Descuento, Fecha_Caducidad)
		VALUES
		('Canela', 5, FALSE, '20-12-2022'),
		('Canela', 6, FALSE, '15-10-2022')
		
DELETE FROM productos where nombre = 'Canela' and precio>2;

/*Eliminación simple*/
DELETE FROM productos;