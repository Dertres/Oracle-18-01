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

select * from almacen;
--delete from ALMACEN where NUMERO_ALMACEN =2


--11/10/17



--Generamos la tabla del vendedor
create table Vendedor(
numero_vendedor integer,
nombre_vendedor varchar2(60),
area_ventas varchar2(60),
constraint pk_nv primary key(numero_vendedor)
);

--describe vendedor

create table Cliente(
numero_cliente integer,
numero_almacen integer,
nombre_cliente varchar2(60),
constraint fk1_na foreign key(numero_almacen) references Almacen(numero_almacen),
constraint  pk_nc primary key(numero_cliente)
);

create table Ventas(
numero_ventas integer,
numero_cliente integer,
numero_vendedor integer,
monto_venta integer,
constraint pk_v primary key(numero_ventas),
constraint fk2_nc foreign key(numero_cliente) references Cliente(numero_cliente),
constraint fk3_nv foreign key(numero_vendedor) references Vendedor(numero_vendedor)
);

--describe ventas

