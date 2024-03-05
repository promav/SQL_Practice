if object_id('drugs') is not null
	drop table drugs;

create table drugs(
	code int identity,
	names varchar(20),
	laboratory varchar(20),
	price decimal(5,2),
	quantity tinyint,
	primary key (code)
);

go

insert into drugs values('Sertal','Roche',5.2,100);
insert into drugs values('Buscapina','Roche',4.10,200);
insert into drugs values('Amoxidal 500','Bayer',15.60,100);
insert into drugs values('Paracetamol 500','Bago',1.90,200);
insert into drugs values('Bayaspirina','Bayer',2.10,150);
insert into drugs values('Amoxidal jarabe','Bayer',5.10,250);

select code, names from drugs
	where laboratory = 'Roche' and price < 5;

select * from drugs
	where laboratory = 'Roche' or price < 5;

select * from drugs
	where not laboratory = 'Bayer' and quantity = 100;

select * from drugs
	where laboratory ='Bayer' and not quantity = 100;

delete from drugs
	where laboratory = 'Bayer' and price > 10;

select * from drugs;

update drugs set quantity = 200
	where laboratory ='Roche' and price > 5;

select * from drugs;

delete from drugs
	where laboratory = 'Bayer' or price < 3;

select * from drugs;
