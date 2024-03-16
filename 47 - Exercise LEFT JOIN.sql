if object_id('clients') is not null
	drop table clients;
if object_id('provinces') is not null
	drop table provinces;

create table clients(
	code int identity,
	name varchar(30),
	address varchar(30),
	city varchar(20),
	province_code tinyint not null,
	primary key(code)
);

create table provinces(
	code tinyint identity,
	name varchar(20),
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
insert into clients values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clients values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clients values ('Garcia Luis','Sucre 475','Santa Rosa',5);

select c.name, address, city, p.name from clients as c
	left join provinces as p
	on c.province_code = p.code;

select c.name, address, city, p.name from provinces as p
	left join clients as c
	on p.code = c.province_code;

select c.name, address, city, p.name from clients as c
	left join provinces as p
	on c.province_code = p.code
	where p.name is not null;

	select c.name, address, city, p.name from clients as c
	left join provinces as p
	on c.province_code = p.code
	where p.code is null
	order by c.name;

	select c.name, address, city, p.name from clients as c
	left join provinces as p
	on c.province_code = p.code
	where p.name = 'Cordoba';
