if object_id('vehicles') is not null
	drop table vehicles;

if object_id ('RG_plate_pattern') is not null
	drop rule RG_plate_pattern;
if object_id ('RG_checkintime') is not null
	drop rule RG_checkintime;
if object_id ('RG_vehicles_type') is not null
	drop rule RG_vehicles_type;
if object_id ('RG_vehicles_type2') is not null
	drop rule RG_vehicles_type2;
if object_id ('RG_minor_nowdate') is not null
	drop rule RG_minor_nowdate;

create table vehicles(
	plate char (6) not null,
	type char(1), --'c' = car, 'm'=motorbike
	checkin_time datetime not null,
	checkout_time datetime
);

go

insert into vehicles values ('AAA111','c','1990-02-01 08:10',null);
insert into vehicles values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
insert into vehicles values ('BCD222','m','1990-02-01 12:00',null);
insert into vehicles values ('CC1234','c','1990-02-01 12:00',null);

go

CREATE RULE RG_plate_pattern
AS
@value like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';

go

CREATE RULE RG_vehicles_type
AS
@list in ('c','m');

go

Exec sp_bindrule RG_plate_pattern, '[vehicles].plate';

exec sp_help;
exec sp_helpconstraint vehicles;

select * from vehicles;

--insert into vehicles values ('BC1234','a','1990-02-01 12:00',null);

Exec sp_bindrule RG_vehicles_type, '[vehicles].type';

--update vehicles set type = 'a'
--	where plate = 'AAA111';

go

CREATE RULE RG_vehicles_type2
AS
@list in ('a','c','m');

go

Exec sp_bindrule RG_vehicles_type2, '[vehicles].type';

update vehicles set type = 'a'
	where plate = 'AAA111';

go

CREATE RULE RG_minor_nowdate
AS
@value <= getdate();

go

Exec sp_bindrule RG_minor_nowdate, '[vehicles].checkin_time';
Exec sp_bindrule RG_minor_nowdate, '[vehicles].checkout_time';

insert into vehicles values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

--alter table vehicles
--	add constraint CK_checkintime
--	check(checkin_time <= checkout_time);

delete from vehicles
where plate = 'NOP555';

alter table vehicles
	add constraint CK_checkintime
	check(checkin_time <= checkout_time);

alter table vehicles
	add constraint DF_vehicles_type
	default 'b'
	for type;

-- insert into vehicles values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');

exec sp_helpconstraint vehicles;