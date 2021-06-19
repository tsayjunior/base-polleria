use bdhotel;
insert into hotel values ('1', 'calle rene moreno', 'italia');

insert into hotelTel values ('1', '77056981');
insert into hotelTel values ('1', '77551395');
insert into hotelTel values ('1', '99871354');

insert into tipoHabitacion values ('1','80', 'simple');
insert into tipoHabitacion (precio, descripcion) values ('100', 'doble');
insert into tipoHabitacion values ('3', '100' , 'matrimonial');


insert into Habitaciones values ('1', '1' , '1', '1', '0');
insert into Habitaciones values ('2', '1' , '1', '2', '0');
insert into Habitaciones values ('3', '1' , '2', '3', '0');
insert into Habitaciones values ('4', '1' , '2', '4', '0');
insert into Habitaciones values ('5', '1' , '2', '5', '0');
insert into Habitaciones values ('6', '1' , '3', '6', '0');
 -- clientes
insert into Persona values ('1', '1' , 'juan', 'sanchez', 'heredia', '1132356', 'bolivia', 'kilometro 6', 'M', '1995/12/09');
insert into Persona values ('3', '1' , 'marcos', 'gutierrez', 'duran', '654321', 'venezuela', 'kilometro 6', 'M', '1999/12/01');
-- empleados
insert into Persona values ('2', '1' , 'mateo', 'jimenes', 'nava', '123456', 'bolivia', 'kilometro 6', 'M', '1997/10/02');
insert into Persona values ('4', '1' , 'jesica', 'avalos', 'claros', '9876542', 'honduras', 'kilometro 6', 'F', '1987/07/25');
insert into Persona values ('5', '1' , 'marcelo', 'fernadez', 'chambi', '989751', 'bolivia', 'plaza 24', 'M', '1999/12/01');
insert into Persona values ('6', '1' , 'matias', 'frankfurt', 'chavez', '1123488', 'bolivia', 'plan 3 mil', 'M', '1995/01/17');

insert into telefono_persona values ('1', '77059821');
insert into telefono_persona values ('3', '11234578');

insert into Cliente values ('1', '1' , 'doctor');
insert into Cliente values ('2', '3' , 'psicologo');

insert into Cargo values ('1', 'recepcionista' , 'resgistrar personas', '2500');
insert into Cargo values ('2', 'limpieza' , 'limpieza del hotel', '2100');
insert into Cargo values ('3', 'guardia' , 'seguridad del hotel', '2200');

insert into Empleado values ('1', '2' , '1', 'modelo de hoteles');
insert into Empleado values ('2', '4' , '2', 'limpieza de casas');
insert into Empleado values ('3', '5' , '2', 'mesero, lavaplatos');
insert into Empleado values ('4', '6' , '3', 'rescatista, militar');

insert into meses_trabajados values ('1', '1' , '2019');

insert into Pago_empleado values ('1', '1' , '1', '2019/02/04', '2500');
insert into Pago_empleado values ('2', '2' , '1', '2019/02/04 04:00:00', '1950');
insert into Pago_empleado values ('3', '4' , '1', null, '2200');
insert into Pago_empleado values ('4', '3' , '1', null, '2000');

insert into tipo_de_faltas values ('1', 'falta' , '50');
insert into tipo_de_faltas values ('2', 'retraso' , '100');

insert into descuento values ('1', '2' , '150');
insert into descuento values ('2', '4' , '100');

insert into detalle_descuento values ('1', '1' , '2019/01/15 09:00:00', 'motivos de salud');
insert into detalle_descuento values ('1', '2' , '2019/01/18 11:00:00', 'motivos de salud');
insert into detalle_descuento values ('2', '1' , '2019/01/20 11:00:00', 'motivo de viaje');
insert into detalle_descuento values ('2', '1' , '2019/01/21 11:00:00', 'motivo de lluvia');

