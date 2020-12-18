insert into profesion (descripcion_profesion) values ('Ingeniero en sistemas');
insert into profesion (descripcion_profesion) values ('Ingeniero mecanico');
insert into profesion (descripcion_profesion) values ('Ingeniero electrico');
insert into profesion (descripcion_profesion) values ('Analista de sistemas');
insert into profesion (descripcion_profesion) values ('Economista');

insert into docente (idprofesion, nombre_docente, apellido_docente, cedula_docente,telefono_docente, correo_docente) values
		('1','Jhon Ariel', 'Cevallos Ortiz', '123456789', 098735363736, 'JHONCO@LIVE.ULEAM.EDU.EC');
insert into docente (idprofesion, nombre_docente, apellido_docente, cedula_docente,telefono_docente, correo_docente) values
		('3', 'Roberth Alexander', 'Moreira Centeno', '142363738', 0985646664, 'ROBERTHCO@LIVE.ULEAM.EDU.EC');
insert into docente (idprofesion, nombre_docente, apellido_docente,cedula_docente,telefono_docente, correo_docente) values
		('2', 'Adriana Macias', 'CEVALLOS ORTIZ', '123456789', 098735363736, 'JHONCO@LIVE.ULEAM.EDU.EC');
insert into docente (idprofesion,nombre_docente, apellido_docente,cedula_docente,telefono_docente, correo_docente) values
		('5', 'Walter Alfredo', 'Rivas Peñafiel', '123456789', 098735363736, 'WalterCO@LIVE.ULEAM.EDU.EC');
insert into docente (idprofesion, nombre_docente, apellido_docente,cedula_docente,telefono_docente, correo_docente) values
		('1', 'Marina Alexandra', 'CEVALLOS Cedeño', '123456789', 098735363736, 'MarinaCO@LIVE.ULEAM.EDU.EC');

insert into nivel (descripcion_nivel) values ('1ero');
insert into nivel (descripcion_nivel) values ('2do');
insert into nivel (descripcion_nivel) values ('3ero');
insert into nivel (descripcion_nivel) values ('4to');
insert into nivel (descripcion_nivel) values ('5to');


insert into Facultad (descripcion_facultad) values ('Facultad de ciencias Informaticas');
insert into Facultad (descripcion_facultad) values ('Facultad de ingenieria');

insert into carrera (idfacultad, descripcion_carrera) values ('1', 'Ingenieria en sistemas');
insert into carrera (idfacultad, descripcion_carrera) values ('1', 'Ingenieria en TI');
insert into carrera (idfacultad, descripcion_carrera) values ('2', 'Arquitectura');
insert into carrera (idfacultad, descripcion_carrera) values ('2', 'Electronica');


insert into estudiante (idcarrera, nombre_estudiante, apellidos_estudiante, telefono_estudiante, cedula_estudiante, correo_estudiante)
values ('1', 'Alexis Ricardo', 'López Mero', 0973645373, '134245533', 'Alexis18@gmail.com' );
insert into estudiante (idcarrera, nombre_estudiante, apellidos_estudiante, telefono_estudiante, cedula_estudiante, correo_estudiante)
values ('3', 'Alexander kevin', 'Espinoza Delgado', 09736456353, '136343648', 'Alexander19@gmail.com' );
insert into estudiante (idcarrera, nombre_estudiante, apellidos_estudiante, telefono_estudiante, cedula_estudiante, correo_estudiante)
values ('2', 'Karen Estefania', 'Santana Chavez', 09735435373, '134634363', 'Karen20@gmail.com' );
insert into estudiante (idcarrera, nombre_estudiante, apellidos_estudiante, telefono_estudiante, cedula_estudiante, correo_estudiante)
values ('4', 'Leidy Nicole', 'Ponce Delgado', 0973454373, '134232533', 'Leidy21@gmail.com' );


insert into asignatura (idnivel, descripcion_asignatura) values ('2', 'Algebra Lineal');
insert into asignatura (idnivel, descripcion_asignatura) values ('3', 'Redes y tecnologia');
insert into asignatura (idnivel, descripcion_asignatura) values ('1', 'Algoritmos');
insert into asignatura (idnivel, descripcion_asignatura) values ('3', 'Economia basica');


insert into inscripcion (idasignatura, idestudiante) values ('1', '1');
insert into inscripcion (idasignatura, idestudiante) values ('2', '1');
insert into inscripcion (idasignatura, idestudiante) values ('4', '4');
insert into inscripcion (idasignatura, idestudiante) values ('1', '4');


insert into carreradocente (iddocente, idcarrera) values ('1', '1');
insert into carreradocente (iddocente, idcarrera) values ('3', '1');
insert into carreradocente (iddocente, idcarrera) values ('4', '2');
insert into carreradocente (iddocente, idcarrera) values ('5', '2');

insert into impartirasignatura (iddocente, idasignatura) values ('1', '2');
insert into impartirasignatura (iddocente, idasignatura) values ('1', '3');
insert into impartirasignatura (iddocente, idasignatura) values ('4','4');
insert into impartirasignatura (iddocente, idasignatura) values ('4','1');
insert into impartirasignatura (iddocente, idasignatura) values ('2','3');
insert into impartirasignatura (iddocente, idasignatura) values ('4','2');
insert into impartirasignatura (iddocente, idasignatura) values ('3','3');



insert into tutoria (idestudiante,iddocente, fecha_tutoria, horario_tutoria,medio_tutoria, enlace_tutoria) 
values ('1', '2', '2020-12-21', '18:00:00','zoom', 'zomgdhgdhjk2537/25342638WH');
insert into tutoria (idestudiante,iddocente, fecha_tutoria, horario_tutoria,medio_tutoria, enlace_tutoria) 
values ('2', '3', '2020-12-19', '13:00:00','teams', 'teaomgdhgdhjeteg537/25342638WH');
insert into tutoria (idestudiante,iddocente, fecha_tutoria, horario_tutoria,medio_tutoria, enlace_tutoria) 
values ('1', '4', '2020-12-18', '10:00:00','skype', 'zomgdhgdhjk25reee25342638WH');


insert into detalle_tutoria (idtutoria, tema_tutoria, horario_fin, recomendaciones_tutoria) 
values ('1', 'Enrutamiento Dinamico', '19:00:00' ,'Leer los libros sobre enrutamiento colocados en el aula virtual');
insert into detalle_tutoria (idtutoria, tema_tutoria, horario_fin, recomendaciones_tutoria) 
values ('2', 'Los algoritmos en torno a la sociedad', '13:50:00' ,'Analizar los datos de nuestroe entorno en base a la abstraccion');
insert into detalle_tutoria (idtutoria, tema_tutoria, horario_fin, recomendaciones_tutoria) 
values ('3', 'La economia en los paises subdesarrollados', '13:50:00' ,'Investigar sobre los procesos economicos que manejan las potencias mundiales');









