if object_id('peliculas') is not null
	drop table peliculas;

create table peliculas(
	codigo int identity,
	titulo varchar (40),
	actor varchar(20),
	duracion int,
	primary key (codigo)
);

go

exec sp_columns peliculas;

insert into peliculas(titulo,actor,duracion)
	values('Mision Imposible', 'Tom Cruise', 120);

insert into peliculas(titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal', 'Daniel R.', 180);

insert into peliculas(titulo,actor,duracion)
	values('Harry Potter y la camara secreta', 'Daniel R.', 190)

insert into peliculas(titulo,actor,duracion)
	values('Mision Imposible 2', 'Tom Cruise', 120);

insert into peliculas(titulo,actor,duracion)
	values('La vida es bella', 'zzz', 120);

select * from peliculas;

-- update peliculas set codigo = 5
--	where actor = 'zzz';

delete from peliculas
	where titulo = 'La vida es bella';

select * from peliculas;

insert into peliculas(titulo,actor,duracion)
	values('La vida es bella', 'Roberto Benigni', 120);

select * from peliculas;