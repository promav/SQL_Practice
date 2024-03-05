if object_id('drugs') is not null
	drop table drugs;

create table drugs(
	code int identity,
	names varchar(20),
	laboratory varchar(20),
	price decimal(6,2),
	quantity tinyint,
	expire_date datetime not null,
	batch_number int default null,
	primary key (code)
);

go

set dateformat 'ymd';

insert into drugs
	values('Sertal','Roche',5.2,1,'2015/2/1',null);

insert into drugs
	values('Buscapina','Roche',4.1,3,'2016/3/1',null);

insert into drugs
	values('Amoxidal 500','Bayer',15.6,100,'2017/5/1',null);

insert into drugs
	values('Paracetamol 500','Bago',1.9,20,'2018/2/1',null);

insert into drugs
	values('Bayaspirina',null,2.1,null,'2019/12/1',null);

insert into drugs
	values('Amoxidal Jarabe','Bayer',null,250,'2019/12/15',null);

select count_big(*)
	from drugs;

select count_big(distinct laboratory)
	from drugs;

select count_big(price) as 'not null price', count_big(quantity) as 'not null quantity'
	from drugs;