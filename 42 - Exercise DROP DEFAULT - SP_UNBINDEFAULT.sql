if object_id('books') is not null
	drop table books;

if object_id('DF_zero') is not null
	drop default DF_zero;
if object_id('DF_unknown') is not null
	drop default DF_unknown;
if object_id('RG_positive') is not null
	drop rule RG_positive;

create table books(
	code int identity,
	tittle varchar(40) not null,
	author varchar(30),
	editorial varchar(20),
	price decimal(5,2),
	quantity smallint
);

go
create rule RG_positive
as @value >= 0;
go

exec sp_bindrule RG_positive, 'books.price';
exec sp_bindrule RG_positive, 'books.quantity';

go
create default DF_zero
as 0;
go

exec sp_bindefault DF_zero, 'books.price';
exec sp_bindefault DF_zero, 'books.quantity';

go
create default DF_unknown
as 'Unknown';
go

exec sp_bindefault DF_unknown, 'books.author';
exec sp_bindefault DF_unknown, 'books.editorial';

exec sp_help;

exec sp_helpconstraint books;

insert into books (tittle) values ('El principito');

select * from books;

exec sp_unbindefault 'books.price';

insert into books (tittle) values ('El señor de los anillos');

select * from books;

exec sp_helpconstraint books;

exec sp_help;

-- drop default DF_zero;

exec sp_unbindefault 'books.quantity';

exec sp_helpconstraint books;

exec sp_help;

drop default DF_zero;

exec sp_help;
