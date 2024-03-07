if object_id('vehicles') is not null
	drop table vehicles;

create table vehicles(
	plate char (6) not null,
	type char(1), -- 'c' = car, 'm' = motorbike 
	checkin_time datetime,
	checkout_time datetime
);

go

alter table vehicles
	add constraint DF_vehicles_type
	default 'c'
	for type;

insert into vehicles values ('BVB111', default, default, null);

select * from vehicles;

/*alter table vehicles
	add constraint DF_vehicles_type
	default 'm'
	for type;*/

alter table vehicles
	add constraint DF_vehicles_checkin_time
	default getdate()
	for checkin_time;

insert into vehicles values ('DGT159', default, default, null);

select * from vehicles;

exec sp_helpconstraint vehicles;