if object_id('employees') is not null
	drop table employees;

create table employees(
	document char(8) not null,
	name varchar(30),
	sex char (1),
	marital_status char(1), -- m = married, s = single, w = widower
	area varchar(20),
	primary key (document)
);

go

insert into employees
	values ('22222222','Alberto Lopez','m','c','Sistemas');
insert into employees
	values ('23333333','Beatriz Garcia','f','c','Administracion');
insert into employees
	values ('24444444','Carlos Fuentes','m','s','Administracion');
insert into employees
	values ('25555555','Daniel Garcia','m','s','Sistemas');
insert into employees
	values ('26666666','Ester Juarez',null,'c','Sistemas');
insert into employees
	values ('27777777','Fabian Torres',null,'s','Sistemas');
insert into employees
	values ('28888888','Gabriela Lopez','f',null,'Sistemas');
insert into employees
	values ('29999999','Hector Garcia','m',null,'Administracion');

select * from employees;

select sex, marital_status, count(*) as 'Number of employees',
	grouping(sex) as resume_sex, grouping(marital_status) as resume_status
	from employees
	group by sex, marital_status with rollup;

select sex, marital_status, count(*) as 'Number of employees',
	grouping(sex) as resume_sex, grouping(marital_status) as resume_status
	from employees
	group by sex, marital_status with cube;