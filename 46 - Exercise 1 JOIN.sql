if object_id('clients') is not null
	drop table clients;
if object_id('provinces') is not null
	drop table provinces;

create table clients(
	code int identity,
	name varchar (30),
	address varchar (30),
	city varchar (20),
	province_code tinyint not null,
	primary key (code)
);

create table provinces(
	code tinyint identity,
	name varchar (20),
	primary key (code)
);

go 

insert into provinces (name) values('Cordoba');
insert into provinces (name) values('Santa Fe');
insert into provinces (name) values('Corrientes');

insert into clients values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clients values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clients values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clients values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clients values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
insert into clients values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clients values ('Torres Fabiola','Alem 777','Ibera',3);

select c.name, address, city, p.name from clients as c
	join provinces as p
	on c.province_code = p.code;

select c.name, address, city, p.name from clients as c
	join provinces as p
	on c.province_code = p.code
	order by p.name;

select c.name, address, city, p.name from clients as c
	join provinces as p
	on c.province_code = p.code
	where p.name = 'Santa Fe';