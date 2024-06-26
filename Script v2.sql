-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-05-23 21:57:02 BRT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE T_CATEGORIA (
    id_categoria NUMBER NOT NULL,
    nm_categoria VARCHAR2(50)
);

ALTER TABLE T_CATEGORIA ADD CONSTRAINT PK_CATEGORIA PRIMARY KEY ( id_categoria );

CREATE TABLE T_CLIENTE (
    id_cliente            NUMBER NOT NULL,
    nr_cnpj               NUMBER NOT NULL,
    nm_razao_social       VARCHAR2(100) NOT NULL,
    nr_telefone           NUMBER(15) NOT NULL,
    ds_email              VARCHAR2(50) NOT NULL,
    nm_cidade             VARCHAR2(10) NOT NULL,
    nm_estado             VARCHAR2(2) NOT NULL,
    nm_veiculos_fronteira NUMBER NOT NULL,
    ds_segmento           VARCHAR2(30)
);

ALTER TABLE T_CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY ( id_cliente );

CREATE TABLE T_COMBUSTIVEL (
    id_combustivel NUMBER NOT NULL,
    nm_combustivel VARCHAR2(30)
);

ALTER TABLE T_COMBUSTIVEL ADD CONSTRAINT PK_COMBUSTIVEL PRIMARY KEY ( id_combustivel );

CREATE TABLE T_CONTRATO (
    id_contrato NUMBER NOT NULL,
    id_cliente  NUMBER,
    id_veiculo  NUMBER,
    vl_contrato LONG NOT NULL,
    dt_criacao  TIMESTAMP NOT NULL,
    dt_validade TIMESTAMP
);

ALTER TABLE T_CONTRATO ADD CONSTRAINT PK_CONTRATO PRIMARY KEY ( id_contrato );

CREATE TABLE T_MARCA (
    id_marca    NUMBER NOT NULL,
    nm_curto    VARCHAR2(5) NOT NULL,
    nm_completo VARCHAR2(20)
);

ALTER TABLE T_MARCA ADD CONSTRAINT PK_MARCA PRIMARY KEY ( id_marca );

CREATE TABLE T_TRANSMISSAO (
    id_transmissao NUMBER NOT NULL,
    nm_transmissao VARCHAR2(30)
);

ALTER TABLE T_TRANSMISSAO ADD CONSTRAINT PK_TRANSMISSAO PRIMARY KEY ( id_transmissao );

CREATE TABLE T_VEICULO (
    id_veiculo         NUMBER NOT NULL,
    id_marca           NUMBER,
    id_categoria       NUMBER,
    id_combustivel     NUMBER,
    id_transmissao     NUMBER,
    nm_modelo          VARCHAR2(100) NOT NULL,
    nr_placa           VARCHAR2(10) NOT NULL,
    nr_quilometragem   LONG,
    nr_ano             NUMBER,
    ds_ar_condicionado NUMBER(1),
    ds_size            NUMBER,
    qt_portas          NUMBER,
    ds_cor             VARCHAR2(50)
);

ALTER TABLE T_VEICULO ADD CONSTRAINT PK_VEICULO PRIMARY KEY ( id_veiculo );

ALTER TABLE T_VEICULO
    ADD CONSTRAINT FK_T_CATEGORIA FOREIGN KEY ( id_categoria )
        REFERENCES T_CATEGORIA ( id_categoria );

ALTER TABLE T_CONTRATO
    ADD CONSTRAINT FK_T_CLIENTE FOREIGN KEY ( id_cliente )
        REFERENCES T_CLIENTE ( id_cliente );

ALTER TABLE T_VEICULO
    ADD CONSTRAINT FK_T_COMBUSTIVEL FOREIGN KEY ( id_combustivel )
        REFERENCES T_COMBUSTIVEL ( id_combustivel );

ALTER TABLE T_VEICULO
    ADD CONSTRAINT FK_T_MARCA FOREIGN KEY ( id_marca )
        REFERENCES T_MARCA ( id_marca );

ALTER TABLE T_VEICULO
    ADD CONSTRAINT FK_T_TRANSMISSAO FOREIGN KEY ( id_transmissao )
        REFERENCES T_TRANSMISSAO ( id_transmissao );

ALTER TABLE T_CONTRATO
    ADD CONSTRAINT FK_T_VEICULO FOREIGN KEY ( id_veiculo )
        REFERENCES T_VEICULO ( id_veiculo );

CREATE SEQUENCE T_CATEGORIA_id_categoria_seq START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_CATEGORIA_id_categoria_trg BEFORE
    INSERT ON T_CATEGORIA
    FOR EACH ROW
    WHEN ( new.id_categoria IS NULL )
BEGIN
    :new.id_categoria := T_CATEGORIA_id_categoria_seq.nextval;
END;
/

CREATE SEQUENCE T_CLIENTE_id_cliente_seq START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_CLIENTE_id_cliente_trg BEFORE
    INSERT ON T_CLIENTE
    FOR EACH ROW
    WHEN ( new.id_cliente IS NULL )
BEGIN
    :new.id_cliente := T_CLIENTE_id_cliente_seq.nextval;
END;
/

CREATE SEQUENCE T_COMBUSTIVEL_id_combustivel START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_COMBUSTIVEL_id_combustivel BEFORE
    INSERT ON T_COMBUSTIVEL
    FOR EACH ROW
    WHEN ( new.id_combustivel IS NULL )
BEGIN
    :new.id_combustivel := T_COMBUSTIVEL_id_combustivel.nextval;
END;
/

CREATE SEQUENCE T_CONTRATO_id_contrato_seq START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_CONTRATO_id_contrato_trg BEFORE
    INSERT ON T_CONTRATO
    FOR EACH ROW
    WHEN ( new.id_contrato IS NULL )
BEGIN
    :new.id_contrato := T_CONTRATO_id_contrato_seq.nextval;
END;
/

CREATE SEQUENCE T_MARCA_id_marca_seq START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_MARCA_id_marca_trg BEFORE
    INSERT ON T_MARCA
    FOR EACH ROW
    WHEN ( new.id_marca IS NULL )
BEGIN
    :new.id_marca := T_MARCA_id_marca_seq.nextval;
END;
/

CREATE SEQUENCE T_TRANSMISSAO_id_transmissao START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_TRANSMISSAO_id_transmissao BEFORE
    INSERT ON T_TRANSMISSAO
    FOR EACH ROW
    WHEN ( new.id_transmissao IS NULL )
BEGIN
    :new.id_transmissao := T_TRANSMISSAO_id_transmissao.nextval;
END;
/

CREATE SEQUENCE T_VEICULO_id_veiculo_seq START WITH 1 NOCACHE;

CREATE OR REPLACE TRIGGER T_VEICULO_id_veiculo_trg BEFORE
    INSERT ON T_VEICULO
    FOR EACH ROW
    WHEN ( new.id_veiculo IS NULL )
BEGIN
    :new.id_veiculo := T_VEICULO_id_veiculo_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           7
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          7
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
