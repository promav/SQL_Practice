if object_id('checkin_sport') is not null
	drop table checkin_sport;

create table checkin_sport(
	document char(8) not null,
	name varchar(30),
	sport varchar(15) not null,
	year datetime,
	enrollment char(1),
	primary key(document, sport, year)
);

insert into checkin_sport
	values ('12222222','Juan Perez','tenis','2005','s');
insert into checkin_sport
	values ('23333333','Marta Garcia','tenis','2005','s');
insert into checkin_sport
	values ('34444444','Luis Perez','tenis','2005','n');
insert into checkin_sport
	values ('12222222','Juan Perez','futbol','2005','s');
insert into checkin_sport
	values ('12222222','Juan Perez','natacion','2005','s');
insert into checkin_sport
	values ('12222222','Juan Perez','basquet','2005','n');
insert into checkin_sport
	values ('12222222','Juan Perez','tenis','2006','s');
insert into checkin_sport
	values ('12222222','Juan Perez','tenis','2007','s');

select * from checkin_sport;

--insert into checkin_sport
--	values ('12222222','Juan Perez','tenis','2005','s');

--update checkin_sport set year = '2005'
--	where year = '2007';

update checkin_sport set year = '2008'
	where year = '2007';

select * from checkin_sport;