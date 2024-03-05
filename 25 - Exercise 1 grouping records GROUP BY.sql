if object_id('visitors') is not null
	drop table visitors;

create table visitors(
	names varchar(30),
	age tinyint,
	sex char(1) default 'f',
	adress varchar(30),
	city varchar(20) default 'Cordoba',
	phone varchar(11),
	mail varchar(30) default 'no tiene',
	spentmoney decimal (6,2)	
);

go

insert into visitors
	values('Susana Molina', 35, default,'Colon 123', default, null, null, 59.80);
	
insert into visitors
	values('Marcos Torres', 29,'m', default,'Carlos Paz', default,'marcostorres@hotmail.com',150.50);
	
insert into visitors
	values('Mariana Juarez', 45, default,default, 'Carlos Paz', null, default, 23.90);
	
insert into visitors (names,age,sex,phone,mail)
	values('Fabian Perez', 36, 'm','4556677','fabianperez@xaxamail.com');
	
insert into visitors (names,city, spentmoney)
	values('Alejandra Gonzalez','La Falda', 280.50);
	
insert into visitors (names,age,sex,city,mail,spentmoney)
	values('Gaston Perez', 29, 'm','Carlos Paz', 'gastonperez1@gmail.com', 95.40);
	
insert into visitors
	values('Liliana Torres', 40, default,'Sarmiento 876', default, default, default, 85);
	
insert into visitors
	values('Gabriela Duarte', 21, null, null, 'Rio Tercero', default, 'gabrielaltorres@hotmail.com', 321.50);

select city, count(*)
	from visitors
	group by city;

select city, count(phone)
	from visitors
	group by city;

select sex, sum(spentmoney)
	from visitors
	group by sex;

select sex, city,
	max(spentmoney) as 'Maximum',
	min(spentmoney) as 'Minimum'
	from visitors
	group by sex, city;

select city, avg(spentmoney)
	from visitors
	group by city;

select city, count(mail)
	from visitors
	where mail <> 'no tiene' and
	mail is not null
	group by city;

select city, count(mail)
	from visitors
	where mail <> 'no tiene' and
	mail is not null
	group by all city;
