if object_id('students') is not null
	drop table students;

create table students(
	filename char(5) not null,
	document char(8) not null,
	surname varchar(30),
	name varchar(30),
	final_note decimal (4,2)
);

go

insert into students values ('A123','22222222','Perez','Patricia',5.50);
insert into students values ('A234','23333333','Lopez','Ana',9);
insert into students values ('A345','24444444','Garcia','Carlos',8.5);
insert into students values ('A348','25555555','Perez','Daniela',7.85);
insert into students values ('A457','26666666','Perez','Fabian',3.2);
insert into students values ('A589','27777777','Gomez','Gaston',6.90);

--create unique clustered index I_students_surname
--on students(surname);

create clustered index I_students_surname
	on students(surname);

--create clustered index I_students_filename
--	on students(filename);

alter table students
	add constraint PK_students_filename
	primary key nonclustered (filename);

exec sp_helpindex students;

exec sp_helpconstraint students;

create unique nonclustered index I_students_document
	on students(document);
	
-- insert into students values ('A789','27777777','Romero','Federico',6.90);

exec sp_helpindex students;

create index I_students_name_surname
	on students(surname,name);

select name	from sysindexes
	where name like '%students%'

alter table students
	add constraint UQ_students_document
	unique (document);
	
exec sp_helpconstraint students;

exec sp_helpindex students;

select name from sysindexes
	where name like 'I_%';