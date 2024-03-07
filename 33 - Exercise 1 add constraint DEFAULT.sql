if object_id('visitors') is not null
	drop table visitors;

create table visitors(
	number int identity,
	name varchar (30),
	age tinyint,
	address varchar(30),
	city varchar (20),
	spentmoney decimal (6,2) not null
);

go

alter table visitors
	add constraint DF_visitors_city
	default 'Cordoba'
	for city;

alter table visitors
	add constraint DF_visitors_spentmoney
	default 0
	for spentmoney;

insert into visitors
	values ('Susana Molina',35,'Colon 123',default,59.80);
insert into visitors (name,age,address)
	values ('Marcos Torres',29,'Carlos Paz');
insert into visitors
	values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

select * from visitors;

exec sp_helpconstraint visitors;

/*alter table visitors
	add constraint DF_visitors_city2
	default 'Buenos Aires'
	for city;*/

/*alter table visitors
	add constraint DF_visitors_number
	default 5
	for number;*/