if OBJECT_ID('employees') is not null
	drop table employees;

create table employees(
	surname varchar(20),
	name varchar(20),
	address varchar(30),
	join_date datetime
);

alter table employees
	add salary decimal(5,2);

exec sp_columns employees;

alter table employees
	add code int identity;

--alter table employees
--	add document char(8) not null;

alter table employees
	add document char(8) not null default 00000000;

exec sp_columns employees;

alter table employees
	drop column salary;

exec sp_columns employees;

--alter table employees
--	drop column document;

alter table employees
	drop column code, join_date;

exec sp_columns employees;