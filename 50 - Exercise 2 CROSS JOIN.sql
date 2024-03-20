if object_id('guards') is not null
	drop table guards;
if object_id('tasks') is not null
	drop table tasks;

create table guards(
	document char(8),
	name varchar(30),
	sex char(1),
	address varchar(30),
	primary key (document)
);

create table tasks(
	code tinyint identity,
	address varchar(30),
	description varchar(30),
	time char(2), --'AM', 'PM'
	primary key (code)
);

insert into guards values('22333444','Juan Perez','m','Colon 123');
insert into guards values('24333444','Alberto Torres','m','San Martin 567');
insert into guards values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guards values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guards values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tasks values('Colon 1111','vigilancia exterior','AM');
insert into tasks values('Urquiza 234','vigilancia exterior','PM');
insert into tasks values('Peru 345','vigilancia interior','AM');
insert into tasks values('Avellaneda 890','vigilancia interior','PM');

select g.name, t.address, t.description from guards as g
	cross join tasks as t;

select g.name, t.address, t.description from guards as g
	cross join tasks as t
	where(g.sex = 'm' and t.description = 'vigilancia exterior')
	or (g.sex = 'f' and t.description = 'vigilancia interior');