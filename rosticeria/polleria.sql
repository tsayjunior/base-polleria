create database polleria;
use polleria;
create table persona(
ci varchar(10) not null,
nombre varchar(20) not null,
apellido varchar(40) not null,
direccion varchar(40) not null,
sexo char not null,
tipo_p char not null,
primary key(ci)
);
create table celular_persona(
ci varchar(10) not null,
celular int,
 primary key(ci, celular),
foreign key(ci) references persona(ci)
on delete no action on update no action
);
create table proveedor(
ci varchar(10) not null,
nombre_negocio varchar(30) not null,
direccion_negocio varchar(40),
primary key(ci),
foreign key(ci) references persona(ci)
on delete cascade 
on update cascade
);

create table cargo(
cod_cargo int not null,
descripcion varchar(30) not null,
sueldo float not null,
perfil_usuario boolean ,
primary key(cod_cargo)
); 
create table trabajador (
ci varchar(10) not null,
fecha_inicio datetime not null,
estado boolean not null,
cod_cargo int not null,
primary key(ci),
foreign key(ci) references persona(ci)
on delete cascade 
on update cascade,
foreign key(cod_cargo) references cargo(cod_cargo)
on delete cascade 
on update cascade
);

create table usuario(
username varchar(20) not null,
psswrd varchar(30) not null,
email varchar(50) not null,
nivel_acceso int not null,
ci varchar(10) not null,
primary key(username),
foreign key(ci) references trabajador(ci)
on delete cascade 
on update cascade
);

create table producto(
codigo int not null,
nombre varchar(30) not null,
tipo_producto char not null,
primary key(codigo)
 );
create table nota_de_compra(
codigo int not null AUTO_INCREMENT,
fecha_hora datetime not null,
total float,
username varchar(15) not null,
cod_proveedor varchar(10) not null,
primary key(codigo),
foreign key(username) references usuario(username)
on delete cascade 
on update cascade,
foreign key(cod_proveedor) references proveedor(ci)
on delete cascade 
on update cascade
);
create table tipo(
cod_tipo int not null,
descripcion varchar(40) not null,
abreviatura varchar(5) not null,
primary key(cod_tipo)
);
create table detalle_compra(
cod_nota_compra int not null,
cod_producto int not null,
cantidad_producto float not null,
precio_total float not null ,
precio_unitario float,
descripcion varchar(40),
cod_tipo int not null,
primary key(cod_producto,cod_nota_compra),
foreign key(cod_producto) references producto(codigo)
on delete cascade
on update cascade,
foreign key(cod_nota_compra) references nota_de_compra(codigo)
on delete cascade
on update cascade,
foreign key(cod_tipo) references tipo(cod_tipo)
on delete cascade
on update cascade
);
create table lote(
cod_lote int not null,
fecha_vencimiento datetime not null,
fecha_elaboracion datetime,
cantidad int not null,
codigo_producto_l int not null,
codigo_nota_compra_l int not null,
primary key(cod_lote),
foreign key(codigo_producto_l) references detalle_compra(cod_producto)
on delete cascade
on update cascade,
foreign key(codigo_nota_compra_l) references detalle_compra(cod_nota_compra)
on delete cascade
on update cascade
);
create table bebida(
codigo_producto int not null,
estado boolean not null,
precio float not null,
primary key(codigo_producto),
foreign key(codigo_producto) references producto(codigo)
on delete cascade
on update cascade
);
create table pedido(
cod_pedido int not null AUTO_INCREMENT,
fecha_hora datetime not null,
costo_total float not null,
llevar boolean not null,
username varchar(15) not null,
primary key(cod_pedido),
foreign key(username) references usuario(username)
on delete cascade
on update cascade
);
create table plato(
cod_plato int not null,
nombre varchar(20) not null,
precio float not null,
primary key(cod_plato)
);
create table contenido(
cod_contenido int not null, 
nombre varchar(20) not null,
precio float not null,
estado boolean not null,
primary key(cod_contenido)
);
create table contenido_producto(
cod_plato int not null,
cod_contenido int not null,
cantidad int not null,
primary key(cod_plato,cod_contenido),
foreign key(cod_plato) references plato(cod_plato)
on delete cascade
on update cascade,
foreign key(cod_contenido) references contenido(cod_contenido)
on delete cascade
on update cascade
);
-- drop table detalle_pedido;
create table detalle_pedido(
codigo int not null,
cantidad_plato int not null , 
precio float not null,
codigo_pedido int not null,
codigo_plato int,
codigo_contenido int,
codigo_bebida int ,
primary key(codigo),
foreign key(codigo_pedido) references pedido(cod_pedido)
on delete cascade
on update cascade ,
foreign key(codigo_plato) references plato(cod_plato)
on delete cascade
on update cascade,
foreign key(codigo_bebida) references bebida(codigo_producto)
on delete cascade
on update cascade,
foreign key(codigo_contenido) references contenido(cod_contenido)
on delete cascade
on update cascade
);

create table detalle_presa(
cod_producto int not null,
cod_detalle_pedido int not null,
cantidad int not null,
primary key(cod_producto,cod_detalle_pedido),
foreign key(cod_producto) references producto(codigo)
on delete cascade
on update cascade,
foreign key(cod_detalle_pedido) references detalle_pedido(codigo)
on delete cascade
on update cascade
);

create table ingreso_egreso(
codigo int not null auto_increment,
fecha_hora datetime not null,
tipo char not null,
nombre_usuario varchar(15) not null,
primary key(codigo) ,
foreign key(nombre_usuario) references usuario(username)
on delete cascade
on update cascade
);
create table detalle_ingreso_egreso(
codigo_ingreso_egreso int not null,
codigo_producto int not null,
cantidad int not null,
primary key(codigo_ingreso_egreso,codigo_producto),
foreign key(codigo_ingreso_egreso) references ingreso_egreso(codigo)
on delete cascade
on update cascade,
foreign key(codigo_producto) references producto(codigo)
on delete cascade
on update cascade
);
create table stock(
cod_stock int not null auto_increment,
cod_producto int not null,
cantidad int not null,
ingreso int not null,
stock int not null,
fecha_hora datetime not null,
primary key(cod_stock,cod_producto),
foreign key(cod_producto) references producto(codigo)
on delete cascade
on update cascade
);
create table bitacora(
codigo int not null auto_increment,
fecha_hora datetime not null,
descripcion varchar(30) not null,
username varchar(15) not null,
primary key(codigo),
foreign key(username) references usuario(username)
on delete cascade
on update cascade
);
