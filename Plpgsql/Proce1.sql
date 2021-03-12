CREATE OR REPLACE FUNCTION public.registrodetutoria(
    nombre character varying,
    indicador integer)
  RETURNS integer AS
$BODY$
declare 
	TotalTutorias integer:=(select count(iddetalle_tutoria) from detalle_tutoria);
	Valores integer;
Begin
	SELECT 
	      count (idsemana)
	      into Valores         
	FROM 
	      detalle_tutoria, 
	      tutoria, 
	      estudiante
	WHERE 
	        detalle_tutoria.idtutoria = tutoria.idtutoria AND
		estudiante.idestudiante = tutoria.idestudiante and 
		detalle_tutoria.idsemana = indicador and 
                estudiante.nombre_estudiante = Nombre;
        raise notice 'La cantidad de semanas para tutorias son 
        % y el estudiante asistio % en la semana %', TotalTutorias, Valores, indicador; 
        return Valores;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.registrodetutoria(character varying, integer)
  OWNER TO postgres;

select registrodeTutoria('Alexis Ricardo' ,1);