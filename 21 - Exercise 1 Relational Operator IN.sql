if OBJECT_ID('drugs') is not null
	drop table drugs;

create table drugs(
	code int identity,
	names varchar(20),
	laboratory varchar(20),
	price decimal (6,2),
	quantity tinyint,
	expire_date datetime not null,
	primary key(code)
);

go

set dateformat 'ymd';

insert into drugs
	values('Sertal','Roche',5.2,1,'2015/02/01');
	
insert into drugs
	values('Buscapina','Roche',4.10,3,'2016/03/01');
	
insert into drugs
	values('Amoxidal 500','Bayer',15.60,100,'2017/05/01');
	
insert into drugs
	values('Paracetamol','Bago',1.90,20,'2018/02/01');
	
insert into drugs
	values('Bayaspirina','Bayer',2.1,150,'2019/12/01');
	
insert into drugs
	values('Amoxidal jarabe','Bayer',5.10,250,'2020/10/01');

select * from drugs
	where laboratory in ('Bayer','Bago');

select * from drugs
	where quantity between 1 and 5;

	
select * from drugs
	where quantity in (1,2,3,4,5);