if OBJECT_ID('peliculas') is not null
	drop table peliculas;

create table peliculas(
	codigo int identity (50,3),
	titulo varchar (40),
	actor varchar (20),
	duracion int
);

insert into peliculas(titulo, actor, duracion)
	values('Mision Imposible', 'Tom Cruise', 120);

insert into peliculas(titulo, actor, duracion)
	values('Harry Potter y la piedra filosofal', 'Daniel R.', 180);

insert into peliculas(titulo, actor, duracion)
	values('Harry Potter y la camara secreta', 'Daniel R.', 190);

select * from peliculas;

set identity_insert peliculas on;

insert into peliculas(codigo, titulo, actor, duracion)
	values(40, 'Mision Imposible 2', 'Tom Cruise', 120);

select * from peliculas;

select IDENT_SEED('peliculas');

select IDENT_INCR('peliculas');

set identity_insert peliculas off;

insert into peliculas(titulo, actor, duracion)
	values('Mision Imposible 3', 'Tom Cruise', 140);

select * from peliculas;

