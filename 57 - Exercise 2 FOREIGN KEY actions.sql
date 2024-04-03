if OBJECT_ID('inscriptions') is not null
	drop table inscriptions;
if OBJECT_ID('sports') is not null
	drop table sports;
if OBJECT_ID('members') is not null
	drop table members;

create table sports(
	code tinyint,
	name varchar(20),
	primary key(code)
);

create table members(
	document char(8),
	name varchar(30),
	primary key (document)
);

create table inscriptions(
	document char(8),
	sportcode tinyint,
	tuition char(1), -- 'p' = payed, 'n' = non payed
	primary key(document, sportcode)
);

go

alter table inscriptions
	add constraint FK_inscriptions_sportcode
	foreign key (sportcode)
	references sports(code)
	on update cascade;

alter table inscriptions
	add constraint FK_inscriptions_document
	foreign key (document)
	references members(document)
	on delete cascade;

insert into sports values(1,'basquet');
insert into sports values(2,'futbol');
insert into sports values(3,'natacion');
insert into sports values(4,'tenis');

insert into members values('30000111','Juan Lopez');
insert into members values('31111222','Ana Garcia');
insert into members values('32222333','Mario Molina');
insert into members values('33333444','Julieta Herrero');

insert into inscriptions values ('30000111',1,'p');
insert into inscriptions values ('30000111',2,'p');
insert into inscriptions values ('31111222',1,'p');
insert into inscriptions values ('32222333',3,'n');

--insert into inscriptions values ('30000111',6,'p');

--insert into inscriptions values ('40111222',1,'p');

delete from sports where code = 4;
--delete from sports where code = 3;
update sports set code = 5 where code = 3;

select * from sports;
select * from inscriptions;

delete from members where name ='Juan Lopez';
select * from inscriptions;

--update members set document = '30111222' where document = '31111222';

--drop table sports;

exec sp_helpconstraint members;
exec sp_helpconstraint sports;
exec sp_helpconstraint inscriptions;