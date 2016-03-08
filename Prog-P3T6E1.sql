DROP TABLE centro CASCADE CONSTRAINTS;
DROP TABLE Direccion CASCADE CONSTRAINTS;
DROP TABLE UsuarioLoging CASCADE CONSTRAINTS;
DROP TABLE trabajadores CASCADE CONSTRAINTS;

CREATE TABLE centro
  (
    id        NUMBER (2)
      GENERATED ALWAYS AS IDENTITY 
                        MINVALUE 1 
                        MAXVALUE 99
                        INCREMENT BY 1 
                        START WITH 1  
                        NOORDER  
                        NOCYCLE  NOT NULL ENABLE
      CONSTRAINT centro_id_pk PRIMARY KEY ,
    nombre    VARCHAR2 (30) NOT NULL ,
    calle     VARCHAR2 (30) ,
    numero    NUMBER (2) ,
    cp        NUMBER (5) ,
    ciudad    VARCHAR2 (15) ,
    provincia VARCHAR2 (40) ,
    telefono  VARCHAR2 (9)
  ) ;
  INSERT INTO centro (NOMBRE, CALLE, NUMERO, CP, CIUDAD, PROVINCIA, TELEFONO) VALUES ('CENTRO1', 'CALLE1', 4, 01002, 'VITORIA', 'ÁLAVA', '987654321');
  INSERT INTO centro (NOMBRE, CALLE, NUMERO, CP, CIUDAD, PROVINCIA, TELEFONO) VALUES ('CENTRO2', 'CALLE2', 8, 01003, 'DONOSTIA','GUIPUZCUA', '963254125');

CREATE TABLE Direccion (
calle VARCHAR2(20),
portal VARCHAR2(3),
piso VARCHAR2(3),
mano VARCHAR(5),
codigo NUMBER(5),
CONSTRAINT direc_cod_pk PRIMARY KEY(codigo));

INSERT INTO Direccion VALUES('SALBURUA', '12', '4', 'drch', 01);
INSERT INTO Direccion VALUES('POLVORIN', '5', '11', 'izq', 02);

CREATE TABLE UsuarioLoging(
username VARCHAR2(20),
contraseña CHAR(10) NOT NULL,
CONSTRAINT uslog_usname_pk PRIMARY KEY(username)
);

INSERT INTO UsuarioLoging VALUES('u1', 'u1');
INSERT INTO UsuarioLoging VALUES('u2', 'u2');

CREATE TABLE trabajadores
  (
    dni         VARCHAR2 (9) CONSTRAINT trab_dni_pk PRIMARY KEY ,
    nombre      VARCHAR2 (20) CONSTRAINT NNC_trab_nombre NOT NULL ,
    apellido1   VARCHAR2 (30) CONSTRAINT NNC_trab_apellido1 NOT NULL,
    apellido2   VARCHAR2 (30) CONSTRAINT NNC_trab_apellido2 NOT NULL,
    telMovil    VARCHAR2 (9) ,
    telPersonal VARCHAR2 (9) ,
    fechaNac    DATE ,
    salario     NUMBER (5),
    codigoDirecc      NUMBER(5),
    username    VARCHAR2(20),
    id_centro   NUMBER(2),
    CONSTRAINT trab_direc_cod_fk FOREIGN KEY(codigoDirecc) REFERENCES Direccion (codigo),
    CONSTRAINT trab_us_fk FOREIGN KEY(username) REFERENCES UsuarioLoging (username),
    CONSTRAINT trab_centro_fk FOREIGN KEY(id_centro) REFERENCES centro(id)
  ) ;
  
  INSERT INTO TRABAJADORES (dni, nombre, apellido1, apellido2, telMovil, telPersonal, fechaNac, salario, codigoDirecc, username, id_centro)
  VALUES('74586254H', 'Pepe', 'López', 'Díaz', '958753625', '668210456', TO_DATE('15/08/74', 'dd/mm/yyyy'), 15000, 01, 'u1', 1);
  
  INSERT INTO TRABAJADORES
  VALUES('72365124L', 'Juan', 'Valdo', 'Chus', '965354712', '699652433', TO_DATE('17/07/96', 'DD/MM/YYYY'), 20000, 02,'u2', 2);
 

  