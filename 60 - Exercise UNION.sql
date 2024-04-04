if OBJECT_ID('clients') is not null
	drop table clients;
if OBJECT_ID('suppliers') is not null
	drop table suppliers;
if OBJECT_ID('employees') is not null
	drop table employees;

create table suppliers(
	code int identity,
	name varchar(30),
	address varchar(30),
	primary key (code)
);

create table clients(
	code int identity,
	name varchar(30),
	address varchar(30),
	primary key (code)
);

create table employees(
	document char(8) not null,
	name varchar(20),
	surname varchar(20),
	address varchar(30),
	primary key (document)
);

go

insert into suppliers values('Bebida cola','Colon 123');
insert into suppliers values('Carnes Unica','Caseros 222');
insert into suppliers values('Lacteos Blanca','San Martin 987');
insert into clients values('Supermercado Lopez','Avellaneda 34');
insert into clients values('Almacen Anita','Colon 987');
insert into clients values('Garcia Juan','Sucre 345');
insert into employees values('23333333','Federico','Lopez','Colon 987');
insert into employees values('28888888','Ana','Marquez','Sucre 333');
insert into employees values('30111111','Luis','Perez','Caseros 956');

select name, address from suppliers
	union
select name, address from clients
	union
select surname +space(1)+ name, address from employees



select name, address, 'supplier' as category from suppliers
	union
select name, address, 'client' from clients
	union
select surname +space(1)+ name, address, 'employee' from employees
order by category;
