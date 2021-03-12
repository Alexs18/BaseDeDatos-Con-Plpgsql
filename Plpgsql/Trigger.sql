create or replace function TriggerActualizar() returns Trigger as
$Trigger$
declare 
	CursosCantidades cursor for select idsemana ,count(idsemana) as Valores from detalle_tutoria
		group by idsemana order by Valores desc; 
		ResultadoCantidades record;
      -- select max(idsemana) as fuergo, tema_tutoria from detalle_tutoria group by tema_tutoria

	CursorImplicito refcursor;
	ResultadoImplicito record;
		
begin
	Open CursosCantidades;
	fetch CursosCantidades into ResultadoCantidades;
	Open CursorImplicito for 
		select
		     max (ResultadoCantidades.Valores) as CantidadTotal,
		     ResultadoCantidades.idsemana as semanas
		from detalle_tutoria 
			inner join semana on 
			detalle_tutoria.idtutoria = semana.idsemana;
         fetch CursorImplicito into ResultadoImplicito;
	 raise notice 'La semana con mas tutorias es la semana: 
	 % y su cantidad es: % ',  
		 ResultadoImplicito.semanas, ResultadoImplicito.CantidadTotal;
		 update semana set comunicado = null;
		 if (TG_OP = 'INSERT' OR TG_OP = 'DELETE')
		 then
			update semana set comunicado = 'Esta es la semana con Mayor Tutorias' 
			where idsemana = ResultadoImplicito.semanas;
			 raise notice 'El trigger esta siendo ejecutado';
		end if;
	Close CursosCantidades;
	return new;

end;
$Trigger$ language 'plpgsql'
 
Create trigger TriggerActualizar after insert or delete on detalle_tutoria
for each row execute procedure TriggerActualizar();

insert into detalle_tutoria 
(iddetalle_tutoria, idtutoria, idsemana, tema_tutoria, horario_fin, recomendaciones_tutoria)
values
(11,3,2,'Estadistica y Probabilidad', '18:00:00', 'Nuevas variables numericas' );

select * from detalle_tutoria;
select * from semana;













