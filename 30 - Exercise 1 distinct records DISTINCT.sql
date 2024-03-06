if object_id('clients') is not null
	drop table clients;

create table clients(
	code int identity,
	name varchar(30) not null,
	address varchar(30),
	city varchar(20),
	province varchar(20),
	primary key (code)
);

go

insert into clients
	values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clients
	values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clients
	values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clients
	values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clients
	values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clients
	values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clients
	values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clients
	values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clients
	values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clients
	values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

select distinct province from clients;

select count(distinct province) from clients;

select distinct city from clients;

select count(distinct city) from clients;

select distinct city from clients
	where province = 'Cordoba';
	
select province, count(distinct city) from clients
	group by province;