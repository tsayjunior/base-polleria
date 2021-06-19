use bdhotel;

-- saca el descuento por empleado segun se vayan dando
create trigger descuento_de_detalle
after insert 
on detalle_descuento
for each row 
update descuento d
inner join detalle_descuento det on det.id_descuento= d.ide_descuento
inner join tipo_de_faltas t on t.id_tipo= det.id_tipo
set total_descuento = total_descuento+ montoDeLaFalta(t.monto)
where d.id_descuento=new.id_descuento;

-- saca el costo total de servicios por habitacion, cada ves que se pida uno
create trigger monto_servicios
after insert 
on total_servicios
for each row 
update detalle_servicios d
inner join total_servicios tot on tot.id_detalle= d.id_detalle
inner join servicio s on s.id_servicio= tot.id_servicio
set total = total + valorDeServicio(s.valor)
where d.id_detalle=new.id_detalle;

-- calcula el costo de la habitacion que se ocupa segun los dias que se ocupen
create trigger costo_del_uso_habi
after insert 
on habitaciones_ocupadas
for each row 
update detalle_habitacion d
inner join habitaciones_ocupadas hab on hab.id_detalle= d.id_detalle
inner join habitaciones h on h.id_habitacion= hab.id_habitacion
inner join tipohabitacion t on t.tipo = h.tipo
set total = total + ( precioDeHabitacion(hab.id_habitacion) *  Dias_ocupados(hab.fecha_ingresa, hab.fecha_salida))
where d.id_detalle=new.id_detalle;