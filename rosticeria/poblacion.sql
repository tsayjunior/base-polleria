-- poblacion
use rosticeria;
insert into persona values ('1112354c', 'joaquin', 'chumacero', 'plan 3 mil', 'p');
insert into persona values ('1112659A', 'alejandra', 'mercedes', 'av. plan 3 mil', 't');
insert into persona values ('8945414L', 'alex', 'fankfurt', 'av. busch', 'p');
insert into persona values ('54548455', 'alejandra', 'soto aguilar', 'av. aroyito', 't');
insert into persona values ('51545454', 'max', 'fernadez cespedes', 'av. cañoto frente, av. busch', 't');
insert into persona values ('98745451', 'romina', 'nahir duran', 'av. plan 3 mil', 't');
insert into persona values ('9897156', 'juan', 'sans', 'av. busch', 'p');
insert into persona values ('4568798', 'marta', 'coehlo', 'av. busch', 'p');
insert into persona values ('8795155', 'mario', 'salazar', 'av. busch', 'h', 't');

select * from persona;

insert into celular_persona values ('1112354c', '76654987');
insert into celular_persona values ('1112354c', '76135452');
insert into celular_persona values ('8945414L', '64841546');
insert into celular_persona values ('54548455', '98515444');
insert into celular_persona values ('51545454', '12354845');
insert into celular_persona values ('98745451', '77514841');

insert into cargo values ('1', 'administrador', '2000', true);
insert into cargo values (2, 'cajero', '2000', true);
insert into cargo values ('3', 'mesero', '1850', true);
insert into cargo values ('4', 'cocinero', '1850', false);

insert into trabajador values ('1112659A', '2021-06-05 16:06:00', '1');
insert into trabajador values ('54548455', '2021-06-05 16:06:00', '2');
insert into trabajador values ('98745451', '2021-06-05 16:06:00', '3');
insert into trabajador values ('51545454', '2021-06-05 16:06:00', '4');
insert into trabajador values ('8795155', now(), '4');
 -- 5 mas

insert into proveedor values ('1112354c', 'polleria san juan', 'av. plan 3 mil');
insert into proveedor values ('8945414L', 'coca cola', 'av. plan 3 mil');
insert into proveedor values ('9897156', 'distribuidora vasquez', 'calle israel mendia #9');
insert into proveedor values ('4568798', 'verduleria buenas', 'calle israel mendia #8');
-- tropi frut, mendocina, abarotes, salsas kriss

insert into usuario values ('alejandrita', 'maria9878', 'alejandra@gmail.com', 1, '1112659A');
insert into usuario values ('alesoto', '45454sasa', 'alej@gmail.com', '2', '54548455');
insert into usuario values ('romina', 'romina121', 'romi@gmail.com', '3', '54548455');

insert into bitacora values ();

insert into pedido values (default, now(), 27, false, 'alejandrita');
-- 30 pedidos por dia variando hora

insert into categoria_menu values ('1', 'bebidas');
insert into categoria_menu values ('2', 'comidas');

insert into producto values (1, 'pollo', null, false, true, null);
insert into producto values (2, 'economico', '12', true, false, '2');
insert into producto values (3, 'cuarto', '17', true, false, '2');
insert into producto values (4, 'medio', '30', true, false, '2');
insert into producto values (5, 'entero', '50', true, false, '2');
insert into producto values (6, 'coca cola peque', '3', true, true, '1');
insert into producto values (7, 'coca cola personal', '7', true, true, '1');
insert into producto values (8, 'coca cola retornable 1lt', '8', true, true, '1');
insert into producto values (9, 'zanahoria', null, false, true, null);
insert into producto values (10, 'cebolla', null, false, true, null);
insert into producto values (11, 'pimenton', null, false, true, null);
insert into producto values (12, 'vainita', null, false, true, null);
insert into producto values (13, 'cebolla verde', null, false, true, null);
insert into producto values (14, 'papa', null, false, true, null);
insert into producto values (8, 'coca cola retornable 2lt', '8', true, true, '1');-- 


insert into detalle_pedido values ('1', '2', 1, 12);
insert into detalle_pedido values ('1', '3', 1, 17);

insert into detalle_producto values (1, 5, 1);
insert into detalle_producto values (1, 2, 8);
insert into detalle_producto values (1, 3, 4);
insert into detalle_producto values (1, 4, 2);

insert into inventario values (2, 1, 45);

insert into Ingreso_egreso values (default, 50, NOW(), true,'alejandrita', 2);
insert into Ingreso_egreso values (default, 2, NOW(), false,'alejandrita', 2);
insert into Ingreso_egreso values (default, 3, NOW(), false,'alejandrita', 2);

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

insert into Nota_compra values (default, '2021-06-05 16:06:00', 0.0, 'alejandrita', '1112354c');
insert into Nota_compra values (default, '2021-06-05 16:06:00', 505, 'alejandrita', '4568798');

insert into tipo values ('1', 'caja de pollo', 'cj');
insert into tipo values ('2', 'kilogramos', 'kg');
insert into tipo values ('3', 'aroba', 'a');
insert into tipo values ('4', 'quintal', 'qq');
insert into tipo values ('5', 'docena', 'd');
insert into tipo values ('6', 'amarro', 'am');

insert into Detalle_compra values ('1', '1', '15', '3225', '215', 'pollos de granja', '1');

insert into Detalle_compra values ('2', '14', '15', '300', null, null, '1');
insert into Detalle_compra values ('2', '9', '15', '40', null, null, '3');
insert into Detalle_compra values ('2', '10', '15', '40', null, null, '2');
insert into Detalle_compra values ('2', '11', '15', '45', null, null, '3');
insert into Detalle_compra values ('2', '12', '15', '50', null, null, '5');
insert into Detalle_compra values ('2', '13', '15', '50', null, null, '6');