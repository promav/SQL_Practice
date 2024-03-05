if object_id('employees') is not null
	drop table employees;

create table employees(
	names varchar(30),
	document char(8),
	adress varchar(30),
	entry_date datetime,
	area varchar(20),
	salary decimal(6,2),
	primary key (document)
);

go

set dateformat 'ymd';

insert into employees
	values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.5);
	
insert into employees
	values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.3);
	
insert into employees
	values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
	
insert into employees
	values('Pamela Gonzalez','26777888','Sarmiento 235','1999-02-12','Secretaria',550);
	
insert into employees
	values('Marcos Juarez','30000111','Rivadavia','2002-09-22','Contaduria',630.7);
	
insert into employees
	values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
	
insert into employees
	values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

select * from employees
	where names like '%Perez%';

select * from employees
	where adress like 'Co%8%';

select * from employees
	where document like '%[02468]';

select * from employees
	where document like '[^13]%' and names like '%ez';

select names from employees
	where names like '%[yj]%'

select names, area from employees
	where area like '[SG]_______';

select names, area from employees
	where area not like '[SG]%';

select names, salary from employees
	where salary not like '%.00';

select * from employees
	where datename(year,entry_date) = '1990';

select * from employees
	where entry_date like '%1990%';