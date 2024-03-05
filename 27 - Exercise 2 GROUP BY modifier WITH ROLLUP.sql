if object_id('grades') is not null
	drop table grades;

create table grades(
	document char(8) not null,
	subjects varchar(30),
	points decimal(4,2)
);

go 

insert into grades values ('22333444','Programacion',8);
insert into grades values ('22333444','Programacion',9);
insert into grades values ('22333444','Ingles',8);
insert into grades values ('22333444','Ingles',7);
insert into grades values ('22333444','Ingles',6);
insert into grades values ('22333444','Sistemas de datos',10);
insert into grades values ('22333444','Sistemas de datos',9);
insert into grades values ('23444555','Programacion',5);
insert into grades values ('23444555','Programacion',4);
insert into grades values ('23444555','Programacion',3);
insert into grades values ('23444555','Ingles',9);
insert into grades values ('23444555','Ingles',7);
insert into grades values ('23444555','Sistemas de datos',9);
insert into grades values ('24555666','Programacion',1);
insert into grades values ('24555666','Programacion',3.5);
insert into grades values ('24555666','Ingles',4.5);
insert into grades values ('24555666','Sistemas de datos',6);

select document, subjects, avg(points)
	from grades
	group by document, subjects with rollup;

select document, avg(points)
	from grades
	group by document with rollup;

select document, subjects, count(points)
	from grades
	group by document, subjects;

select document, subjects, count(points)
	from grades
	group by document, subjects with rollup;

select document, max(points) as maximum, min(points) as minimum 
	from grades
	group by document with rollup;