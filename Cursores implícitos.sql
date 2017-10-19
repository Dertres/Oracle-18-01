--creamos la siguiente tabla
create table Cartera_clientes(
id integer primary key,
nombre varchar2 (20),
edad integer,
sueldo_base float
);

--insertamos datos
insert into cartera_clientes values (1,'Juan',24,60000);
insert into cartera_clientes values (2,'Ana',45,40000);
insert into cartera_clientes values (3,'Pedro',34,10000);
insert into cartera_clientes values (4,'Irma',42,20000);
insert into cartera_clientes values (5,'Luis',29,15000);

select * from cartera_clientes;

 set serveroutput on;--para poder ver las lineas d eimpresión
 
 --inicio del cursor implícito
 
declare
sueldo float;
pago_nomina float;
begin
--declaramos el cursor implícito
select sueldo_base into sueldo from cartera_clientes where id=3;
pago_nomina:=sueldo*20;
dbms_output.put_line('El pago es de $'||pago_nomina);

end;
/


create table nominas(
id_nomina integer primary key,
nombre varchar2(60)
);

--Creamos la tabla

create table N_ominas(
id_nomina integer primary key,
nombre varchar2(60)
);

--Crear una secuencia
create sequence sec_nominas
start with 1
increment by 2
nomaxvalue;

--Crear el SP de inserción

create or replace procedure guardar_nomina(my_id out integer, my_nombre in varchar2)
as
begin
select sec_nominas.nextval into my_id from dual;
insert into N_ominas values(my_id,my_nombre);
end;
/

--Finalmente, vamos a probar el SP con un bloque PL-SQL
declare
valor integer;
begin
guardar_nomina(valor,'Juan');
dbms_output.put_line('El PK generado es de: '||valor);
end;
/
select * from N_ominas;
