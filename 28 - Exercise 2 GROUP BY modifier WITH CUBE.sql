if OBJECT_ID('visitors') is not null
	drop table visitors;

create table visitors(
	names varchar(30),
	age tinyint,
	sex char(1),
	adress varchar(30),
	city varchar(20),
	mail varchar(30) default 'Not email',
	spentmoney decimal(6,2)
);

go

insert into visitors
	values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitors
	values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba',default,22.40);
insert into visitors
	values ('Alberto Garcia',35,'m',default,'Alta Gracia','albertogarcia@hotmail.com',25); 
insert into visitors
	values ('Teresa Garcia',33,'f',default,'Alta Gracia',default,120);
insert into visitors
	values ('Roberto Perez',45,'m',null,'Cordoba','robertoperez@xaxamail.com',33.20);
insert into visitors
	values ('Marina Torres',22,'f',null,'Villa Dolores',default,95);
insert into visitors
	values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','julietagomez@gmail.com',53.50);
insert into visitors
	values ('Roxana Lopez',20,'f','null','Alta Gracia',default,240);
insert into visitors
	values ('Liliana Garcia',50,'f','Paso 999','Cordoba',default,48);
insert into visitors
	values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select sex, city, sum(spentmoney) as 'Spent Money' from visitors
	group by sex, city with rollup;
	
select sex, city, sum(spentmoney) as 'Spent Money' from visitors
	group by sex, city with cube;

select sex, city, avg(age) as 'Age Average' from visitors
	where mail <> 'Not email' and mail is not null
	group by sex, city with rollup;
	
select sex, city, avg(age) as 'Age Average' from visitors
	where mail <> 'Not email' and mail is not null
	group by sex, city with cube;