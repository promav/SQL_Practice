if object_id('libros') is not null
	drop table libros;

create table libros(
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(20) default 'Desconocido',
	editorial varchar(20),
	precio decimal(6,2),
	cantidad tinyint default 0,
	primary key(codigo)
);

go

insert into libros(titulo,autor,editorial,precio)
	values('El aleph','Borges','Emece',25);

insert into libros
	values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);

insert into libros(titulo,autor,editorial,precio,cantidad)
	values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

select * ,precio*cantidad as 'monto total' from libros;

select titulo, autor, precio, '10%' as descuento, precio*0.9 as 'precio final' from libros;

select titulo+' - '+autor as 'Titulo y autor' from libros;