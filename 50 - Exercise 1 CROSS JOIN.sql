if object_id('women') is not null
	drop table women;
if object_id('men') is not null
	drop table men;

create table women(
	name varchar(30),
	address varchar(30),
	age int
);

create table men(
	name varchar(30),
	address varchar(30),
	age int
);

insert into women values('Maria Lopez','Colon 123',45);
insert into women values('Liliana Garcia','Sucre 456',35);
insert into women values('Susana Lopez','Avellaneda 98',41);

insert into men values('Juan Torres','Sarmiento 755',44);
insert into men values('Marcelo Oliva','San Martin 874',56);
insert into men values('Federico Pereyra','Colon 234',38);
insert into men values('Juan Garcia','Peru 333',50);

select w.name, m.name from women as w
cross join men as m;

select w.name, m.name from women as w
cross join men as m
where w.age > 40 and m.age > 40;

select w.name, w.age, m.name, m.age from women as w
cross join men as m
where w.age-m.age between -10 and 10;