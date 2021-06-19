use bdhotel;
-- consultas --

-- 1. muestre nombre de las personas que hayan hecho reservaciones en el hotel
select nombre, ape_paterno, ape_materno, pais
from persona, cliente, reserva
where persona.id_persona=cliente.id_persona and cliente.cod_cliente=reserva.cod_cliente;
-- 2. muestre todas las personas que hayan alquilado sin hacer reservacion
select nombre, ape_paterno, ape_materno, pais
from persona, cliente, registro_alquiler, reserva
where persona.id_persona=cliente.id_persona and cliente.cod_cliente=registro_alquiler.cod_cliente
	and registro_alquiler.id_registro!=reserva.id_registro;
-- 3. muestra todas las personas que sean empleados y clientes al mismo tiempo
select nombre, ape_paterno, ape_materno, pais
from persona, cliente, empleado
where persona.id_persona=cliente.id_persona and persona.id_persona=empleado.id_persona;
-- 4. muestre todos los clientes que hayan usado alquilado aunque sea una habitacion simple
select * 
from persona
where id_persona in (select id_persona
						from cliente, registro_alquiler, detalle_habitacion, 
                        habitaciones_ocupadas, habitaciones,tipohabitacion
                        where cliente.cod_cliente=registro_alquiler.cod_cliente and 
                        registro_alquiler.id_registro=detalle_habitacion.id_registro and
                        detalle_habitacion.id_detalle=habitaciones_ocupadas.id_detalle and
                        habitaciones_ocupadas.id_habitacion=habitaciones.id_habitacion and
                        habitaciones.tipo=1);
-- 5. muestre todos los clientes que hayan alquilado aunque sea una habitacion doble
select * 
from persona
where id_persona in (select id_persona
						from cliente, registro_alquiler, detalle_habitacion, 
                        habitaciones_ocupadas, habitaciones,tipohabitacion
                        where cliente.cod_cliente=registro_alquiler.cod_cliente and 
                        registro_alquiler.id_registro=detalle_habitacion.id_registro and
                        detalle_habitacion.id_detalle=habitaciones_ocupadas.id_detalle and
                        habitaciones_ocupadas.id_habitacion=habitaciones.id_habitacion and
                        habitaciones.tipo=2);
-- 6. muestre todos los clientes que hayan alquilado aunque sea una habitacion matrimonial
select * 
from persona
where id_persona in (select id_persona
						from cliente, registro_alquiler, detalle_habitacion, 
                        habitaciones_ocupadas, habitaciones,tipohabitacion
                        where cliente.cod_cliente=registro_alquiler.cod_cliente and 
                        registro_alquiler.id_registro=detalle_habitacion.id_registro and
                        detalle_habitacion.id_detalle=habitaciones_ocupadas.id_detalle and
                        habitaciones_ocupadas.id_habitacion=habitaciones.id_habitacion and
                        habitaciones.tipo=3);
-- 7.muestre todos los nombres de los empleados que se hayan faltado aunque sea una ves
select nombre, ape_paterno, ape_materno
from persona as p, empleado as e, pago_empleado as pag, descuento as d, 
detalle_descuento as dd
where p.id_persona=e.id_persona and e.cod_empleado=pag.cod_empleado and
 pag.numero_recibo=d.numero_recibo and
		d.id_descuento=dd.id_descuento and dd.id_tipo=1;
-- 8.muestre todos los nombres de los empleados que se hayan retrasado aunque sea una ves
select nombre, ape_paterno, ape_materno
from persona as p, empleado as e, pago_empleado as pag, descuento as d, 
detalle_descuento as dd
where p.id_persona=e.id_persona and e.cod_empleado=pag.cod_empleado and
 pag.numero_recibo=d.numero_recibo and
		d.id_descuento=dd.id_descuento and dd.id_tipo=2;
-- 9.muestre todos los nombres de los empleados que nunca se les haya hecho un descuento
select nombre, ape_paterno, ape_materno
from persona as p, empleado as e, pago_empleado as pag, descuento as d
where p.id_persona=e.id_persona and e.cod_empleado=pag.cod_empleado and
 pag.numero_recibo!=d.numero_recibo;
-- 10. muestre todas las habitaciones que esten disponibles, no ocupadas, del hotel italia
select *
from habitaciones
where estado=0 and habitaciones.id_hotel in (select id_hotel
												from hotel
                                                where id_hotel=1);
-- 11. muestre todas las habitaciones que esten ocupadas, no disponibles, del hotel italia
select *
from habitaciones
where estado=1 and habitaciones.id_hotel in (select id_hotel
												from hotel
                                                where id_hotel=1);
-- 12. muestre los empleados que son varones del hotel
select nombre, ape_paterno, ape_materno, pais, cod_empleado
from persona, empleado
where persona.id_persona=empleado.id_persona and sexo='M'; 
-- 13. muestre las empleadas que son mujeres del hotel
select nombre, ape_paterno, ape_materno, pais, cod_empleado
from persona, empleado
where persona.id_persona=empleado.id_persona and sexo='F'; 
-- 14. muestre los empleados a los que se les debe aunque un pago
select nombre, ape_paterno, ape_materno, pais, empleado.cod_empleado
from persona, empleado, pago_empleado
where persona.id_persona=empleado.id_persona and empleado.cod_empleado=pago_empleado.cod_empleado
		and fecha_pago is null; 
