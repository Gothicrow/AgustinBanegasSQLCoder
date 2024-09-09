-- Eliminación de Base de datos si existe

drop database db_agustinbanegassqlcoder;

-- Creación de base de datos

create database if not exists db_AgustinBanegasSQLCoder;

use db_AgustinBanegasSQLCoder;

-- Creación de tablas

create table if not exists Comercio(
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

create table if not exists Usuario(
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

create table if not exists Categoria(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    primary key(id)
);

create table if not exists Producto(
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    descripcion varchar(45) default null,
    precio int(11) default null,
    codigo_de_barra varchar(45) default null,
    id_categoria int(11) default null,
    primary key(id),
    foreign key(id_categoria) references Categoria(id)
);

create table if not exists Stock(
	id int(11) not null auto_increment,
    stock int(11) default null,
    id_comercio int(11) default null,
    id_producto int(11) default null,
    primary key(id),
    foreign key(id_comercio) references Comercio(id),
    foreign key(id_producto) references Producto(id)
);

create table if not exists Venta(
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

-- Inserción de datos en tablas

insert into comercio (id, nombre, calle, numero, codigo_postal, localidad, provincia, pais, cuil_cuit, telefono, usuario, email, pw, verificado) values
	(1, 'La Comiqueria', 'Montevideo', 845, 3215, 'Lanus', 'Buenos Aires', 'Argentina', '', '1126345743', 'LaComiqueria', 'lacmqria@mail.com', 'cmqria123', 0),
    (2, "Manga's Store", 'Paris', 6842, 6542, 'Campana', 'Buenos Aires', 'Argentina', '', '1176585794', 'MangaStore', 'mangastore@mail.com', 'mngstr123', 0),
    (3, 'Otaku Center', 'Ecuador', 1354, 1357, 'Parque Patricios', 'Buenos Aires', 'Argentina', '', '1179585498', 'OtakuCenter', 'otakucnt@mail.com', 'otakucnt123', 1),
    (4, 'Kawaii Store', 'Av.Rivadavia', 6215, 6845, 'Belgrano', 'Buenos Aires', 'Argentina', '', '1164764845', 'KawaiiStore', 'kawaiistr@mail.com', 'kwiistr123', 1),
    (5, 'Accesorios Anime', '3 de Octubre', 368, 6235, 'San Isidro', 'Buenos Aires', 'Argentina', '', '1156484535', 'AccsAnime', 'accsAnime1@mail.com', 'accsanme123', 0);

insert into usuario (id, nombre, apellido, calle, numero, codigo_postal, localidad, provincia, pais, telefono, usuario, email, pw, verificado) values
	(1, 'Mario', 'Fernandez', 'Av. Sarmiento', 1357, 1368, 'Moron', 'Buenos Aires', 'Argentina', '1134672367', 'MFernandez', 'maferdez@mail.com', 'MaFer123', 0),
    (2, 'Felipe', 'Gutierrez', 'Av. Libertador', 814, 4963, 'Quilmes', 'Buenos Aires', 'Argentina', '1186462589', 'FGutierrez', 'feGutierrez@mail.com', 'FeGut123', 1),
    (3, 'Hector', 'Rivadavia', '137', 2356, 3457, 'Caballito', 'Buenos Aires', 'Argentina', '1148751265', 'HRivadavia', 'HecRivadavia@mail.com', 'HecRiv123', 0),
    (4, 'Ramiro', 'Gonzalez', 'Paraguay', 486, 6425, 'Lanus', 'Buenos Aires', 'Argentina', '1178456852', 'RGonzalez', 'RamGonzlez@mail.com', 'RaGzl123', 0),
    (5, 'Gustavo', 'Vergara', 'Av. Mitre', 6485, 8754, 'Palermo', 'Buenos Aires', 'Argentina', '1187423596', 'GVergara', 'GusVergara@mail.com', 'GusV12345', 1);

insert into categoria (id, nombre) values
	(1, 'Manga'),
    (2, 'Figura Coleccionable'),
    (3, 'Naipes'),
    (4, 'Accesorio'),
    (5, 'Ropa');

insert into producto (id, nombre, descripcion, precio, codigo_de_barra, id_categoria) values
	(1, 'My Hero Academia - Tomo 1', 'Tomo 1 del manga My Hero Academia', 2500, '100000000000', 1),
	(2, 'Figura Goku 20 CM', 'Figura coleccionable Goku de 20cm de alto', 8000, '200000000000', 2),
	(3, 'Llavero Naruto', 'Llavero Naruto', 1200, '300000000000', 4),
	(4, 'One Piece - Tomo 13', 'Tomo 13 del manga One Piece', 2500, '400000000000', 1),
	(5, 'Remera Sasuke', 'Remera Sasuke talle M', 3500, '500000000000', 5);
    
insert into stock (id, stock, id_comercio, id_producto) values
	(1, 5, 3, 1),
    (2, 3, 1, 2),
    (3, 7, 2, 4),
    (4, 2, 5, 3),
    (5, 6, 4, 5);
    
insert into venta (id, importe_de_compra, puntuacion, comentario, id_comercio, id_usuario, id_producto) values
	(1, 2500, 5, 'Buena atencion', 1, 3, 4),
    (2, 8000, 4, 'Bien', 2, 5, 2),
    (3, 1200, 2, 'Mala actitud del vendedor', 3, 1, 3),
    (4, 3500, 4, 'No tenian el producto que buscaba', 5, 2, 5),
    (5, 2500, 3, 'Desorganizacion para encontrar el producto', 3, 4, 1);
    
-- Creación de Vistas

create or replace view detalle_comercios as
	select nombre, concat(calle, ' ', numero, ', ', localidad, ', ', provincia, ', ', pais) as domicilio, telefono, email
    from comercio;

create or replace view detalle_usuario as
	select concat(nombre, ' ', apellido) as nombre_completo, concat(calle, ' ', numero, ', ', localidad, ', ', provincia, ', ', pais) as domicilio, telefono, email
    from usuario;
    
-- Creacion de Funciones

delimiter $$
create function f_verificar_login (mail char(50), contraseña char(50))
returns char(50)
reads sql data
begin
	declare usuario_count int;
	declare comercio_count int;
	declare existe int;
    
	set usuario_count = (select count(*) from usuario where email = mail and pw = contraseña);
	set comercio_count = (select count(*) from comercio where email = mail and pw = contraseña);
    
    set existe = usuario_count + comercio_count;
    
    return if(existe > 0, 'Usuario correcto', 'Usuario incorrecto');
    
end$$

select f_verificar_login('maferdez@mail.com','MaFer123');
select f_verificar_login('maferdez@mail.com','MaFer1234');

delimiter $$
create function existe_usuario_o_email (username char(50), mail char(50))
returns char(50)
reads sql data
begin
	declare usuario_username int;
	declare usuario_email int;
	declare comercio_username int;
	declare comercio_email int;
    declare mensaje char(50);
    
	set usuario_username = (select count(*) from usuario where usuario = username);
	set usuario_email = (select count(*) from usuario where email = mail);
	set comercio_username = (select count(*) from comercio where usuario = username);
	set comercio_email = (select count(*) from comercio where email = mail);
    
    if usuario_username > 0 or comercio_username > 0 then
		set mensaje = 'El nombre de usuario existe';
    else
		if usuario_email > 0 or comercio_email > 0 then
			set mensaje = 'El email existe';
		else
			set mensaje = 'null';
		end if;
	end if;
    
    return mensaje;
end$$

select existe_usuario_o_email('MaFer123','maferdez@mail.com');
select existe_usuario_o_email('MFernandez','maferdez@mail.com.ar');
select existe_usuario_o_email('MFernandez1','maferdez@mail.com.ar');


-- Creación Store Precedure

delimiter $$
create procedure ´obtener_comercios_cercanos´ (in localidad char(50))
begin
	set @clausula = concat("select * from comercio where localidad = '", localidad, "'");
	prepare ejecutarSQL from @clausula;
	execute ejecutarSQL;
	deallocate prepare ejecutarSQL;
end$$

call db_agustinbanegassqlcoder.´obtener_comercios_cercanos´('Lanus');



delimiter $$
create procedure ´creacion_usuario´ (in nombre char(50), in apellido char(50), in calle char(50), in numero int, in codigo_postal int, in localidad char(50), in provincia char(50), in pais char(50), in telefono int, in usuario char(50), in email char(50), in pw char(50))
begin
	set @clausula = concat(
		"insert into usuario (nombre, apellido, calle, numero, codigo_postal, localidad, provincia, pais, telefono, usuario, email, pw, verificado) values
		('",nombre,"', '",apellido,"', '",calle,"', ", numero,", ",codigo_postal,", '",localidad,"', '",provincia,"', '",pais,"', '", telefono,"', '",usuario,"', '",email,"', '",pw,"', 0);"
    );
	prepare ejecutarSQL from @clausula;
	execute ejecutarSQL;
	deallocate prepare ejecutarSQL;
end$$

call db_agustinbanegassqlcoder.´creacion_usuario´('Pepe', 'Gomez', '15', 2154, 3254, 'Avellaneda', 'Buenos Aires', 'Argentina', 1132164549, 'ppgomez', 'ppgomez@mail.com', 'ppgmz123');


-- Creación de Triggers


create table if not exists auditoriaUsuario(
	id_auditoria int(11) not null primary key auto_increment,
    id int(11) not null,
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
    verificado int(11) default null
);

create trigger if not exists auditoria_insercion_usuario
	after insert on usuario
    for each row
    insert into auditoriaUsuario values
    (default, new.id, new.nombre, new.apellido, new.calle, new.numero, new.codigo_postal, new.localidad, new.provincia, new.pais, new.telefono, new.usuario, new.email, new.pw, new.verificado)

-- Insertar auditoria usuario

insert into usuario (id, nombre, apellido, calle, numero, codigo_postal, localidad, provincia, pais, telefono, usuario, email, pw, verificado) values
	(10, 'Ernesto', 'Saavedra', 'Av. Brasil', 6413, 4578, 'La Plata', 'Buenos Aires', 'Argentina', '1165498723', 'ErSaavedra', 'ErSaav@mail.com', 'ErSaav123', 0);



create table if not exists auditoriaProducto(
	id_auditoria int(11) not null primary key auto_increment,
	id int(11) not null,
    nombre varchar(45) default null,
    descripcion varchar(45) default null,
    precio int(11) default null,
    codigo_de_barra varchar(45) default null,
    id_categoria int(11) default null
);

create trigger if not exists auditoria_insercion_producto
	before insert on producto
    for each row
    insert into auditoriaProducto values
    (default, new.id, new.nombre, new.descripcion, new.precio, new.codigo_de_barra, new.id_categoria)

-- Insertar auditoria producto

insert into producto (id, nombre, descripcion, precio, codigo_de_barra, id_categoria) values
	(6, 'My Hero Academia - Tomo 2', 'Tomo 2 del manga My Hero Academia', 2500, '100000000006', 1);