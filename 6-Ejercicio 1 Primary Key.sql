if OBJECT_ID('libros') is not null
	drop table libros;

create table libros(
	codigo int not null,
	titulo varchar(40) not null,
	autor varchar(20),
	editorial varchar(15),
	primary key (codigo)
);

go

insert into libros(codigo, titulo, autor, editorial)
	values(1,'El aleph','Borges','Emece');

insert into libros(codigo, titulo, autor, editorial)
	values(2,'Martin Fierro','Jose Hernandez','Planeta');

insert into libros(codigo, titulo, autor, editorial)
	values(3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

select * from libros;

--insert into libros(codigo, titulo, autor, editorial)
	--values(1,'El retrato de Dorian Grey','Oscar Wilde','booket');

--insert into libros(codigo, titulo, autor, editorial)
	--values(null,'El retrato de Dorian Grey','Oscar Wilde','booket');

--update libros set codigo = 1
	--where titulo = 'Martin Fierro';