-- 15. mostrar empleados a los que no se les debe ningun pago
select nombre, ape_paterno, ape_materno, pais, empleado.cod_empleado
from persona, empleado, pago_empleado
where persona.id_persona=empleado.id_persona and empleado.cod_empleado=pago_empleado.cod_empleado
		and fecha_pago is not null; 
-- 16. mostrar los registros de alquileres que hayan pedido algun tipo de servicio
select registro_alquiler.id_registro, concepto, estado
from registro_alquiler, detalle_habitacion, habitaciones_ocupadas, detalle_servicios
where registro_alquiler.id_registro=detalle_habitacion.id_registro and 
		detalle_habitacion.id_detalle=habitaciones_ocupadas.id_detalle and 
        habitaciones_ocupadas.id_hab_ocu=detalle_servicios.id_hab_ocu
group by registro_alquiler.id_registro, concepto, estado;
-- 17. mostrar a todos los empleados pagados el mes de enero de 2019
select *
from persona
where id_persona in (select id_persona
						from empleado, pago_empleado, meses_trabajados
                        where empleado.cod_empleado=pago_empleado.cod_empleado and
							pago_empleado.id_mes_trab=meses_trabajados.id_mes_trab
                            and fecha_pago is not null);
-- 18. mostrar a todos los empleados no pagados el mes de enero de 2019
select *
from persona
where id_persona in (select id_persona
						from empleado, pago_empleado, meses_trabajados
                        where empleado.cod_empleado=pago_empleado.cod_empleado and
							pago_empleado.id_mes_trab=meses_trabajados.id_mes_trab
                            and fecha_pago is null);
-- 19. mostrar a los clientes que se hospedaron 2 o mas veces
select nombre, ape_materno, ape_paterno, pais, cliente.cod_cliente, count(*)
from persona, cliente, registro_alquiler
where persona.id_persona=cliente.id_persona and cliente.cod_cliente=registro_alquiler.cod_cliente
group by nombre, ape_materno, ape_paterno, pais, cliente.cod_cliente
having count(*)>=2;
-- 20. mostrar los registros de alquiler ya usados o pasados
select *
from registro_alquiler 
where estado='P';
-- 21. mostrar los registros de alquiler cancelados
select *
from registro_alquiler 
where estado='C';
-- 22. mostrar los registros de alquiler vigentes
select *
from registro_alquiler 
where estado='V';
-- 23. mostrar los cliente que pagaron mediante tarjeta
select nombre, ape_paterno, ape_materno, pais, cliente.cod_cliente
from persona, cliente, registro_alquiler, factura, pago
where persona.id_persona=cliente.id_persona and cliente.cod_cliente=registro_alquiler.cod_cliente and
	registro_alquiler.id_registro=factura.id_registro and factura.id_factura=pago.id_factura and 
    pago.tipo='T';
    -- 24. mostrar los cliente que pagaron mediante efectivo o al contado
select nombre, ape_paterno, ape_materno, pais, cliente.cod_cliente
from persona, cliente, registro_alquiler, factura, pago
where persona.id_persona=cliente.id_persona and cliente.cod_cliente=registro_alquiler.cod_cliente and
	registro_alquiler.id_registro=factura.id_registro and factura.id_factura=pago.id_factura and 
    pago.tipo='C'
group by nombre, ape_paterno, ape_materno, pais, cliente.cod_cliente;
-- 25. mostrar los clientes que no son bolivianos
select *
from persona
where id_persona in (select id_persona
						from cliente)
and pais != 'bolivia';
-- 26. mostrar los clientes que son bolivianos
select *
from persona
where id_persona in (select id_persona
						from cliente)
and pais = 'bolivia';
-- 27 mostrar los id_persona, los nombres, cod_empleado y los cargos que tengan
select persona.id_persona, persona.nombre, persona.ape_paterno, cod_empleado, cargo.nombre
from persona, empleado, cargo
where persona.id_persona=empleado.id_persona and empleado.id_cargo=cargo.id_cargo ;
-- 28 mostrar los id_persona, los nombres, cod_empleado, cargos que tengan y cuanto ganan 
select persona.id_persona, persona.nombre, persona.ape_paterno, cod_empleado, cargo.nombre, sueldo
from persona, empleado, cargo
where persona.id_persona=empleado.id_persona and empleado.id_cargo=cargo.id_cargo ;
-- 29. mostrar las personas que nacieron en los 80
select *
from persona
where YEAR (fecha_nacimiento)>=1980 and YEAR (fecha_nacimiento)<=1989;
-- 30.mostrar nombre y paterno y edad de los personas
select nombre,ape_paterno, YEAR (curdate())-YEAR (fecha_nacimiento)AS AÑOSCLIENTE
from persona;
-- 31.mostrar nombre y paterno y edad de los personas que son mayores a 25 años
select nombre,ape_paterno, YEAR (curdate())-YEAR (fecha_nacimiento)AS AÑOSCLIENTE
from persona
where YEAR (curdate())- YEAR(fecha_nacimiento)>25;
-- 32 devuelve ultimo id_persona
select max(id_persona)
from persona
where id_persona is not null;
-- 23. mostrar los dias usados de las habitaciones
SELECT DATEDIFF('2017-1-15', '2016-12-29');

SELECT DATEDIFF('2019/01/15 09:00:00', '2019/01/12 09:00:00');
SET GLOBAL log_bin_trust_function_creators = 1;
