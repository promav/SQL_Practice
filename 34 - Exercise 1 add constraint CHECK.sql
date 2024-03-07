if object_id('employees') is not null
	drop table employees;

create table employees(
	document varchar(8),
	name varchar(30),
	birthdate datetime,
	childrennumber	tinyint,
	area varchar(20),
	salary decimal(6,2)
);

go

set dateformat 'ymd';

alter table employees
	add constraint CK_employees_positivesalary
	check (salary >= 0); 

insert into employees values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
insert into employees values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
insert into employees values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

delete from employees
	where salary = 6000;

alter table employees
	add constraint CK_employees_maximumsalary
	check (salary <= 5000); 

alter table employees
	add constraint CK_employees_birthdate
	check (birthdate < getdate());

alter table employees
	add constraint CK_employees_areatype
	check (area in ('Sistemas','Administracion','Contaduría'));

alter table employees
	add constraint CK_employees_numberchildren
	check (childrennumber between 0 and 15);

exec sp_helpconstraint employees;

--insert into employees values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',-1000);
--insert into employees values ('34444444','Carlos Caseres','2024/10/05',0,'Contaduría',4000);

/*update employees set childrennumber = 21
	where document = '22222222';*/

/*update employees set area = 'Seguros'
	where area = 'Sistemas';*/

/*alter table employees
	add constraint CK_employees_areatype_firstletter
	check (area like 'B%');*/