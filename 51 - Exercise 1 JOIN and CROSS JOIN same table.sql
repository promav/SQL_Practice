if object_id('clients') is not null
	drop table clients;

create table clients(
	name varchar(30),
	sex char(1),
	age int,
	address varchar(30)
);

go

insert into clients values('Maria Lopez','f',45,'Colon 123');
insert into clients values('Liliana Garcia','f',35,'Sucre 456');
insert into clients values('Susana Lopez','f',41,'Avellaneda 98');
insert into clients values('Juan Torres','m',44,'Sarmiento 755');
insert into clients values('Marcelo Oliva','m',56,'San Martin 874');
insert into clients values('Federico Pereyra','m',38,'Colon 234');
insert into clients values('Juan Garcia','m',50,'Peru 333');

select w.name, w.sex, m.name, m.sex from clients as w
	cross join clients as m
	where w.sex = 'f' and m.sex = 'm';

select w.name, w.sex, m.name, m.sex from clients as w
	join clients as m
	on w.name <> m.name
	where w.sex = 'f' and m.sex = 'm';

select w.name, w.sex, w.age,m.name, m.sex, m.age from clients as w
	cross join clients as m
	where (w.sex = 'f' and m.sex = 'm') and (w.age - m.age) between -5 and 5;