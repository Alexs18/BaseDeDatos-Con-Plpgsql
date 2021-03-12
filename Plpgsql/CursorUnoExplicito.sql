do $$
declare 
    Indicador integer;
    Contenedor record;
    Recorrido int = 0; 
  
        CursorTutoria cursor for select count (tutoria.iddocente) as Cantidad_Tutorias,docente.nombre_docente,
	   impartirasignatura.idasignatura,asignatura.descripcion_asignatura
		from tutoria 
		  inner join docente on tutoria.iddocente = docente.iddocente
		  inner join impartirasignatura on docente.iddocente = impartirasignatura.iddocente
		  inner join asignatura on impartirasignatura.idasignatura = asignatura.idasignatura
		   where docente.iddocente = tutoria.iddocente
	group by tutoria.iddocente,
	 docente.nombre_docente, 
	  impartirasignatura.idasignatura, 
	  asignatura.descripcion_asignatura
	having tutoria.iddocente= 2;
begin 
	Open CursorTutoria;
	Fetch CursorTutoria into Contenedor;
	while (found) loop 
	raise notice 'Cantidad Tutorias: %, 
		      Nombre Docente: %, 
		      Asignatura: % ',
		      Contenedor.Cantidad_Tutorias, Contenedor.nombre_docente , Contenedor.descripcion_asignatura;
	Fetch CursorTutoria into Contenedor;
	end loop;
	

end;
$$ language 'plpgsql'





