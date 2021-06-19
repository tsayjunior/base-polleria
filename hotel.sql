drop database bdhotel;
create database bdHotel;
use bdHotel;
create table Hotel(
	id_hotel int primary key auto_increment not null,
    direccion varchar(30) not null,
    nombre varchar(30) not null
);
create table HotelTel(
	id_hotel int not null,
    telefono int not null,
    foreign key (id_hotel) references Hotel(id_hotel)
		on update cascade
        on delete cascade
);
create table tipoHabitacion(
	tipo int primary key auto_increment not null,
	precio int not null,
    descripcion varchar(75)
);
create table Habitaciones(
	id_habitacion int primary key auto_increment not null,
    id_hotel int not null,
    tipo int not null,
    numero_habitacion int not null,
    estado tinyint not null, -- 0 disponible, 1 ocupado
    foreign key (id_hotel) references Hotel (id_hotel)
		on update cascade
        on delete cascade,
	foreign key (tipo) references tipoHabitacion (tipo)
		on update cascade
        on delete cascade
);
create table Persona(
	id_persona int primary key auto_increment not null,
    id_hotel int not null,
    nombre varchar(30) not null,
    ape_paterno varchar(30) not null,
    ape_materno varchar(30),
    numero_doc int not null,
    pais varchar(30),
    direccion varchar(30),
    sexo varchar(1),
    fecha_nacimiento date
);
create table telefono_persona(
	id_persona int not null,
    telefono int,
    foreign key(id_persona) references persona(id_persona)
		on update cascade
        on delete cascade
);
create table Cliente(
	cod_cliente int primary key auto_increment not null,
    id_persona int not null,
    profesion varchar(30),
    foreign key(id_persona) references Persona(id_persona)
		on update cascade
        on delete cascade
);
create table Cargo(
	id_cargo int primary key auto_increment not null,
    nombre varchar(30) not null,
    descripcion varchar(30) not null,
    sueldo int not null
);
create table Empleado(
	cod_empleado int primary key auto_increment not null,
    id_persona int not null,
    id_cargo int not null,
    exp_laboral varchar(50) not null,
    foreign key(id_persona) references Persona (id_persona)
		on update cascade
        on delete cascade,
	foreign key(id_cargo) references Cargo(id_cargo)
		on update cascade
        on delete cascade
); 

create table meses_trabajados(
	id_mes_trab int primary key auto_increment not null,
    mes int not null,
    año int not null
);
create table Pago_empleado(
	numero_recibo int primary key auto_increment not null,
    cod_empleado int not null,
    id_mes_trab int not null,
    fecha_pago datetime,
    total_pagado int,
    foreign key (cod_empleado) references Empleado(cod_empleado)
		on update cascade
        on delete cascade,
	foreign key (id_mes_trab) references meses_trabajados(id_mes_trab)
		on update cascade
        on delete cascade
);
create table tipo_de_faltas(
	id_tipo int primary key auto_increment not null,
    motivo varchar(30) not null,
    monto int not null
);
create table descuento(
	id_descuento int primary key auto_increment not null,
	numero_recibo int not null,
    total_descuento int not null,
    foreign key (numero_recibo) references Pago_empleado (numero_recibo)
		on update cascade
        on delete cascade
);


create table detalle_descuento(
	id_descuento int not null,
    id_tipo int not null,
    fecha_hora datetime not null,
    descripcion varchar(50),
    foreign key (id_descuento) references descuento(id_descuento)
		on update cascade
        on delete cascade,
    foreign key (id_tipo) references tipo_de_faltas(id_tipo)
		on update cascade
        on delete cascade
);
create table registro_alquiler(
	id_registro int primary key auto_increment not null,
    id_hotel int not null,
    cod_empleado int not null,
    cod_cliente int not null,
    concepto varchar(1) not null, -- R si es reserva, A si es alquiler
    estado varchar(1) not  null, -- V si esta Vigente , C si ya no es valido(fue cancelado), y P si es un registro que ya paso
    descripcion varchar(30) not null,
    foreign key (id_hotel) references hotel(id_hotel)
		on update cascade
        on delete cascade,
	foreign key (cod_empleado) references empleado(cod_empleado)
		on update cascade
        on delete cascade,
	foreign key (cod_cliente) references cliente(cod_cliente)
		on update cascade
        on delete cascade
);

create table Reserva(
	id_reserva int primary key auto_increment not null,
    cod_cliente int not null,
    id_registro int not null,
    deposito int not null,
    fecha_reserva datetime not null, -- fecha que hace la reserva 
    foreign key(cod_cliente) references cliente(cod_cliente)
		on update cascade
        on delete cascade,
	foreign key(id_registro) references registro_alquiler(id_registro)
		on update cascade
        on delete cascade
);
create table Detalle_habitacion(
	id_detalle int primary key auto_increment not null,
    id_registro int not null,
    total int,
    foreign key (id_registro) references registro_alquiler (id_registro)
		on update cascade
        on delete cascade
);
create table habitaciones_ocupadas(
	id_hab_ocu int primary key auto_increment not null,
	id_detalle int not null,
    id_habitacion int not null,
    fecha_ingresa datetime not null,
    fecha_salida datetime,
    foreign key (id_detalle) references Detalle_habitacion (id_detalle)
		on update cascade
        on delete cascade,
    foreign key (id_habitacion) references habitaciones (id_habitacion)
		on update cascade
        on delete cascade
);	
create table detalle_servicios(
	id_detalle int primary key auto_increment not null,
    id_hab_ocu int not null,
    total int,
    foreign key (id_hab_ocu) references habitaciones_ocupadas(id_hab_ocu)
		on update cascade
        on delete cascade
);
create table servicio(
	id_servicio int primary key auto_increment not null,
    nombre varchar(30) not null,
    valor int not null
);
create table total_servicios(
	id_detalle int not null,
    id_servicio int not null,
    fecha_hora datetime not null,
    foreign key (id_detalle) references detalle_servicios(id_detalle)
		on update cascade
        on delete cascade,
	foreign key (id_servicio) references servicio(id_servicio)
		on update cascade
        on delete cascade
);
create table factura(
	id_factura int primary key auto_increment not null,
    id_registro int not null,
    cod_cliente int not null,
    total int,
     foreign key(id_registro) references registro_alquiler (id_registro)
		on update cascade
        on delete cascade,
	 foreign key(cod_cliente) references cliente(cod_cliente)
		on update cascade
        on delete cascade
);
create table pago(
	id_pago int primary key auto_increment not null,
    id_factura int not null,
    fecha datetime not null,
    monto int not null,
    concepto varchar(1) not null, -- concepto de que se paga, D si es por deposito de reserva, A si por parte de alquiler
    tipo varchar(1) not null, -- tipo de pago, C si es al contado, T si es por tarjeta o transaccion bancaria
    foreign key(id_factura) references factura(id_factura)
		on update cascade
        on delete cascade
);
create table registro_inventario(
	codigo_inventario int primary key auto_increment not null,
    cod_empleado int not null,
    fecha_registro date not null,
    foreign key(cod_empleado) references empleado(cod_empleado)
		on update cascade
        on delete cascade
);
create table articulos(
	id_articulo int primary key not null,
    nombre varchar(30) not null
);
create table inventario_articulos(
	codigo_inventario int not null,
    id_articulo int not null,
    cantidad int not null,
    foreign key(codigo_inventario) references registro_inventario(codigo_inventario)
		on update cascade
        on delete cascade,
   foreign key(id_articulo) references articulos(id_articulo)
		on update cascade
        on delete cascade
);