insert into registro_alquiler values ('1', '1' , '1', '1', 'A', 'P', 'nose xd');
insert into registro_alquiler values ('2', '1' , '1', '2', 'R', 'P', 'nose xd');
insert into registro_alquiler values ('3', '1' , '1', '1', 'R', 'P', 'nose xd');

insert into reserva values ('1', '2' , '2', '100', '2019/01/10 15:30:00');
insert into reserva values ('2', '1' , '3', '100', '2019/01/20 07:30:00');

insert into Detalle_habitacion values ('1', '1' , '100');
insert into Detalle_habitacion values ('2', '2' , '420');
insert into Detalle_habitacion values ('3', '3' , '200');

insert into habitaciones_ocupadas values ('1', '1', '4' , '2019/01/18 11:00:00', '2019/01/19 11:00:00');
insert into habitaciones_ocupadas values ('2', '2', '1' , '2019/01/19 07:00:00', '2019/01/21 19:00:00');
insert into habitaciones_ocupadas values ('3', '2', '5' , '2019/01/19 07:00:00', '2019/01/21 19:00:00');
insert into habitaciones_ocupadas values ('4', '3', '3' , '2019/01/25 07:00:00', '2019/01/27 19:00:00');

insert into detalle_servicios values ('1', '2' , '60');

insert into servicio values ('1', 'despertador matutino' , '0');
insert into servicio values ('2', 'limpieza de cuarto' , '20');
insert into servicio values ('3', 'pedidos de compra' , '10');

insert into total_servicios values ('1', '1' , '2019/01/20 06:00:00');
insert into total_servicios values ('1', '1' , '2019/01/21 06:00:00');
insert into total_servicios values ('1', '2' , '2019/01/20 20:00:00');
insert into total_servicios values ('1', '2' , '2019/01/21 08:00:00');
insert into total_servicios values ('1', '3' , '2019/01/20 21:00:00');
insert into total_servicios values ('1', '3' , '2019/01/21 08:30:00');

insert into factura values ('1', '1' , '1', '100');
insert into factura values ('2', '2' , '2', '420');
insert into factura values ('3', '3' , '1', '200');

insert into pago values ('1', '1' , '2019/01/19 11:00:00', '100', 'A', 'C');
insert into pago values ('2', '2' , '2019/01/11 8:00:00', '100', 'D', 'T');
insert into pago values ('3', '2' , '2019/01/21 19:00:00', '320', 'A', 'C');
insert into pago values ('4', '3' , '2019/01/27 19:10:00', '100', 'A', 'C');
insert into pago values ('5', '3' , '2019/01/27 19:10:00', '100', 'A', 'T');


insert into registro_inventario values ('1', '1' , '2019/01/29');


insert into articulos values ('1', 'televisor');
insert into articulos values ('2', 'sabanas');
insert into articulos values ('3', 'controles');
insert into articulos values ('4', 'platos');
insert into articulos values ('5', 'sillones');

insert into inventario_articulos values ('1', '1', '7');
insert into inventario_articulos values ('1', '2', '12');
insert into inventario_articulos values ('1', '3', '7');
insert into inventario_articulos values ('1', '4', '30');
insert into inventario_articulos values ('1', '5', '14');

select * from hotel;
select * from hoteltel;
select * from tipoHabitacion;
select * from Habitaciones;
select * from Persona;
select * from cliente;
select * from Empleado;
select * from cargo ;
select * from meses_trabajados;
select * from Pago_empleado;
select * from tipo_de_faltas;
select * from descuento;
select * from detalle_descuento;
select * from detalle_habitacion;
select * from servicio;
select * from detalle_servicios;
select * from registro_alquiler ;
select * from pago;
select * from factura ;

-- eliminar columnda de la tabla de registros
delete from Pago_empleado where numero_recibo='2';
delete from cargo where id_cargo=3;

-- update
update tipo_de_faltas set monto=50 where id_tipo=2;

update registro_alquiler set estado='P' where id_registro=2; 