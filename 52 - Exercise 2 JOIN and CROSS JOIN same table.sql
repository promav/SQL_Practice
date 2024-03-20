if object_id('teams') is not null
	drop table teams;

create table teams(
	name varchar(30),
	district varchar(20),
	address varchar(30),
	coach varchar(30)
);

go

insert into teams values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into teams values('Los leones','Centro','Colon 123','Gustavo Fuentes');
insert into teams values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into teams values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

select l.name as local, v.name as visitor from teams as l
	cross join teams as v
	where l.name <> v.name;

select l.name as local, v.name as visitor from teams as l
	join teams as v
	on l.name <> v.name;

select l.name as local, v.name as visitor from teams as l
	cross join teams as v
	where l.name > v.name;