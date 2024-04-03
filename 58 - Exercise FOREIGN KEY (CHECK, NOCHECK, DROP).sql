if OBJECT_ID('clients') is not null
	drop table clients;
if OBJECT_ID('provinces') is not null
	drop table provinces;

create table clients(
	code int identity,
	name varchar(30),
	address varchar(30),
	city varchar(20),
	provincecode tinyint,
	primary key(code)
);

create table provinces(
	code tinyint,
	name varchar(20),
	primary key(code)
);

go

insert into provinces values(1,'Cordoba');
insert into provinces values(2,'Santa Fe');
insert into provinces values(3,'Misiones');
insert into provinces values(4,'Rio Negro');

insert into clients values('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clients values('Moreno Marcos','Colon 234','Rosario',2);
insert into clients values('Garcia Juan','Sucre 345','Cordoba',1);
insert into clients values('Lopez Susana','Caseros 998','Posadas',3);
insert into clients values('Marcelo Moreno','Peru 876','Viedma',4);
insert into clients values('Lopez Sergio','Avellaneda 333','La Plata',5);

/*alter table clients
	add constraint FK_clients_provincecode
	foreign key (provincecode)
	references provinces(code)
	on update cascade
	on delete cascade;*/

alter table clients
	with nocheck
	add constraint FK_clients_provincecode
	foreign key (provincecode)
	references provinces(code)
	on update cascade
	on delete cascade;

exec sp_helpconstraint clients;
exec sp_helpconstraint provinces;

alter table clients
	nocheck constraint FK_clients_provincecode;

exec sp_helpconstraint clients;
exec sp_helpconstraint provinces;

insert into clients values('Garcia Omar','San Martin 100','La Pampa',6);

delete from provinces where code = 2;

select * from clients;
select * from provinces;

update provinces set code = 9 where code =3;

select * from clients;
select * from provinces;

--drop table provinces;

alter table clients
	check constraint FK_clients_provincecode;

--insert into clients values('Hector Ludueña','Paso 123','La Plata',8);

update provinces set code = 20 where code =4;

select * from clients;
select * from provinces;

delete from provinces where code =1;

select * from clients;
select * from provinces;

alter table clients
	drop constraint FK_clients_provincecode;

exec sp_helpconstraint provinces;

drop table provinces;