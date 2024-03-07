if object_id('RVD') is not null
	drop table RVD;

create table RVD(
	number tinyint identity,
	plate char(6),
	brand varchar (15),
	model char (4)
);

insert into RVD values('ABC123','Renault 12','1990');
insert into RVD values('DEF456','Fiat Duna','1995');

/*alter table RVD
	add constraint PK_RVD_plate
	primary key (plate);*/

alter table RVD
	add constraint PK_RVD_number
	primary key (number);

exec sp_helpconstraint RVD;

