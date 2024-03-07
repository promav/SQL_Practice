if object_id('vehicles') is not null
	drop table vehicles;

create table vehicles(
	number int identity,
	plate char(6),
	type char(1),
	checkin_time datetime,
	checkout_time datetime
);

go

set dateformat 'ymd'

 insert into vehicles values('AIC124','c','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehicles values('CAA258','c','2007/01/17 8:10',null);
 insert into vehicles values('DSE367','m','2007/01/17 8:30','2007/01/17 18:00');

 alter table vehicles
	add constraint CK_vehicles_plate_3Letter_3Numbers
	check(plate like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--insert into vehicles values('AB1234','c',getdate(),null);

 alter table vehicles
	add constraint CK_vehicles_type_c_m
	check(type in ('c','m'));

/*update vehicles set type = 'b'
	where plate = 'AIC124';*/

alter table vehicles
	add constraint DF_vehicles_type_b
	default 'b'
	for type;

--insert into vehicles values('SDF134',default,null,null);

 alter table vehicles
	add constraint CK_vehicles_checkin_nonfuture
	check(checkin_time <= getdate());

alter table vehicles
	add constraint CK_vehicles_checkin_before_checkout
	check(checkin_time <= checkout_time);

--insert into vehicles values('DSE357','m','2024/10/17 8:30', null);

/*update vehicles set checkout_time = '2007/1/17 7:30'
	where plate = 'CAA258'*/

exec sp_helpconstraint vehicles;

alter table vehicles
	add constraint DF_vehicles_checkin_time
	default getdate()
	for checkin_time;

insert into vehicles values('DFR156','m',default,default);

select * from vehicles;

exec sp_helpconstraint vehicles;