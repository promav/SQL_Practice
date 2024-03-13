if OBJECT_ID('vehicles') is not null
	drop table vehicles;

if OBJECT_ID('RG_plate_pattern') is not null
	drop rule RG_plate_pattern;
	if OBJECT_ID('RG_vehicles_type') is not null
	drop rule RG_vehicles_type;
if OBJECT_ID('RG_vehicles_type2') is not null
	drop rule RG_vehicles_type2;

create table vehicles(
	plate char(6) not null,
	type char(1), -- 'c' = car, 'm' = motorbike
	checkin_time datetime not null,
	checkout_time datetime
);

go

create rule RG_plate_pattern
as @value like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';
go

exec sp_bindrule RG_plate_pattern, 'vehicles.plate';

--insert into vehicles values ('FGHIJK','c','1990-02-01 18:00',null);

go

create rule RG_vehicles_type
as @list in ('c','m');
go

exec sp_bindrule RG_vehicles_type, 'vehicles.type';

--insert into vehicles values('AAA111','a','2001-10-10 10:10',NULL);

go

create rule RG_vehicles_type2
as @list in ('a','c','m');
go

exec sp_bindrule RG_vehicles_type2, 'vehicles.type';

insert into vehicles values('AAA111','a','2001-10-10 10:10',NULL);

drop rule RG_vehicles_type;

--drop rule RG_plate_pattern;

exec sp_unbindrule 'vehicles.plate';

exec sp_helpconstraint vehicles;

exec sp_help;

drop rule RG_plate_pattern;

exec sp_help;