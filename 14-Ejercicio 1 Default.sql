if object_id('visitantes') is not null
	drop table visitantes;

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)
);

go

exec sp_columns visitantes;

insert into visitantes(nombre, domicilio, montocompra)
	values ('Susana Molina','Colon 123',59.80);
insert into	visitantes(nombre,edad,ciudad,mail)
	values('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

select * from visitantes;

insert into visitantes
	values('Marta Perez',35,default,'Rio de la Plata 45',default,'95325499612',default,541.25);

insert into visitantes default values;

select * from visitantes;