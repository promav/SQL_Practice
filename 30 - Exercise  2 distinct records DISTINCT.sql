if object_id('estate') is not null
	drop table estate;

create table estate(
	document varchar(8) not null,
	surname varchar (30),
	name varchar(30),
	address varchar(20),
	district varchar(20),
	city varchar(20),
	type char(1), -- b = built, n = no built
	area decimal(8,2)
);

go

insert into estate
	values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','b',100);
insert into estate
	values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','b',200);
insert into estate
	values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','b',250);
insert into estate
	values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','n',200);
insert into estate
	values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','n',300);
insert into estate
	values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','n',200);
insert into estate
	values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','b',500);
insert into estate
	values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','b',350);
insert into estate
	values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','b',150);

select distinct surname from estate;

select distinct document from estate;

select count(distinct document) from estate
	where city = 'Cordoba';

select count (distinct city) from estate
	where address like 'San Martin%';

select distinct name, surname from estate;

select document, count(distinct district) from estate
	group by document;