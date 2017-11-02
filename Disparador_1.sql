--Disparadores de tipo DML(before)

create table Mayores(
id integer primary key,
nombre varchar2(60),
edad integer
);

--Generar un disparador que impida registrar usuarios menores de edad en la tabla mayores

create or replace trigger disp_mayores before insert on mayores
for each row -- es para garantizar que se dispare en cada fila si se ejecuta un cursor
begin

if :new.edad < 18 then
  raise_application_error(-20000, 'Edad incorrecta'); --esto es una excepción de Oracle
  end if;
end;
/

--Oracle se programó con puro disparador

insert into mayores values (1,'Juan',20);
insert into mayores values (2,'Ana',10);
select * from mayores;


create table Nomina(
id integer primary key,
sueldo_base float,
horas_laboradas integer,
deposito float
);

insert into nomina values(1,2000,20,28000);
insert into nomina values(2,1000,16,50000);
select * from nomina;

--Para cada trabajador se necesita actualizar su depósito de la siguiente manera:
--deposito=deposito+(horas_laboradas*sueldo_base)

--Las horas laboradas pueden variar pero no el sueldo base

create or replace trigger disp_nomina before update on nomina
for each row
begin
--iniciamos la lógica del disparador
:new.deposito := :old.deposito + :new.horas_laboradas * :old.sueldo_base;
end;
/

select * from nomina

--Probar que funciona para el update del registro cuyo id=1, considerar las horas laboradas=20

update Nomina set horas_laboradas=20 where id=1;