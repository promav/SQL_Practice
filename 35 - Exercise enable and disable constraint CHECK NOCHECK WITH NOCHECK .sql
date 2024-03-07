if object_id('employees') is not null
	drop table employees;

create table employees(
	document char(8),
	name varchar(30),
	area varchar(20),
	salary decimal(6,2)
);

go

insert into employees
	values ('22222222','Alberto Acosta','Sistemas',-10);
insert into employees
	values ('33333333','Beatriz Benitez','Recursos',3000);
insert into employees
	values ('34444444','Carlos Caseres','Contaduria',4000);

/*alter table employees
	add constraint CK_employees_not_negative_salary
	check(salary >= 0);*/

alter table employees
	with nocheck
	add constraint CK_employees_not_negative_salary
	check (salary >=0);

--insert into employees
--	values ('35555555','Daniel Duarte','Administracion',-2000);

alter table employees
	nocheck constraint CK_employees_not_negative_salary;

insert into employees
	values ('35555555','Daniel Duarte','Administracion',-2000);

/*alter table employees
	add constraint CK_employees_area_type
	check(area in ('Administracion','Sistemas','Contaduría'));*/

alter table employees
	with nocheck
	add constraint CK_employees_area_type
	check(area in ('Administracion','Sistemas','Contaduría'));

exec sp_helpconstraint employees;

alter table employees
	check constraint CK_employees_not_negative_salary;

--update employees set area = 'Recursos'
--	where name = 'Carlos Caseres';

alter table employees
	nocheck constraint CK_employees_area_type;

update employees set area = 'Recursos'
	where name = 'Carlos Caseres';

select * from employees;

exec sp_helpconstraint employees;