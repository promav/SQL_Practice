if object_id('students') is not null
	drop table students;

create table students(
	filename char(5) not null,
	document char(8) not null,
	surname varchar(30),
	name varchar(30),
	final_note decimal(4,2)
);

create nonclustered index I_students_surname
	on students(surname);

exec sp_helpindex students;

create nonclustered index I_students_surname
	on students(surname, name)
	with drop_existing;

exec sp_helpindex students;

alter table students
	add constraint UQ_students_document
	unique (document);

exec sp_helpindex students;

--create clustered index UQ_students_document
--	on students(document)
--	with drop_existing;

create nonclustered index I_students_filename
	on students(filename);

exec sp_helpindex students;

create clustered index I_students_filename
	on students(filename)
	with drop_existing;

exec sp_helpindex students;

--create nonclustered index I_students_filename
--	on students(filename)
--	with drop_existing;

create nonclustered index I_students_surname
	on students(surname)
	with drop_existing;

--create clustered index I_students_surname
--	on students(surname)
--	with drop_existing;

create unique clustered index I_students_filename
	on students(filename)
	with drop_existing;

exec sp_helpindex students;

create clustered index I_students_filename
	on students(filename)
	with drop_existing;

exec sp_helpindex students;