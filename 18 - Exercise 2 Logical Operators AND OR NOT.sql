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

insert into movies values('Mission: Imposible', 'Tom Cruise',120);
insert into movies values('Harry Potter and the philosophers Stone', 'Daniel R.',180);
insert into movies values('Harry Potter and the Chamber of Secrets', 'Daniel R.',190);
insert into movies values('Mission: Imposible 2', 'Tom Cruise',120);
insert into movies values('Pretty Woman', 'Richard Gere',120);
insert into movies values('Tootsie', 'D.Hoffman',90);
insert into movies values('Un oso rojo', 'Julio Chavez',100);
insert into movies values('Elsa y Fred', 'China Zorrilla',110);

select * from movies 
	where actor ='Tom Cruise' or actor = 'Richard Gere';

select * from movies
	where actor = 'Tom Cruise' and duration < 100;

update movies set duration = 200
	where actor = 'Daniel R.' and duration = 180;

select * from movies;

delete from movies
	where not actor = 'Tom Cruise' and duration <= 100;

select * from movies;

