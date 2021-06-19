-- 1.- Mostrar la cantidad total de pedidos de todo un día

select producto.nombre, sum(detalle_pedido.cantidad)
from pedido, detalle_pedido, producto 
where pedido.cod_pedido=detalle_pedido.cod_pedido and detalle_pedido.cod_producto= producto.cod_producto
and fecha_hora between '2021-06-08' and '2021-06-09'
group by producto.nombre;
	
-- -2 mostrar el trabajador con fecha que incia a trabajar
select persona.nombre, min(trabajador.fecha_inicio)
 from persona,trabajador
where persona.ci=trabajador.ci and persona.tipo_t= 't'
group by persona.nombre;

-- 3.- Listar todos los empleados según cargo
select persona.nombre, cargo.descripcion
from  persona,trabajador,cargo
where persona.ci= trabajador.ci 
and trabajador.cod_cargo=cargo.cod_cargo

-- 4.- Mostrar todos los proveedores
select * from persona
where persona.tipo_t='p' 

-- 5- Mostrar todas las bebidas
select producto.nombre
from producto, categoria_menu
where producto.cod_menu=categoria_menu.cod_menu
and categoria_menu.descripcion='bebidas'

-- 7.- Mostrar en orden desc los productos más comprados en el día
select producto.nombre as Productos_mas_Vendidos, sum(Detalle_compra.cantidad_producto) as Cantidad from producto, Detalle_compra, Nota_compra
where Detalle_compra.cod_producto=producto.cod_producto
and Detalle_compra.cod_nota_compra=Nota_compra.codigo
group by producto.nombre
order by sum(Detalle_compra.cantidad_producto) desc

-- 8.- Mostrar todas las trabajadores mujeres
select * from persona
where persona.tipo_t='t' and persona.sexo='f'
-- 9.- Mostrar todos los trabajadores hombres
select * from persona
where persona.tipo_t='t' and persona.sexo='m'
-- 10.-Mostrar todos los proveedores mujeres
select * from persona
where persona.tipo_t='p' and persona.sexo='f'
-- 11.- Mostrar todos los proveedores hombres
select * from persona
where persona.tipo_t='p' and persona.sexo='m'
-- 12.- Mostrar a una persona segun su apellido
select * from persona
where persona.apellido='chumacero'
-- 13.- Mostrar la cantidad de compras del mes pasado
select nombre, sum(cantidad_producto)
from nota_compra, detalle_compra, producto
where producto.cod_producto=detalle_compra.cod_producto 
and nota_compra.codigo= detalle_compra.cod_nota_compra 
and Fecha_hora between (select date_sub((DATE_SUB(curdate(), INTERVAL 1 MONTH)), interval (day(NOW())-1) day))
 and (select DATE_sub(CURDATE(), INTERVAL (day(now())-1) DAY))
group by nombre; 

select MONTH (NOW()) as mes;  #Selecciona el mes
select DAY(NOW()) as dia; #Selecciona el día
select DATE_sub(CURDATE(), INTERVAL (day(now())-1) DAY) # selecciona el mes y le resta el dia
#seleccion la fecha, le resta un mes, y le resta los dias
select date_sub((DATE_SUB(curdate(), INTERVAL 1 MONTH)), interval (day(NOW())-1) day)

select DAY(NOW()) as dia

-- 14.- Mostrar el costo total más alto de un pedido del día de hoy
select MAX(costo_total)
from pedido
where fecha_hora between curdate() and (select DATE_SUB(CURDATE(), INTERVAL -1 DAY));
-- 15.- Mostrar el costo total más bajo de un pedido del día de hoy
select MIN(costo_total)
from pedido
where fecha_hora between curdate() and (select DATE_SUB(CURDATE(), INTERVAL -1 DAY));
-- 16.- Mostrar todos los producto_menu que se hayan acabado
select *
from producto
where prod_menu=true and cod_producto=(select cod_producto
							from inventario
                            where stock=0);

select nombre
from producto
where prod_menu=true and cod_producto=(select cod_producto
							from inventario
                            where stock=0);
-- 17.- Mostrar los productos que tengan una cantidad mínima de 50 en Stock
select nombre
from producto
where prod_menu=true and cod_producto=(select cod_producto
							from inventario
                            where stock>=50);
