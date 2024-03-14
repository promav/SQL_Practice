if object_id('clients') is not null
	drop table clients;

if object_id('DF_filename_pattern') is not null
	drop default DF_filename_pattern;
if object_id('RG_filename_pattern') is not null
	drop rule RG_filename_pattern;
if object_id('RG_file') is not null
	drop rule RG_file;
if object_id('DF_unknown_data') is not null
	drop default DF_unknown_data;
if object_id('DF_now_date') is not null
	drop default DF_now_date;

create table clients(
	filename char(4),
	name varchar(30),
	address varchar(30),
	city varchar(15),
	province varchar(20) default 'Cordoba',
	checkin_time datetime
);

go
create default DF_filename_pattern
as 'AA00';
go

exec sp_bindefault DF_filename_pattern, 'clients.filename';

go
create default DF_unknown_data
as '??';
go

exec sp_bindefault DF_unknown_data, 'clients.address';
exec sp_bindefault DF_unknown_data, 'clients.city';

insert into clients values (default, 'Juan Pedro Jimenez', default, default,default, getdate());

select * from clients;

--exec sp_bindefault DF_unknown_data, 'clients.province';
go
create default DF_now_date
as getdate();
go

exec sp_bindefault DF_now_date, 'clients.checkin_time';

insert into clients values ('AB12',null,default,default,default,default);

select * from clients;

--exec sp_bindefault DF_unknown_data, 'clients.checkin_time';

go
create rule RG_filename_pattern
as @value like '[A-Z][A-Z][A-Z][0-9][0-9]';
go

exec sp_bindrule RG_filename_pattern, 'clients.filename';

--insert into clients values (default,null,default,default,default,default);