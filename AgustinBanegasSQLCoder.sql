create database if not exists db_AgustinBanegasSQLCoder;

use db_AgustinBanegasSQLCoder;
create table Comercio(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    calle varchar(45) default null,
    numero int(11) default null,
    codigo_postal int(11) default null,
    localidad varchar(45) default null,
    provincia varchar(45) default null,
    pais varchar(45) default null,
    cuil_cuit varchar(45) default null,
    telefono int(11) default null,
    usuario varchar(45) default null,
    email varchar(45) default null,
    pw varchar(45) default null,
    verificado int(11) default null,
    primary key(id)
);

create table Usuario(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    apellido varchar(45) default null,
    calle varchar(45) default null,
    numero int(11) default null,
    codigo_postal int(11) default null,
    localidad varchar(45) default null,
    provincia varchar(45) default null,
    pais varchar(45) default null,
    telefono int(11) default null,
    usuario varchar(45) default null,
    email varchar(45) default null,
    pw varchar(45) default null,
    verificado int(11) default null,
    primary key(id)
);

create table Categoria(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    primary key(id)
);

create table Producto(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    descripcion varchar(45) default null,
    precio int(11) default null,
    codigo_de_barra varchar(45) default null,
    id_categoria int(11) default null,
    primary key(id),
    foreign key(id_categoria) references Categoria(id)
);

create table Stock(
	id int(11) not null auto_increment,
    stock int(11) default null,
    id_comercio int(11) default null,
    id_producto int(11) default null,
    primary key(id),
    foreign key(id_comercio) references Comercio(id),
    foreign key(id_producto) references Producto(id)
);

create table Venta(
	id int(11) not null auto_increment,
    importe_de_compra int(11) default null,
    puntuacion int(11) default null,
    comentario varchar(45) default null,
    id_comercio int(11) default null,
    id_usuario int(11) default null,
    id_producto int(11) default null,
    primary key(id),
    foreign key(id_comercio) references Comercio(id),
    foreign key(id_usuario) references Usuario(id),
    foreign key(id_producto) references Producto(id)
);