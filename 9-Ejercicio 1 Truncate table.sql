if OBJECT_ID('alumnos') is not null
	drop table alumnos;

create table alumnos(
	legajo int identity,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30)
);

go

insert into alumnos (documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

delete from alumnos;

insert into alumnos (documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;

truncate table alumnos;

insert into alumnos (documento,nombre,domicilio)
	values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
	values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
	values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
	values('25666777','Torres Ramiro','Dinamarca 209');

select * from alumnos;