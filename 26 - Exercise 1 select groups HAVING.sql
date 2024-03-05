if object_id('clients') is not null
	drop table clients;

create table clients(
	code int identity,
	names varchar(30) not null,
	adress varchar(30),
	city varchar(20),
	region varchar(20),
	phone varchar(11),
	primary key (code)
);

insert into clients
	values('Lopez Marcos','Colon 111','Cordoba','Cordoba',null);
insert into clients
	values('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
insert into clients
	values('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
insert into clients
	values('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
insert into clients
	values('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
insert into clients
	values('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
insert into clients
	values('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
insert into clients
	values('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
insert into clients
	values('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
insert into clients
	values('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

select city, region, count(*)
	from clients
	group by city, region;

select city, region, count(*)
	from clients
	group by city, region
	having count(*) >= 2;

select region,city, count(*)
	from clients
	where adress like '%San Martin%'
	group by all region, city
	having count(*) < 2 and city <> 'Cordoba';