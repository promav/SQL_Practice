if object_id('clientes') is not null
	drop table clientes;

create table clientes(
	documento char(8),
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

go 

insert into clientes(documento, apellido, nombre, domicilio, telefono)
	values('2233344','Perez','Juan','Sarmiento 980','4342345');

insert into clientes(documento, apellido, nombre, domicilio)
	values('2333344','Perez','Ana','Colon 234');

insert into clientes(documento, apellido, nombre, domicilio, telefono)
	values('2433344','Garcia','Luis','Avellaneda 1454','4558877');

insert into clientes
	values('2533344','Juarez','Ana','Urquiza 444','4789900');

select * from clientes
	where apellido = 'Perez';