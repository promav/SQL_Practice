if OBJECT_ID('alumnos') is not null
	drop table alumnos;

create table alumnos(
	apellido varchar(30),
	nombre varchar(30),
	documento char (8),
	domicilio varchar(30),
	fechaingreso datetime,
	fechanacimiento datetime
);

go

set dateformat 'dmy';

insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
	values('Gonzalez', 'Ana', '22222222', 'Colon 123','10-08-1990','15/02/1972');

insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
	values('Juarez', 'Bernardo', '25555555', 'Sucre 456','3-3-91','15/02/1972');

insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
	values('Perez', 'Laura', '26666666', 'Bulnes 345','3-3-91', null);

--insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
--	values('Lopez', 'Carlos', '27777777', 'Sarmiento 1254','3-15-90',null);

select * from alumnos
	where fechaingreso < '1-1-91';

select * from alumnos
	where fechanacimiento is null;

-- insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
--	values('Rosas', 'Romina', '28888888', 'Avellaneda 487','03151990',null);

set dateformat 'mdy';

insert into alumnos(apellido, nombre,documento, domicilio, fechaingreso, fechanacimiento)
	values('Lopez', 'Carlos', '27777777', 'Sarmiento 1254','3-15-90',null);
	
select * from alumnos;