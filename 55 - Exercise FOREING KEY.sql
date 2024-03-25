if object_id('clients') is not null
	drop table clients;

if object_id('provinces') is not null
	drop table provinces;

create table clients(
	code int identity,
	name varchar(30),
	address varchar(30),
	city varchar(20),
	province_code tinyint
);

create table provinces(
	code tinyint not null,
	name varchar(20)
);

go

/*alter table clients
	add constraint FK_client_province_code
	foreign key (province_code)
	references provinces(code);*/


alter table provinces
	add constraint PK_provinces_code
	primary key (code);


insert into provinces values(1,'Cordoba');
insert into provinces values(2,'Santa Fe');
insert into provinces values(3,'Misiones');
insert into provinces values(4,'Rio Negro');

insert into clients values('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clients values('Moreno Marcos','Colon 234','Rosario',2);
insert into clients values('Acosta Ana','Avellaneda 333','Posadas',3);
insert into clients values('Luisa Lopez','Juarez 555','La Plata',6);

delete from clients
	where province_code = 6;

alter table clients
	add constraint FK_client_province_code
	foreign key (province_code)
	references provinces(code);

--insert into clients values('Luisa Lopez','Juarez 555','La Plata',6);

-- delete from provinces where code = 3;

delete from provinces where code = 4;

/*update provinces set code = 7
	where code = 1;*/

exec sp_helpconstraint clients;

exec sp_helpconstraint provinces;