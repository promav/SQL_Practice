if object_id('cuentas') is not null
	drop table cuentas;

create table cuentas(
	numero int identity,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
);

go

-- insert into cuentas
--	values(1,'25666777','Juan Perez',2500.50);
	
insert into cuentas
	values('25666777','Juan Perez',2500.50);

insert into cuentas(documento,nombre)
	values('23666777','Manuel Rodriguez');

-- insert into cuentas(numero,documento,nombre,saldo)
--	values(5,'28999777','Luis Lopez',3400);
	
-- insert into cuentas(documento,nombre,saldo)
--	values(5,'28999777','Luis Lopez',3400);
	
-- insert into cuentas(nombre,saldo)
--	values('Luis Lopez',3400);

select * from cuentas;