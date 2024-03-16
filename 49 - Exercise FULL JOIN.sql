if object_id('sports') is not null
	drop table sports;
if object_id('registered') is not null
	drop table registered;

create table sports(
	code tinyint identity,
	name varchar(30),
	teacher varchar(30),
	primary key (code)
);

create table registered(
	document char(8),
	sport_code tinyint not null,
	tuition char(1) -- 'p'= paid, 'n'=non paid
);

go

 insert into sports values('tenis','Marcelo Roca');
 insert into sports values('natacion','Marta Torres');
 insert into sports values('basquet','Luis Garcia');
 insert into sports values('futbol','Marcelo Roca');
 
 insert into registered values('22222222',3,'p');
 insert into registered values('23333333',3,'p');
 insert into registered values('24444444',3,'n');
 insert into registered values('22222222',2,'p');
 insert into registered values('23333333',2,'p');
 insert into registered values('22222222',4,'n'); 
 insert into registered values('22222222',5,'n');

 select r.document, r.tuition, s.name
	from registered as r
	join  sports as s
	on r.sport_code = s.code;

 select r.document, r.tuition, s.name
	from registered as r
	left join  sports as s
	on r.sport_code = s.code;

 select r.document, r.tuition, s.name
	from sports as s
	right join registered as r
	on s.code = r.sport_code;

 select r.document, r.tuition, s.name
	from registered as r
	right join  sports as s
	on r.sport_code = s.code
	where r.sport_code is null

select r.document, r.tuition, s.name
	from sports as s
	right join registered as r
	on s.code = r.sport_code
	where s.name is null;

 select r.document, r.tuition, s.name
	from sports as s
	full join registered as r
	on s.code = r.sport_code;