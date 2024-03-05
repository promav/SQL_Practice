if object_id('medicamentos') is not null
	drop table medicamentos;

create table medicamentos(
	codigo int identity(10,1),
	nombre varchar (20) not null,
	laboratorio varchar (20),
	precio float,
	cantidad int
);

go

insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,100);

select * from medicamentos;

set identity_insert medicamentos on;

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(11,'Ramipril 2.5mg','Acovil',2.5,100);

select * from medicamentos;

select ident_seed('medicamentos');

select IDENT_INCR('medicamentos');

set identity_insert medicamentos off;