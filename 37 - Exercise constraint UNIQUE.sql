if object_id('RVD') is not null
	drop table RVD;

create table RVD(
	number tinyint identity,
	plate char(6),
	brand varchar(15),
	model varchar(4)
);

go

insert into RVD values('ABC123','Renault clio','1990');
insert into RVD values('DEF456','Peugeot 504','1995');
insert into RVD values('DEF456','Fiat Duna','1998');
insert into RVD values('GHI789','Fiat Duna','1995');
insert into RVD values(null,'Fiat Duna','1995');

delete from RVD
where plate = 'DEF456' and model = '1998';

alter table RVD
	add constraint UQ_RVD_plate
	unique (plate);

-- insert into RVD values('DEF456','Fiat Duna','1998');

exec sp_helpconstraint RVD;
