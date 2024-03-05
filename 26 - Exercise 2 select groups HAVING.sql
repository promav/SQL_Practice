if object_id('visitors') is not null
	drop table visitors;

create table visitors(
	names varchar(30),
	age tinyint,
	sex char(1),
	adress varchar(30),
	city varchar(20),
	phone varchar(11),
	spentmoney decimal(6,2) not null
);

go

insert into visitors
	values('Susana Molina',28,'f',null,'Cordoba',null,45.50);
insert into visitors
	values('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitors
	values('Alberto Garcia',35,'m','Gral. Paz','Alta Gracia','03547123456',25);
insert into visitors
	values('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitors
	values('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitors
	values('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitors
	values('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitors
	values('Roxana Lopez',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitors
	values('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select city, sex, sum(spentmoney)
	from visitors
	group by city, sex
	having sum(spentmoney) > 50;

select city, sex, sum(spentmoney)
	from visitors
	where spentmoney > 50 and phone is not null
	group by all city, sex
	having city <> 'Cordoba'
	order by city;

select city, max(spentmoney)
	from visitors
	where sex = 'f' and adress is not null
	group by city
	having max(spentmoney) > 50;

select city, sex, count(*) as 'Visitors Number', 
	sum(spentmoney) as 'Spent Money', avg(spentmoney) as 'Average Spent Money'
	from visitors
	group by city, sex
	having avg(spentmoney) > 30
	order by sum(spentmoney);