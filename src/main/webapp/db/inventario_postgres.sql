
CREATE TABLE departamento
(
  id numeric NOT NULL,
  nombre character varying(200),
  CONSTRAINT "PK_DEPARTAMENTO" PRIMARY KEY (id)
);

CREATE TABLE tienda
(
  id numeric NOT NULL,
  nombre character varying(200),
  idDepartamento numeric,
  CONSTRAINT "PK_TIENDA" PRIMARY KEY (id),
  CONSTRAINT "FK_DEPARTAMENTO" FOREIGN KEY (idDepartamento)
      REFERENCES departamento (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE area
(
  id numeric NOT NULL,
  nombre character varying(200),
  idTienda numeric,
  CONSTRAINT "PK_AREA" PRIMARY KEY (id),
  CONSTRAINT "FK_TIENDA" FOREIGN KEY (idTienda)
      REFERENCES tienda (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE usuario
(
  id numeric NOT NULL,
  codigo character varying(150),
  nombre character varying(200),
  password character varying(200),
  CONSTRAINT "PK_USUARIO" PRIMARY KEY (id)
);


CREATE SEQUENCE seq_producto START 1;

CREATE TABLE producto
(
  id numeric  NOT NULL ,
  codigo character varying(200),
  descripcion character varying(200),
  idArea numeric,
  idUsuario numeric,
  CONSTRAINT "PK_PRODUCTO" PRIMARY KEY (id),
  CONSTRAINT "FK_AREA" FOREIGN KEY (idArea)
      REFERENCES area (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "FK_USUARIO" FOREIGN KEY (idUsuario)
      REFERENCES usuario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


insert  into departamento(id,nombre) values (1,'San Borja'),(2,'San Miguel'),(3,'Lince');
insert  into tienda(id,nombre,idDepartamento) values (1,'Almacen',1),(2,'Nueva Era',1),(3,'Almacen',2),(4,'Milenio',3);

insert  into area (id,nombre,idTienda) values (1,'Panaderia',1),(2,'Atencion al Cliente',2),(3,'Panaderia',2),(4,'Mostrador',3);
insert  into usuario(id,codigo,nombre,password) values (1,'admin','Administrador','123456');

insert  into producto(id,codigo,descripcion,idArea,idUsuario) values (1,'0001011115','TAPERS222222222222',4,NULL);


