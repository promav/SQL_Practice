if OBJECT_ID('peliculas') is not null
	drop table peliculas;

create table peliculas(
	codigo int not null,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion int
);

go

exec sp_columns peliculas;

insert into peliculas(codigo, titulo, actor, duracion)
	values(1,'Mision Imposible','Tom Cruise',120);

insert into peliculas(codigo, titulo, actor, duracion)
	values(2,'Harry Potter y la piedra filosofal',null,180);

insert into peliculas(codigo, titulo, actor, duracion)
	values(3,'Harry y la camara secreta','Daniel R.',null);

insert into peliculas(codigo, titulo, actor, duracion)
	values(0,'Mision Imposible 2','',150);

insert into peliculas(codigo, titulo, actor, duracion)
	values(4,'','L. Di Caprio',220);

insert into peliculas(codigo, titulo, actor, duracion)
	values(5,'Mujer bonita','R. Gere-J. Roberts',0);

select * from peliculas;

--insert into peliculas(codigo, titulo, actor, duracion)
	--values(null,'Mujer bonita','R. Gere-J. Roberts',190);

select * from peliculas
	where actor is null;

select * from peliculas
	where actor = '';

update peliculas set duracion = 120
	where duracion is null;

update peliculas set actor = 'Desconocido'
	where actor = '';

select * from peliculas;

delete from peliculas
	where titulo = '';

select * from peliculas;