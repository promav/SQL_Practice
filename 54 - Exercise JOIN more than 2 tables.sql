if object_id('members') is not null
	drop table members;
if object_id('sports') is not null
	drop table sports;
if object_id('registered') is not null
	drop table registered;

create table members(
	document char(8) not null,
	name varchar(30),
	address varchar(30),
	primary key(document)
);

create table sports(
	code tinyint identity,
	name varchar(20),
	teacher varchar(15),
	primary key(code)
);

create table registered(
	document char(8) not null,
	sport_code tinyint not null,
	year char(4),
	tuition char(1), -- 'p' = paid, 'n'= not paid
	primary key(document,sport_code,year)
);

insert into members values('22222222','Ana Acosta','Avellaneda 111');
insert into members values('23333333','Betina Bustos','Bulnes 222');
insert into members values('24444444','Carlos Castro','Caseros 333');
insert into members values('25555555','Daniel Duarte','Dinamarca 44');

insert into sports values('basquet','Juan Juarez');
insert into sports values('futbol','Pedro Perez');
insert into sports values('natacion','Marina Morales');
insert into sports values('tenis','Marina Morales');

insert into registered values ('22222222',3,'2006','p');
insert into registered values ('23333333',3,'2006','p');
insert into registered values ('24444444',3,'2006','n');

insert into registered values ('22222222',3,'2005','p');
insert into registered values ('22222222',3,'2007','n');

insert into registered values ('24444444',1,'2006','p');
insert into registered values ('24444444',2,'2006','p');

insert into registered values ('26666666',0,'2006','p');

select m.name, s.name, r.year from registered as r
	join sports as s
	on r.sport_code = s.code
	join members as m
	on r.document = m.document;

select r.document, r.year, r.tuition, s.name, m.name 
from registered as r
	left join sports as s on r.sport_code = s.code
	left join members as m on r.document = m.document;

select r.document, m.name, s.name, r.year, r.tuition from registered as r
	join sports as s
	on r.sport_code = s.code
	join members as m
	on r.document = m.document
	where m.document = '22222222';