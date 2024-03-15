if object_id('students') is not null
	drop table students;

create table students(
	filename char(5) not null,
	document char(8) not null,
	surname varchar(30),
	name varchar(30),
	final_note decimal (4,2)
);

create nonclustered index I_students_surname
	on students(surname);

alter table students
	add constraint PK_student_filename
	primary key clustered (filename);

exec sp_helpindex students;

-- drop index PK_student_filename;

-- drop index I_students_surname;

drop index students.I_students_surname;

exec sp_helpindex students;

if exists (select name from sysindexes
			where name = 'I_students_surname')
	drop index students.I_students_surname;

alter table students
	drop constraint PK_student_filename;

exec sp_helpindex students;