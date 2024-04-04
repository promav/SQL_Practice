if OBJECT_ID('employees') is not null
	drop table employees;

create table employees(
	filename int not null,
	document char(7) not null,
	name varchar(10),
	address varchar(30),
	city varchar(20) default 'Buenos Aires',
	salary decimal(6,2),
	childsnumber tinyint default 0,
	primary key(filename)
);

alter table employees
	alter column name varchar(30);

exec sp_columns employees;

alter table employees
	alter column salary decimal(6,2) not null;

alter table employees
	alter column document char(8);

--alter table employees
--	alter column filename tinyint;

insert into employees values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
insert into employees values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

--alter table employees
--	alter column name varchar(30) not null;

delete from employees
	where name is null;

alter table employees
	alter column name varchar(30) not null;

alter table employees
	alter column city varchar(10);

--insert into employees values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

--alter table employees
--	alter column filename int identity;
