if object_id ('registered') is not null
	drop table registered;
if object_id('not_attendance') is not null
	drop table not_attendance;

create table registered (
	name varchar(30),
	document char(8),
	sport varchar(15),
	tuition char(1), --'p' = paid, 'n' = non paid
	primary key (document, sport)
);

create table not_attendance(
	document char (8),
	sport varchar (15),
	date datetime
);

go

set dateformat 'ymd';

insert into registered values('Juan Perez','22222222','tennis','p');
insert into registered values('Maria Lopez','23333333','tennis','p');
insert into registered values('Agustin Juarez','24444444','tennis','n');
insert into registered values('Marta Garcia','25555555','swimming','p');
insert into registered values('Juan Perez','22222222','swimming','p');
insert into registered values('Maria Lopez','23333333','swimming','n');

insert into not_attendance values('22222222','tennis','2006-12-01');
insert into not_attendance values('22222222','tennis','2006-12-08');
insert into not_attendance values('23333333','tennis','2006-12-01');
insert into not_attendance values('24444444','tennis','2006-12-08');
insert into not_attendance values('22222222','swimming','2006-12-02');
insert into not_attendance values('23333333','swimming','2006-12-02');

select r.name, r.sport, n.date 
	from registered as r
	join not_attendance as n
	on r.document = n.document and r.sport = n.sport
	order by r.name, r.sport;

select r.name, r.sport, n.date 
	from registered as r
	join not_attendance as n
	on r.document = n.document and r.sport = n.sport
	where r.name = 'Juan Perez' and r.sport = 'tennis';

select r.name, r.sport, n.date 
	from registered as r
	join not_attendance as n
	on r.document = n.document and r.sport = n.sport
	where r.tuition = 'p';