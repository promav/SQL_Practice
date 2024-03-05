if object_id('visits') is not null
	drop table visits;

create table visits(
	number int identity,
	names varchar(30) default 'Anonymous',
	mail varchar(50),
	country varchar(20),
	dates datetime,
	primary key(number)
);

go

set dateformat 'ymd';

insert into visits(names,mail,country,dates)
	values('Ana Maria Lopez','anamaria@hotmail.com','Argentina','2006-10-10 10:10');

insert into visits(names,mail,country,dates)
	values('Gustavo Gonzalez','gustavoggonzalez@hotmail.com','Chile','2006-10-10 21:30');

insert into visits(names,mail,country,dates)
	values('Juancito','juanjoseperez@hotmail.com','Argentina','2006-10-11 15:45');

insert into visits(names,mail,country,dates)
	values('Fabiola Martinez','martinezfabiola@hotmail.com','Mexico','2006-10-12 08:15');
	
insert into visits(names,mail,country,dates)
	values('Fabiola Martinez','martinezfabiola@hotmail.com','Mexico','2006-09-12 20:45');
	
insert into visits(names,mail,country,dates)
	values('Juancito','juanjoseperez@hotmail.com','Argentina','2006-09-12 16:20');
	
insert into visits(names,mail,country,dates)
	values('Juancito','juanjoseperez@hotmail.com','Argentina','2006-09-15 16:25');

select * from visits
	order by dates desc;

select names, country, datename(month,dates) as 'month name' from visits
	order by country asc, 'month name' desc;

select country, datename(month,dates) as 'month', datename(day,dates) as 'day',
datename(HOUR,dates)+':'+datename(minute,dates) as 'hour' from visits
	order by 'month', 'day','hour';

select mail, country from visits
where datename(month, dates) = 'Octubre' order by country;
