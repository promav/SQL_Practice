if object_id('clients') is not null
	drop table clients;
if OBJECT_ID('provinces') is not null
	drop table provinces;

create table clients(
	code int identity,
	name varchar(30),
	address varchar(30),
	city varchar(20),
	province_code tinyint,
	primary key (code)
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
insert into clients values('Acosta Ana','Avellaneda 333','Posadas',3);

alter table clients
	add constraint FK_clients_province_code
	foreign key (province_code)
	references provinces(code)
	on update cascade
	on delete no action;

--delete from provinces
--	where code = 3;

update provinces set code = 5
	where code = 3;

select * from provinces;
select * from clients;

/*alter table clients
	add constraint FK_clients_province_code
	foreign key (province_code)
	references provinces(code)
	on update cascade
	on delete cascade;*/

-- drop table provinces;