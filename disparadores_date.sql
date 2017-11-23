--Ponemos primero el set server
set serveroutput on;

--Agregamos un PL SQL

declare
dia char(80);
fecha date;
begin
--inicializamos los campos con las funciones
fecha:=sysdate;--toma la fecha de la base de datos de Oracle
dia:=to_char(sysdate,'dd-month-yyyy');--sale la fecha completa
dia:=to_char(sysdate,'dd');--solo sale el día en número
dia:=to_char(sysdate,'day');--sale el dia en texto
dia:=to_char(sysdate,'ddd');--sale el día que va en el año (día n de 365)
dia:=to_char(sysdate,'month');--solo sale el mes
dia:=to_char(sysdate,'year');--sale el año en texto (twenty seventeen)
dia:=to_char(sysdate,'hh');--sale la hora
dia:=to_char(sysdate,'mi');--sale el minuto
dia:=to_char(sysdate,'ss');--sale el segundo
dbms_output.put_line('La fecha es: '||dia);

end;
/
--Ejercicio 1
--Generar la tabla usuario_tiempo

create table usuario_tiempo(
nombre varchar2(80),
edad integer
);

--Generar un disparador que impida que los usuarios se guarden el día miércoles

create or replace trigger disp_tiempo before insert on usuario_tiempo
for each row
begin
dbms_output.put_line('El dia es '||to_char(sysdate,'day'));
if to_char(sysdate,'day')='miércoles' then
--if upper(to_char(sysdate,'day'))=upper('miércoles') then      upper transforma a mayúsculas todo, en caso de errores.
  raise_application_error(-20000,'No puedes registrar hoy');
end if;
end;
/

insert into usuario_tiempo values('Juan',30);



--Ejercicio 2

create table usuario_checador(
nombre varchar2(80)
);

--Generar un disparador que impida guardar en los segundos del 11 al 59 de cada minuto
create or replace trigger disp_checador before insert on usuario_checador
for each row
begin
if to_char(sysdate,'ss')>11 then
raise_application_error(-20000,'No puedes registrarte ahora');
end if;

end;
/

insert into usuario_checador values('Juan');