if object_id('visitors') is not null
	drop table visitors;
if object_id('cities') is not null
	drop table cities;

create table visitors(
	name varchar (30),
	age tinyint,
	sex char(1),
	address varchar(30),
	city_code tinyint not null,
	mail varchar (30),
	spentmoney decimal(6,2)
);

create table cities(
	code tinyint identity,
	name varchar(20)
);

insert into cities values('Cordoba');
insert into cities values('Carlos Paz');
insert into cities values('La Falda');
insert into cities values('Cruz del Eje');

insert into visitors values('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
insert into visitors values('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
insert into visitors values('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
insert into visitors values('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
insert into visitors values('Alejandra Garcia',28,'f',null,2,null,280.50);
insert into visitors values('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
insert into visitors values('Mariana Juarez',33,'f',null,2,null,90)

select c.name, count(city_code) from visitors as v
	join cities as c
	on v.city_code = c.code
	group by c.name;

select c.name, v.sex, avg(v.spentmoney) from visitors as v
	join cities as c
	on v.city_code = c.code
	group by c.name, v.sex;

select c.name, count(v.mail) from visitors as v
	join cities as c
	on v.city_code = c.code
	group by c.name;

select c.name, max(spentmoney) from visitors as v
	join cities as c
	on v.city_code = c.code
	group by c.name;