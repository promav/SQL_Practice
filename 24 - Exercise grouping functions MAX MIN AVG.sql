if object_id('employees') is not null
	drop table employees;

create table employees(
	names varchar(30),
	document char(8),
	adress varchar(30),
	area varchar(20),
	salary decimal(6,2),
	childnumber tinyint,
	primary key(document)
);

go

insert into employees
	values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
insert into employees
	values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
insert into employees
	values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
insert into employees
	values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
insert into employees
	values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
insert into employees
	values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
insert into employees
	values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
insert into employees
	values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
insert into employees
	values('Andres Acosta','28444555',default,'Secretaria',null,null);

select count(*)
	from employees;

select count(salary)
	from employees
	where area = 'Secretaria';

select max(salary) as 'Maximum Salary', min(salary) as 'Minimum Salary'
	from employees;

select max(childnumber)
	from employees
	where names like '%Perez%';

select avg(salary)
	from employees;

select avg(salary)
	from employees
	where area = 'Secretaria';

select avg(childnumber)
	from employees
	where area = 'Sistemas';