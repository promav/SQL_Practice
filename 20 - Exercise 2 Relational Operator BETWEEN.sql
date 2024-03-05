if object_id('cars') is not null
	drop table cars;

create table cars(
	plate char(6),
	brand varchar(20),
	model char(4),
	price decimal(8,2),
	primary key(plate)
);

insert into cars values('ACD123','Fiat 128','1970',15000);

insert into cars values('ACG234','Renault 11','1980',40000);

insert into cars values('BCD333','Renault 505','1990',80000);

insert into cars values('GCD123','Renault Clio','1995',70000);

insert into cars values('BCC333','Renault Megane','1998',95000);

insert into cars values('BVF543','Fiat 128','1975',20000);

select * from cars
	where model between '1970' and '1990'
	order by model;

select * from cars
	where price between 50000 and 100000;