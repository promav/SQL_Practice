if object_id('clients') is not null
	drop table clients;

create table clients(
	code int not null,
	name varchar(30),
	address varchar(30),
	city varchar(20),
	recommendedby int,
	primary key(code)
);

go

insert into clients values (50,'Juan Perez','Sucre 123','Cordoba',null);
insert into clients values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
insert into clients values(110,'Fabian Torres','San Martin 987','Cordoba',50);
insert into clients values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
insert into clients values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

/*alter table clients
	add constraint FK_clients_recommendedby
	foreign key (recommendedby)
	references clients (code);*/

update clients set recommendedby = 90 
	where recommendedby = 9;

alter table clients
	add constraint FK_clients_recommendedby
	foreign key (recommendedby)
	references clients(code);

exec sp_helpconstraint clients;

--insert into clients values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

/*update clients set recommendedby = 5 
	where recommendedby = 50;*/

update clients set recommendedby = 14 
	where recommendedby = 140;

delete from clients
	where recommendedby = 14;