-- 18.- Mostrar todos los pedidos del día
select *
from pedido
where fecha_hora between curdate() and (select DATE_SUB(CURDATE(), INTERVAL -1 DAY));
-- donde select DATE_SUB(CURDATE(), INTERVAL -1 DAY) me devuelve la fecha de mañana
-- al poner la fecha de hoy y mañana me da todo lo que abarque desde las 00:00 de hoy hasta las 00:01 de mañana

-- 19.- Mostrar el costo_Total de los pedidos del día
select sum(precio_total)
from nota_compra , detalle_compra ,producto 
where detalle_compra.cod_nota_compra = nota_compra.codigo and detalle_compra.cod_producto = producto.cod_producto and nota_compra.fecha_hora = 'fecha'
-- 20.- Mostrar la cantidad cada de producto_menú que se vendió en el día
select cantidad,producto.cod_producto
from pedido, detalle_pedido,producto
where detalle_pedido.cod_pedido = pedido.cod_pedido and detalle_pedido.cod_producto = producto.cod_producto and pedido.fecha_hora = 'fecha' and producto.prod_menu= true 
-- 21.- Mostrar la cantidad de cada producto_menú que se vendío entre dos fechas dadas
select cantidad,producto.cod_producto
from pedido, detalle_pedido,producto
where detalle_pedido.cod_pedido = pedido.cod_pedido and detalle_pedido.cod_producto = producto.cod_producto  and pedido.fecha_hora between 'fecha1' and  'fecha2' and producto.prod_menu= true 
-- 22.- Mostrar la cantidad de cada producto_compra que se vendió entre dos fechas dadas
select cantidad,producto.cod_producto
from pedido, detalle_pedido,producto
where detalle_pedido.cod_pedido = pedido.cod_pedido and detalle_pedido.cod_producto = producto.cod_producto  and pedido.fecha_hora between 'fecha1' and  'fecha2' and producto.prod_compra=true 
-- 23.-  Mostrar el costo_Total de los pedido entre dos fechas dadas 
select sum(precio_total)
from nota_compra , detalle_compra ,producto 
where detalle_compra.cod_nota_compra = nota_compra.codigo and detalle_compra.cod_producto = producto.cod_producto and nota_compra.fecha_hora between 'fecha1' and 'fecha2'
-- 24.- Mostrar el proveedor al que más se le compra
select proveedor.nombre_negocio,cod_proveedor
from proveedor,nota_compra
where proveedor.ci =nota_compra.cod_proveedor
group by proveedor.nombre_negocio
order by cod_proveedor desc
-- 25.- Mostrar la cantidad de pedidos que se venden entre dos horas dadas
set @horaInicial=22;
set @horaFinal=24;
select count(pedido.cod_pedido) as 'cantidad de pedidos'
from pedido
where hour(pedido.fecha_hora) >= @horaInicial and hour(pedido.fecha_hora)<= @horaFinal;
-- 26.- Mostrar la hora donde se hacen más pedidos
select count(pedido.cod_pedido) as 'hora de mas pedidos'
from pedido
group by hour(pedido.fecha_hora)
order by count(pedido.cod_pedido) desc
limit 1;
-- 27.- Mostrar el promedio total de producto_menu que se venden en el mes
select month(pedido.fecha_hora) as 'mes',avg(detalle_pedido.precio_total) as 'promedio'
from detalle_pedido,pedido
where detalle_pedido.cod_pedido=pedido.cod_pedido
group by month(pedido.fecha_hora)
;
-- 28.- Mostrar el costo_total de nota_Compra de un més dado
select month(Nota_compra.Fecha_hora) as 'mes',sum(Detalle_compra.Precio_total) as 'costo total'
from Nota_compra,Detalle_compra
where Nota_compra.codigo=Detalle_compra.cod_nota_compra
group by month(Nota_compra.Fecha_hora);
-- 29.- Mostrar todas las personas que tengan más de 1 número
select persona.ci,persona.nombre
from persona,celular_persona
where persona.ci=celular_persona.ci 
group by persona.ci 
having count(persona.ci)>1;
-- 30.- Mostrar las personas que tengan una letra en su carnet de indentidad
select persona.ci,persona.nombre
from persona
where ((persona.ci regexp '[0-9]$')=0);

select * from pedido;

select * from detalle_producto;
select * from inventario;
select * from producto;
select * from persona;
select * from trabajador;
select * from celular_persona;
select * from cargo;
select * from proveedor;
select * from usuario;
select * from bitacora;
select * from pedido;
select * from categoria_menu;
select * from detalle_pedido;
select * from Ingreso_egreso;
select * from Nota_compra;
select * from tipo;
select * from Detalle_compra;