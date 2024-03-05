if object_id('visits') is not null
	drop table visits;

create table visits(
	number int identity,
	names varchar(30) default 'Anonymous',
	mail varchar(50),
	country varchar(20),
	date_time datetime,
	primary key(number)
);

go

set dateformat 'ymd';

insert into visits (names,mail,country,date_time)
	values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visits (names,mail,country,date_time)
	values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
insert into visits (names,mail,country,date_time)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visits (names,mail,country,date_time)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visits (names,mail,country,date_time)
	values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visits (names,mail,country,date_time)
	values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
insert into visits (names,mail,country,date_time)
	values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
insert into visits (names,mail,country)
	values ('Federico1','federicogarcia@xaxamail.com','Argentina');

select * from visits
	where date_time between '2006-09-12' and '2006-10-11';

select * from visits
	where number between 2 and 5;