--07/10/17

create table Almacen(
Numero_almacen integer,
Ubicacion_almacen varchar2(80),
constraint PK_Numero_almacen primary key(Numero_almacen)
--constraint | nombre de constraint | tipo de constraint(nombre de cmapo)
);

--Las constraint son restricciones

create or replace procedure Guardar_almacen(mi_id in integer, mi_ubicacion in varchar2)
as
begin
--Aquí viene la lógica del procedimiento
insert into almacen values(mi_id,mi_ubicacion);

end;
/


--Vamos a probar que funciona nuestro procedimiento

begin
guardar_almacen(1,'Plymouth');
end;
/

select * from almacen

