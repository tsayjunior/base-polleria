create database rosticeria;
use rosticeria;
create table persona(
	ci varchar(10) not null primary key,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	direccion varchar(40) not null,
    sexo char not null,
	tipo_t char not null
);
create table celular_persona(
	ci varchar(10) not null,
	celular int,
    primary key(ci, celular),
	foreign key(ci) references persona(ci)
	on delete no action on update no action
);
create table cargo(
	cod_cargo int not null primary key,
    descripcion varchar(30) not null,
    sueldo float not null,
    perfil_usuario boolean not null
);
create table trabajador(
	ci varchar(10) not null primary key,
    fecha_inicio datetime not null,
    cod_cargo int not null,
    foreign key(ci) references persona(ci)
	on delete cascade on update cascade,
	foreign key(cod_cargo) references cargo(cod_cargo)
	on delete cascade on update cascade
);
create table proveedor(
	ci varchar(10) not null primary key,
    nombre_negocio varchar(30) not null,
    direccion_negocio varchar(30) not null,
    foreign key(ci) references persona(ci)
	on delete cascade on update cascade
);
create table usuario(
	username varchar(20) not null primary key,
	psswrd varchar(30) not null,
	email varchar(30) not null,
	Nivel_acceso tinyint not null,
	ci_trabajador varchar(10) not null,
	foreign key(ci_trabajador) references trabajador(ci)
	on delete cascade on update cascade
);
create table bitacora(
	codigo int not null primary key,
	descripcion varchar(30) not null,
	fecha_hora datetime not null,
	username_usuario varchar(20) not null,
	foreign key(username_usuario) references Usuario(username)
	on delete cascade on update cascade
);

create table pedido(
	cod_pedido int not null primary key AUTO_INCREMENT,
	fecha_hora datetime not null,
	costo_total float not null,
    llevar boolean not null,
	username_usuario varchar(20) not null,
	foreign key(username_usuario) references Usuario(username)
	on delete cascade on update cascade
);
create table categoria_menu(
	cod_menu int not null primary key,
	descripcion varchar(20) not null
);
create table producto(
	cod_producto int not null primary key,
	nombre varchar(30) not null,
	precio float,
	prod_menu boolean not null,
	prod_compra boolean not null,
	cod_menu int,
	foreign key(cod_menu) references categoria_menu(cod_menu)
	on delete cascade on update cascade
);
create table detalle_pedido(
	cod_pedido int not null,
	cod_producto int not null,
	cantidad int not null,
	precio_total float not null,
	primary key(cod_pedido, cod_producto),
	foreign key(cod_pedido) references pedido(cod_pedido)
	on delete cascade on update cascade,
	foreign key(cod_producto) references producto(cod_producto)
	on delete cascade on update cascade
);
create table detalle_producto(
	cod_A int not null,
	cod_B int not null,
	cantidad int not null,
	primary key(cod_A, cod_B),
	foreign key(cod_A) references producto(cod_producto)
	on delete cascade on update cascade,
	foreign key(cod_B) references producto(cod_producto)
	on delete cascade on update cascade
);
create table inventario(
	cod_producto int not null,
	cod_inventario int not null,
	stock int not null,
	primary key(cod_producto, cod_inventario),
	foreign key(cod_producto) references producto(cod_producto)
	on delete cascade on update cascade
);
create table Ingreso_egreso(
	Cod_ingreso_egreso int not null primary key AUTO_INCREMENT,
	Cantidad int not null,
	Fecha_hora datetime not null,
	tipo boolean not null,
	username varchar(20) not null,
	producto int not null,
	foreign key(username) references usuario(username)
	on delete cascade on update cascade,
	foreign key(producto) references producto(cod_producto)
	on delete cascade on update cascade
);
create table Nota_compra(
	codigo int not null primary key AUTO_INCREMENT,
	Fecha_hora datetime not null,
	total float not null,
	username varchar(20) not null,
	cod_proveedor varchar(10) not null,
	foreign key(username) references usuario(username)
	on delete cascade on update cascade,
	foreign key(cod_proveedor) references proveedor(ci)
	on delete cascade on update cascade
);
create table tipo(
	cod_tipo int not null primary key,
	descripcion varchar(30) not null,
	abreviatura varchar(5) not null
);


create table Detalle_compra(
	cod_nota_compra int not null,
	cod_producto int not null,
	cantidad_producto float not null,
	Precio_total float not null,
	Precio_unitario float,
	descripcion varchar(30),
	cod_tipo int not null,
    primary key(cod_nota_compra, cod_producto),
    foreign key(cod_nota_compra) references nota_compra(codigo)
	on delete cascade on update cascade,
	foreign key(cod_producto) references producto(cod_producto)
	on delete cascade on update cascade,
	foreign key(cod_tipo) references tipo(cod_tipo)
	on delete cascade on update cascade
); 	