if object_id('movies') is not null
	drop table movies;

create table movies(
	code int identity,
	tittle varchar(40) not null,
	actor varchar(20),
	duration tinyint,
	primary key (code)
);

go

insert into movies values('Mission: Impossible','Tom Cruise', 120);

insert into movies values('Harry Potter and the Philosopher Stone','Daniel R.', null);

insert into movies values('Harry Potter and the Chamber of Secrets','Daniel R.', 190)

insert into movies values('Mission: Impossible 2','Tom Cruise', 120);

insert into movies values('Pretty Woman',null, 120);

insert into movies values('Tootsie','D.Hoffman', 90);

insert into movies (tittle) values('Un oso rojo');

select * from movies
	where actor is null;

update movies set duration = 0
	where duration is null;

select * from movies;

delete from movies
	where actor is null and duration = 0;

select * from movies;