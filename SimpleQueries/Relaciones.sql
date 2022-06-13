	/*This is a relashionshih UNO A UNO*/
	/*Main Table*/
	CREATE TABLE Estudiantes (
		ID_Estudiantes INTEGER PRIMARY KEY ,
		Nombre varchar(30) NOT NULL,
		Apellido varchar(30) NOT NULL
	);
	/*Secondary Table*/
	CREATE TABLE Detalle_Estudiante(
		ID_Detalle_Estudiante INTEGER PRIMARY KEY,
		Ciudad VARCHAR(20) NOT NULL,
		Fecha_Inscripcion date NOT NULL,
		CONSTRAINT FK_ID_Detalle_Estudiante 
			FOREIGN KEY (ID_Detalle_Estudiante)
		REFERENCES Estudiantes (ID_Estudiantes)	
	);
/*Insersion de datos Tabla principal*/
	
INSERT INTO Estudiantes (ID_Estudiantes, Nombre,Apellido) VALUES (1, 'Alexis', 'Lopez');

/*Seleccion de datos*/
SELECT * FROM Estudiantes

/*Insersion de datos tabla segundaria*/

INSERT INTO Detalle_Estudiante (ID_Detalle_Estudiante, ciudad, Fecha_Inscripcion) 
	VALUES ('1', 'Manta', '10-02-2021');

/*Seleccion de datos*/

SELECT * FROM Detalle_Estudiante;

/*Peticion conjunta de la base de datos*/

SELECT * FROM Estudiantes E
	INNER JOIN Detalle_Estudiante D
ON E.ID_Estudiantes = D.ID_Detalle_Estudiante

/*ESTE ES UN EJEMPLO DE 1 A MUCHOS*/

/*creacion de la tabla libro*/
CREATE TABLE LIBRO (
	ID_LIBRO INTEGER PRIMARY KEY,
	NOMBRE VARCHAR(20)
)
/*INSERTAR DATOS EN LA TABLA LIBRO*/
INSERT INTO LIBRO (ID_LIBRO, NOMBRE)
	VALUES
	(1, 'LOS 100 HABITOS')
SELECT * FROM LIBRO

/*CREACION DE LA TABLA PERSONA*/
CREATE TABLE PERSONA(
	ID_PERSONA INTEGER PRIMARY KEY, 
	NOMBRE_PERSONA VARCHAR(20),
	ID_LIBRO INTEGER NOT NULL,
	CONSTRAINT FK_ID_LIBRO 
		FOREIGN KEY (ID_LIBRO)
	REFERENCES LIBRO (ID_LIBRO) 
)
/*INGRESAMOS DATOS A LA TABLA PERSONA*/
INSERT INTO PERSONA (ID_PERSONA,NOMBRE_PERSONA,ID_LIBRO) VALUES (1, 'LINUX', '1');
SELECT * FROM PERSONA

/*HACEMOS LA CONSULTA EN CONJUNTO*/
SELECT P.NOMBRE_PERSONA, L.NOMBRE 
	FROM PERSONA P
INNER JOIN  
	LIBRO L
ON P.ID_LIBRO = L.ID_LIBRO



