/*Creacion de tabla simple postgressql*/
CREATE TABLE RegistoHorasPracticas(
	ID_Practicas serial,
	Fecha date,
	Hora_Ingreso time,
	Hora_Salida time,
	Actividades varchar,
	Tiempo_Almuerzo time,
	Tiempo_Autonomo time
);

/*Inseción basica con postgressql*/

INSERT INTO RegistoHorasPracticas (Fecha, Hora_Ingreso, Hora_Salida, Actividades, Tiempo_Almuerzo, Tiempo_Autonomo)
VALUES ('05-06-2022', '09:15:00', '17:05:00',
		'Reconocimiento de las áreas de trabajo y preparación del entorno de desarrollo',
		'00:30:00', '00:00:01');

/*Inserción Unificada con postgressql*/
INSERT INTO RegistoHorasPracticas (Fecha, Hora_Ingreso, Hora_Salida, Actividades, Tiempo_Almuerzo, Tiempo_Autonomo)
VALUES ('07-06-2022', '09:15:00', '14:45:00',
		'Creación de la estructura del proyecto utilizando la arquitectura modelo vista controlador y conexión con la base de datos utilizando Sql Server y node js', 
		'00:30:00', '01:30:00'),
('08-06-2022', '09:45:00', '13:00:00', 'Corrección de errores en las consultas de la base de datos',
'00:15:00', '00:00:00'),
('09-06-2022', '14:00:00', '17:00:00', 'Corrección de errores en las consultas de la base de datos y paso del codigo fuente al servidor de prueba',
'00:00:00', '00:00:00');


/*Consulta basica postgreSQL*/
SELECT * FROM RegistoHorasPracticas

/*Consulta a campos especificos*/
SELECT actividades from RegistohorasPracticas;

/*Consulta con Condición*/
SELECT * FROM RegistoHorasPracticas WHERE tiempo_almuerzo = '00:30:00';

/*Consulta con condiciones anidadas*/
SELECT * FROM RegistoHorasPracticas WHERE tiempo_almuerzo = '00:30:00' AND hora_salida = '17:05:00';

/*Consulta con operador not*/
SELECT * FROM RegistoHorasPracticas WHERE NOT tiempo_almuerzo = '00:30:00';


/*ELIMINAR REGISTRO DE LA TABLA SIMPLE*/
DELETE FROM RegistoHorasPracticas

/*ELIMINACION DE LA TABLA*/
DROP TABLE RegistoHorasPracticas