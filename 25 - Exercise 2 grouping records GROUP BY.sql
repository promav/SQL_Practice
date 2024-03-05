if object_id('employees') is not null
	drop table employees;

create table employees(
	names varchar(30),
	document char(8),
	adress varchar(30),
	area varchar(20),
	salary decimal(6,2),
	childnumber tinyint,
	entry_date datetime,
	primary key (document)
);

go 

set dateformat 'ymd';

insert into employees
	values('Juan Perez','22333444','Colon 123', 'Gerencia',5000,2,'1980/5/10');
insert into employees
	values('Ana Acosta','23444555','Caseros 987', 'Secretaria',2000,0,'1980/10/12');
insert into employees
	values('Lucas Duarte','25666777','Sucre 235', 'Sistemas',4000,1,'1985/5/25');
insert into employees
	values('Pamela Gonzalez','26777888','Sarmiento 873', 'Secretaria',2200,3,'1990/6/25');
insert into employees
	values('Marcos Juarez','30000111','Rivadavia 801', 'Contaduria',3000,0,'1996/5/1');
insert into employees
	values('Yolanda Perez','35111222','Colon 180', 'Administracion',3200,1,'1996/5/1');
insert into employees
	values('Rodolfo Perez','35555888','Coronel Olmedo 588', 'Sistemas',4000,1,'1996/5/1');
insert into employees
	values('Martina Rodriguez','30141414','Sarmiento 1234', 'Administracion',3800,4,'2000/9/1');
insert into employees
	values('Andres Costa','28444555',default, 'Secretaria',null,null,null);

select area, count(*)
	from employees
	group by area;

select area, avg(childnumber)
	from employees
	group by area;

select datename(year,entry_date) as 'Entry Year', count(*)
	from employees
	group by datename(year, entry_date);

select area, avg(salary)
	from employees
	where childnumber > 0
	group by all area;

	select area, avg(salary)
	from employees
	where childnumber > 0
	group by area;