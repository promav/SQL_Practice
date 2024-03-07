if object_id('employees') is not null
	drop table employees;

create table employees(
	document char(8) not null,
	name varchar(30),
	area varchar(20)
);

go

insert into employees
	values ('22222222','Alberto Lopez','Sistemas');
insert into employees
	values ('23333333','Beatriz Garcia','Administracion');
insert into employees
	values ('24333333','Carlos Fuentes','Administracion');

alter table employees
	add constraint PK_employees_document
	primary key(document);

/*update employees set document = '22222222'
	where name = 'Carlos Fuentes';*/

/*alter table employees
	add constraint PK_employees_name
	primary key(name);*/

alter table employees
	add constraint DF_employees_document
	default '00000000'
	for document;

insert into employees (name, area)
	values ('Carlos Lopez','Administracion');

select * from employees;

/*insert into employees (name, area)
	values ('Juan Lopez','Gerencia');*/

exec sp_helpconstraint employees;