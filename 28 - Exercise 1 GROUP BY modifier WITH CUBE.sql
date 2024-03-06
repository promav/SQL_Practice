if object_id('sales') is not null
	drop table sales;

create table sales(
	number int identity,
	spentmoney decimal(6,2),
	paymethod char(1), --c=cash, t = card
	vendor varchar(30),
	primary key (number)
);

go

 insert into sales
  values(100.50,'c','Marisa Perez');
 insert into sales
  values(200,'c','Marisa Perez');
 insert into sales
  values(50,'t','Juan Lopez');
 insert into sales
  values(220,'c','Juan Lopez');
 insert into sales
  values(150,'t','Marisa Perez');
 insert into sales
  values(550.80,'c','Marisa Perez');
 insert into sales
  values(300,'t','Juan Lopez');
 insert into sales
  values(25,'c','Marisa Perez');

select paymethod, vendor, count(*) from sales
group by paymethod, vendor with rollup;

select paymethod, vendor, count(*) from sales
group by paymethod, vendor with cube;