if object_id('clients') is not null
	drop table clients;

create table clients(
	code int identity,
	names varchar(30) not null,
	adress varchar(30),
	city varchar(20),
	region varchar(20),
	country varchar(20),
	primary key(code)
);

go 

insert into clients
	values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
insert into clients
	values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
insert into clients
	values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
insert into clients
	values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
insert into clients
	values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
insert into clients
	values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
insert into clients
	values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
insert into clients
	values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
insert into clients
	values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
insert into clients
	values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
insert into clients
	values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
insert into clients
	values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

select country, count(*)
	from clients
	group by country with rollup;

select country, region, count(*)
	from clients
	group by country, region with rollup;

select country, region, city, count(*)
	from clients
	group by country,region,city with rollup;