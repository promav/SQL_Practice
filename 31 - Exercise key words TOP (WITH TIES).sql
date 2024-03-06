if object_id('employees') is not null
	drop table employees;

create table employees(
	document char(8) not null,
	name varchar(30),
	mariage_status char(1), -- c=married, s=single, v =widower
	area varchar(20)
);

go

insert into employees
	values ('22222222','Alberto Lopez','c','Sistemas');
insert into employees
	values ('23333333','Beatriz Garcia','c','Administracion');
insert into employees
	values ('24444444','Carlos Fuentes','s','Administracion');
insert into employees
	values ('25555555','Daniel Garcia','s','Sistemas');
insert into employees
	values ('26666666','Ester Juarez','c','Sistemas');
insert into employees
	values ('27777777','Fabian Torres','s','Sistemas');
insert into employees
	values ('28888888','Gabriela Lopez',null,'Sistemas');
insert into employees
	values ('29999999','Hector Garcia',null,'Administracion');

select top 5 * from employees;

select top 4 name, area from employees
	order by area;

select top 4 with ties name, area from employees
	order by area;

select top 4 name, mariage_status, area from employees
	order by mariage_status, area;

select top 4 with ties name, mariage_status, area from employees
	order by mariage_status, area;