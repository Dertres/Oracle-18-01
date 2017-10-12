create table Menores_edad(
id_menores integer,
nombre varchar2 (60),
edad integer,
constraint pk_id primary key(id_menores)
);

--describe menores_edad


create or replace procedure Generar_mil
as begin

--generamos los 1000

for i in 1..1000 loop
insert into menores_edad values(i,'Oscar Neri Fabián',21);
end loop;
end;
/

--ejecutando el SP

begin
generar_mil();
end;
/

select count(*) from menores_edad;


create or replace procedure Actualizart_edad(age in integer, id in integer)
as begin
if age < 18 then
raise_application_error(-20001,'No acepto edades menores de 18');
else
update menores_edad set edad=age where id_menores=id;
end if;
end;
/