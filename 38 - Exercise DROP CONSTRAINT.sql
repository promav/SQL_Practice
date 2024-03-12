if object_id('vehicles') is not null
	drop table vehicles;

create table vehicles(
	plate char(6) not null,
	type char(1), -- 'c' = car, 'm' = motorbike
	checkin_time datetime not null,
	checkout_time datetime
);

go

set dateformat 'ymd';

alter table vehicles
	add constraint CK_vehicles_type
	check(type in ('c','m'));

alter table vehicles
	add constraint DF_vehicles_type
	default 'c'
	for type;

alter table vehicles
	add constraint CK_vehicles_type_distribution
	check(plate like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

alter table vehicles
	add constraint PK_vehicles
	primary key(plate, checkin_time);

insert into vehicles values('SDR456','c','2005/10/10 10:10',null);

-- insert into vehicles values('SDR456','m','2005/10/10 10:10',null);

insert into vehicles values('SDR111','c','2005/10/10 10:10',null);

exec sp_helpconstraint vehicles;

alter table vehicles
	drop constraint DF_vehicles_type;

exec sp_helpconstraint vehicles;

alter table vehicles
	drop constraint PK_vehicles, CK_vehicles_type;

exec sp_helpconstraint vehicles;