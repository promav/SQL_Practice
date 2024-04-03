if OBJECT_ID('registered') is not null
	drop table registered;
if OBJECT_ID('members') is not null
	drop table members;
if OBJECT_ID('teachers') is not null
	drop table teachers;
if OBJECT_ID('sports') is not null
	drop table sports;

create table teachers(
	document char(8) not null,
	name varchar(30),
	address varchar(30),
	constraint CK_teachers_document_pattern 
		check (document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint PK_teachers_document
		primary key(document)
);

create table sports(
	code tinyint identity,
	name varchar(20) not null,
	day varchar(30),
	--constraint DF_sports_days default('Saturday'),
	teacher char(8),
	constraint CK_sports_day_list 
		check (day in ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')),
	constraint PK_sports_code
		primary key(code)
);

create table members(
	number int identity,
	document char(8),
	name varchar(30),
	address varchar(30),
	constraint CK_members_document_pattern 
		check (document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint PK_members_number
		primary key(number),
	constraint UQ_members_document
		unique clustered (document)
);

create table registered(
	membernumber int not null,
	sportcode tinyint,
	tuittion char(1),
	constraint PK_registered_numbersport
		primary key clustered(membernumber, sportcode),
	constraint FK_registered_sport
		foreign key(sportcode)
		references sports(code)
		on update cascade,
	constraint FK_registered_members
		foreign key(membernumber)
		references members(number)
		on update cascade
		on delete cascade,
	constraint CK_tuittion check(tuittion in('p','n'))
);

go

insert into teachers values('21111111','Andres Acosta','Avellaneda 111');
insert into teachers values('22222222','Betina Bustos','Bulnes 222');
insert into teachers values('23333333','Carlos Caseros','Colon 333');

insert into sports values('basquet','Monday',null);
insert into sports values('futbol','Monday','23333333');
insert into sports values('natacion',null,'22222222');
insert into sports values('padle',default,'23333333');
insert into sports (name,day) values('tenis','Thursday');

insert into members values('30111111','Ana Acosta','America 111');
insert into members values('30222222','Bernardo Bueno','Bolivia 222');
insert into members values('30333333','Camila Conte','Caseros 333');
insert into members values('30444444','Daniel Duarte','Dinamarca 444');

insert into registered values(1,3,'p');
insert into registered values(1,5,'p');
insert into registered values(2,1,'p');
insert into registered values(4,1,'n');
insert into registered values(4,4,'p');


select m.*, s.name as sport, s.day, t.name as teacher
	from members as m
	join registered as r
	on number = r.membernumber
	join sports as s
	on s.code = r.membernumber
	left join teachers as t
	on s.teacher = t.document;

select m.*, s.name as sport, s.day, t.name as teacher
	from members as m
	full join registered as r
	on number = r.membernumber
	left join sports as s
	on s.code = r.membernumber
	left join teachers as t
	on s.teacher = t.document;

select t.*, s.name as sport, s.day
	from teachers as t
	left join sports as s
	on t.document = s.teacher;

select s.*, count(r.sportcode)
	from sports as s
	full join registered as r
 	on s.code = r.sportcode
	group by s.code, s.name, s.day, s.teacher;

exec sp_helpconstraint members;

exec sp_helpconstraint sports;

exec sp_helpconstraint teachers;

exec sp_helpconstraint registered;