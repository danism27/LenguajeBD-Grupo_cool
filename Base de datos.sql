-- Eliminar tablas si existen
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DETALLE_FACTURA';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE FACTURAS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CONTACTOS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE REPUESTOS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE VEHICULOS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE OFICINAS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SERVICIOS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE EMPLEADOS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- ID_OFICINA: Columna de tipo INTEGER, equivalente a NUMBER(38) en Oracle.
-- GENERADO AUTOM�TICAMENTE CON AS IDENTITY: La columna usa una secuencia impl�cita para generar valores �nicos autom�ticamente.
-- START WITH 1: El valor inicial de la secuencia es 1.
-- INCREMENT BY 1: Cada nuevo valor generado aumenta en 1 respecto al anterior.
--------------------------------------------------------------------------------

-- CONSTRAINT PK_OFICINAS PRIMARY KEY (ID_OFICINA):
-- Define la restricci�n de clave primaria llamada PK_OFICINAS en la columna ID_OFICINA.
-- Garantiza que los valores en ID_OFICINA sean �nicos y no nulos.
-- Crea autom�ticamente un �ndice para mejorar el rendimiento en b�squedas y consultas.
--------------------------------------------------------------------------------




/*
**********************************************************************
*                                                                    *
*                            TABLAS                                  *
*                                                                    *
**********************************************************************
*/





-- Crear tabla de contactos
CREATE TABLE CONTACTOS(
    ID_CONTACTO INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    TIPO_CONTACTO VARCHAR2(50) NOT NULL, -- Cliente, Proveedor, Taller
    COD_CONTACTO INTEGER NOT NULL,
    NOMBRE_CONTACTO VARCHAR2(100) NOT NULL,
    DIRECCION_CONTACTO VARCHAR2(100),
    TELEFONO_CONTACTO VARCHAR2(100),
    EMAIL_CONTACTO VARCHAR2(100),
    CONSTRAINT PK_CONTACTOS PRIMARY KEY (ID_CONTACTO)
);
-- Insertar contactos
SELECT * FROM CONTACTOS;
INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
VALUES ('Cliente', 201, 'Juan Perez', 'Calle Falsa 123', '555-1234', 'juan.perez@example.com');

INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
VALUES ('Proveedor', 202, 'Maria Gomez', 'Avenida Siempre Viva 742', '555-5678', 'maria.gomez@example.com');

INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
VALUES ('Cliente', 203, 'Carlos Sanchez', 'Boulevard de los Sue�os Rotos 99', '555-8765', 'carlos.sanchez@example.com');

INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
VALUES ('Proveedor', 204, 'Ana Martinez', 'Calle Luna 45', '555-4321', 'ana.martinez@example.com');

INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
VALUES ('Cliente', 205, 'Luis Rodriguez', 'Calle Sol 67', '555-9876', 'luis.rodriguez@example.com');
--------------------------------------------------------------------------------
-- Crear tabla de facturas
CREATE TABLE FACTURAS(
    ID_FACTURA INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    COD_FACTURA INTEGER NOT NULL,
    COD_CLIENTE INTEGER NOT NULL,
    FECHA_FACTURA DATE NOT NULL,
    TOTAL_FACTURA NUMBER(10, 2) NOT NULL,
    CONSTRAINT PK_FACTURAS PRIMARY KEY (ID_FACTURA),
    CONSTRAINT FK_FACTURAS_CONTACTOS FOREIGN KEY (COD_CLIENTE) REFERENCES CONTACTOS(ID_CONTACTO)
);
-- Insertar FACTURAS
SELECT * FROM FACTURAS;

INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
VALUES (1001, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1500.00);

INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
VALUES (1002, 3, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2000.00);

INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
VALUES (1003, 5, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 1800.00);

INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
VALUES (1004, 1, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 2200.00);

INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
VALUES (1005, 3, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 2500.00);
--------------------------------------------------------------------------------
-- Crear tabla de repuestos
CREATE TABLE REPUESTOS(
    ID_REPUESTO INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    COD_REPUESTO INTEGER NOT NULL,
    NOMBRE_REPUESTO VARCHAR2(100) NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    NOMBRE_USUARIO VARCHAR2(100),
    CONSTRAINT PK_REPUESTOS PRIMARY KEY (ID_REPUESTO)
);
-- Insertar REPUESTOS
SELECT * FROM REPUESTOS;

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (301, 'Filtro de aire', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (302, 'Bater�a', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (303, 'Aceite de motor', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (304, 'Filtro de combustible', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (305, 'Pastillas de freno', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'admin');

ALTER TABLE REPUESTOS ADD (PRECIO_REPUESTO NUMBER(10, 2));

UPDATE REPUESTOS SET PRECIO_REPUESTO = 2500 WHERE COD_REPUESTO = 301; -- Filtro de aire
UPDATE REPUESTOS SET PRECIO_REPUESTO = 7000 WHERE COD_REPUESTO = 302; -- Bater�a
UPDATE REPUESTOS SET PRECIO_REPUESTO = 5000 WHERE COD_REPUESTO = 303; -- Aceite de motor
UPDATE REPUESTOS SET PRECIO_REPUESTO = 3500 WHERE COD_REPUESTO = 304; -- Filtro de combustible
UPDATE REPUESTOS SET PRECIO_REPUESTO = 4500 WHERE COD_REPUESTO = 305; -- Pastillas de freno

--------------------------------------------------------------------------------
CREATE TABLE DETALLE_FACTURA(
    ID_DETALLE_FACTURA INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    COD_FACTURA INTEGER NOT NULL,
    COD_REPUESTO INTEGER NOT NULL,
    CANTIDAD INTEGER NOT NULL,
    CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY (ID_DETALLE_FACTURA),
    CONSTRAINT FK_DETALLE_FACTURA_FACTURAS FOREIGN KEY (COD_FACTURA) REFERENCES FACTURAS(ID_FACTURA),
    CONSTRAINT FK_DETALLE_FACTURA_REPUESTOS FOREIGN KEY (COD_REPUESTO) REFERENCES REPUESTOS(ID_REPUESTO)
);
-- Insertar DETALLE_FACTURA
SELECT * FROM DETALLE_FACTURA;
INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
VALUES (1, 1, 4);

INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
VALUES (2, 2, 2);

INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
VALUES (3, 3, 6);

INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
VALUES (4, 4, 1);

INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
VALUES (5, 5, 1);
--------------------------------------------------------------------------------
-- Crear tabla de oficinas
CREATE TABLE OFICINAS(
    ID_OFICINA INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    NOMBRE_OFICINA VARCHAR2(50) NOT NULL,
    FECHA_REGISTRO DATE NOT NULL,
    CONSTRAINT PK_OFICINAS PRIMARY KEY (ID_OFICINA)
);
-- Insertar OFICINAS
SELECT * FROM OFICINAS;
INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
VALUES ('Oficina Central', TO_DATE('2023-01-10', 'YYYY-MM-DD'));

INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
VALUES ('Sucursal Norte', TO_DATE('2023-02-15', 'YYYY-MM-DD'));

INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
VALUES ('Sucursal Sur', TO_DATE('2023-03-20', 'YYYY-MM-DD'));

INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
VALUES ('Sucursal Este', TO_DATE('2023-04-25', 'YYYY-MM-DD'));

INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
VALUES ('Sucursal Oeste', TO_DATE('2023-05-30', 'YYYY-MM-DD'));
--------------------------------------------------------------------------------
-- Crear tabla de veh�culos
CREATE TABLE VEHICULOS(
    ID_VEHICULO INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    NUM_PLACA VARCHAR2(100) NOT NULL,
    TIPO_VEHICULO VARCHAR2(100),
    ESTADO_VEHICULO VARCHAR2(100),
    MARCA VARCHAR2(100),
    MODELO VARCHAR2(100),
    FECHA_REGISTRO DATE NOT NULL,
    NOMBRE_USUARIO VARCHAR2(100),
    CONSTRAINT PK_VEHICULOS PRIMARY KEY (ID_VEHICULO)
);
-- Insertar VEHICULOS

SELECT * FROM VEHICULOS;

INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES ('ABC-123', 'Sedan', 'Activo', 'Toyota', 'Corolla', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'admin');

INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES ('DEF-456', 'SUV', 'Activo', 'Honda', 'CR-V', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'admin');

INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES ('GHI-789', 'Truck', 'Inactivo', 'Ford', 'F-150', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 'admin');

INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES ('JKL-012', 'Coupe', 'Activo', 'Chevrolet', 'Camaro', TO_DATE('2023-04-25', 'YYYY-MM-DD'), 'admin');

INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES ('MNO-345', 'Hatchback', 'Activo', 'Volkswagen', 'Golf', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'admin');
--------------------------------------------------------------------------------
-- Crear tabla de servicios
CREATE TABLE SERVICIOS(
    ID_SERVICIO INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    COD_SERVICIO INTEGER NOT NULL,
    NOMBRE_SERVICIO VARCHAR2(100) NOT NULL,
    DESCRIPCION_SERVICIO VARCHAR2(100),
    PRECIO_SERVICIO NUMBER(10, 2) NOT NULL,
    CONSTRAINT PK_SERVICIOS PRIMARY KEY (ID_SERVICIO)
);
-- Insertar SERVICIOS
SELECT * FROM SERVICIOS;

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (101, 'Cambio de Aceite', 'Cambio de aceite de motor', 50.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (102, 'Alineaci�n y Balanceo', 'Servicio de alineaci�n y balanceo de neum�ticos', 75.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (103, 'Lavado de Carro', 'Lavado completo del veh�culo', 25.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (104, 'Revisi�n de Frenos', 'Inspecci�n y ajuste de frenos', 100.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (105, 'Cambio de Bater�a', 'Reemplazo de bater�a del veh�culo', 150.00);
--------------------------------------------------------------------------------
-- Crear tabla de EMPLEADOS
CREATE TABLE EMPLEADOS(
    ID_EMPLEADO INTEGER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    NOMBRE_EMPLEADO VARCHAR2(100) NOT NULL,
    APELLIDO_EMPLEADO VARCHAR2(100) NOT NULL,
    CARGO_EMPLEADO VARCHAR2(100) NOT NULL,
    FECHA_CONTRATACION DATE NOT NULL,
    SALARIO NUMBER(10, 2) NOT NULL,
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (ID_EMPLEADO)
);
-- Insertar EMPLEADOS
SELECT * FROM EMPLEADOS;

INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
VALUES ('Juan', 'Perez', 'Gerente', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 5000.00);

INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
VALUES ('Maria', 'Gomez', 'Asistente', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 3000.00);

INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
VALUES ('Carlos', 'Sanchez', 'Contador', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 4000.00);

INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
VALUES ('Ana', 'Martinez', 'Secretaria', TO_DATE('2023-04-25', 'YYYY-MM-DD'), 2500.00);

INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
VALUES ('Luis', 'Rodriguez', 'Supervisor', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 4500.00);


/*
**********************************************************************
*                                                                    *
*                              CRUD                                  *
*                                                                    *
**********************************************************************
*/
set SERVEROUTPUT on;
-----------------------    CONTACTOS   -----------------------------------------
------------------------    CREAR   --------------------------------------------
SELECT * FROM CONTACTOS;
CREATE OR REPLACE PROCEDURE insert_contacto (
    p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE,
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE,
    p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_direccion_contacto IN CONTACTOS.DIRECCION_CONTACTO%TYPE,
    p_telefono_contacto IN CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_email_contacto IN CONTACTOS.EMAIL_CONTACTO%TYPE
) AS
BEGIN
    INSERT INTO CONTACTOS (TIPO_CONTACTO,COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
    VALUES (p_tipo_contacto,p_cod_contacto, p_nombre_contacto, p_direccion_contacto, p_telefono_contacto, p_email_contacto);
    DBMS_OUTPUT.PUT_LINE('Contacto insertado correctamente');
END;
-- Usar procedure
BEGIN
    insert_contacto(
        p_tipo_contacto => 'Proveedor',
        p_cod_contacto => '207',
        p_nombre_contacto => 'Ana García',
        p_direccion_contacto => 'Avenida Siempre Viva 742',
        p_telefono_contacto => '987654321',
        p_email_contacto => 'ana.garcia@example.com'
    );
END;

------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_contacto (
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE,
    p_tipo_contacto OUT CONTACTOS.TIPO_CONTACTO%TYPE,
    p_nombre_contacto OUT CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_direccion_contacto OUT CONTACTOS.DIRECCION_CONTACTO%TYPE,
    p_telefono_contacto OUT CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_email_contacto OUT CONTACTOS.EMAIL_CONTACTO%TYPE
) AS
BEGIN
    SELECT TIPO_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO
    INTO p_tipo_contacto, p_nombre_contacto, p_direccion_contacto, p_telefono_contacto, p_email_contacto
    FROM CONTACTOS
    WHERE COD_CONTACTO = p_cod_contacto;
END;
-- Usar procedure
DECLARE
    v_tipo_contacto CONTACTOS.TIPO_CONTACTO%TYPE;
    v_nombre_contacto CONTACTOS.NOMBRE_CONTACTO%TYPE;
    v_direccion_contacto CONTACTOS.DIRECCION_CONTACTO%TYPE;
    v_telefono_contacto CONTACTOS.TELEFONO_CONTACTO%TYPE;
    v_email_contacto CONTACTOS.EMAIL_CONTACTO%TYPE;
BEGIN
    get_contacto(
        p_cod_contacto => '206',
        p_tipo_contacto => v_tipo_contacto,
        p_nombre_contacto => v_nombre_contacto,
        p_direccion_contacto => v_direccion_contacto,
        p_telefono_contacto => v_telefono_contacto,
        p_email_contacto => v_email_contacto
    );
    DBMS_OUTPUT.PUT_LINE('Tipo de Contacto: ' || v_tipo_contacto);
    DBMS_OUTPUT.PUT_LINE('Nombre de Contacto: ' || v_nombre_contacto);
    DBMS_OUTPUT.PUT_LINE('Dirección de Contacto: ' || v_direccion_contacto);
    DBMS_OUTPUT.PUT_LINE('Teléfono de Contacto: ' || v_telefono_contacto);
    DBMS_OUTPUT.PUT_LINE('Email de Contacto: ' || v_email_contacto);
END;
----------------------    ACTUALIZAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE update_contacto (
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE,
    p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE,
    p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_direccion_contacto IN CONTACTOS.DIRECCION_CONTACTO%TYPE,
    p_telefono_contacto IN CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_email_contacto IN CONTACTOS.EMAIL_CONTACTO%TYPE
) AS
BEGIN
    UPDATE CONTACTOS
    SET TIPO_CONTACTO = p_tipo_contacto,
        NOMBRE_CONTACTO = p_nombre_contacto,
        DIRECCION_CONTACTO = p_direccion_contacto,
        TELEFONO_CONTACTO = p_telefono_contacto,
        EMAIL_CONTACTO = p_email_contacto
    WHERE COD_CONTACTO = p_cod_contacto;
    DBMS_OUTPUT.PUT_LINE('Contacto actualizado correctamente');
END;

-- Usar procedure

BEGIN
    update_contacto(
        p_cod_contacto => 206,  -- Reemplaza con el COD_CONTACTO existente
        p_tipo_contacto => 'Proveedor',
        p_nombre_contacto => 'Ana García Actualizada',
        p_direccion_contacto => 'Avenida Siempre Viva 742 Actualizada',
        p_telefono_contacto => '987654321',
        p_email_contacto => 'ana.garcia.actualizada@example.com'
    );
END;

------------------------    ELIMINAR   -----------------------------------------

CREATE OR REPLACE PROCEDURE delete_contacto (
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE
) AS
BEGIN
    DELETE FROM CONTACTOS
    WHERE COD_CONTACTO = p_cod_contacto;
    
    DBMS_OUTPUT.PUT_LINE('Contacto eliminado correctamente');
END;

-- usar procedure

BEGIN
    delete_contacto(
        p_cod_contacto => 207  -- Reemplaza con el COD_CONTACTO existente que deseas eliminar
    );
END;

-----------------------    FACTURAS   ------------------------------------------
------------------------    CREAR   --------------------------------------------
SELECT * FROM FACTURAS;

CREATE OR REPLACE PROCEDURE insert_factura (
    p_cod_factura IN FACTURAS.COD_FACTURA%TYPE,
    p_cod_cliente IN FACTURAS.COD_CLIENTE%TYPE,
    p_fecha_factura IN FACTURAS.FECHA_FACTURA%TYPE,
    p_total_factura IN FACTURAS.TOTAL_FACTURA%TYPE
) AS
BEGIN
    INSERT INTO FACTURAS (COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA)
    VALUES (p_cod_factura, p_cod_cliente, p_fecha_factura, p_total_factura);
    
    DBMS_OUTPUT.PUT_LINE('Factura insertada correctamente');
END;

-- Usar procedure

BEGIN
    insert_factura(
        p_cod_factura => 1006,
        p_cod_cliente => 22,  -- Asegúrate de que este COD_CLIENTE existe en CONTACTOS
        p_fecha_factura => DATE '2024-07-23',
        p_total_factura => 1500.50
    );
END;
------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_factura (
    p_id_factura IN FACTURAS.ID_FACTURA%TYPE,
    p_cod_factura OUT FACTURAS.COD_FACTURA%TYPE,
    p_cod_cliente OUT FACTURAS.COD_CLIENTE%TYPE,
    p_fecha_factura OUT FACTURAS.FECHA_FACTURA%TYPE,
    p_total_factura OUT FACTURAS.TOTAL_FACTURA%TYPE,
    p_nombre_contacto OUT CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_telefono_contacto OUT CONTACTOS.TELEFONO_CONTACTO%TYPE
) AS
BEGIN
    SELECT f.COD_FACTURA, f.COD_CLIENTE, f.FECHA_FACTURA, f.TOTAL_FACTURA,
           c.NOMBRE_CONTACTO, c.TELEFONO_CONTACTO
    INTO p_cod_factura, p_cod_cliente, p_fecha_factura, p_total_factura,
         p_nombre_contacto, p_telefono_contacto
    FROM FACTURAS f
    JOIN CONTACTOS c ON f.COD_CLIENTE = c.ID_CONTACTO
    WHERE f.ID_FACTURA = p_id_factura;

    DBMS_OUTPUT.PUT_LINE('Factura y contacto encontrados correctamente.');
END;

DECLARE
    v_cod_factura FACTURAS.COD_FACTURA%TYPE;
    v_cod_cliente FACTURAS.COD_CLIENTE%TYPE;
    v_fecha_factura FACTURAS.FECHA_FACTURA%TYPE;
    v_total_factura FACTURAS.TOTAL_FACTURA%TYPE;
    v_nombre_contacto CONTACTOS.NOMBRE_CONTACTO%TYPE;
    v_telefono_contacto CONTACTOS.TELEFONO_CONTACTO%TYPE;
BEGIN
    get_factura(
        p_id_factura => 21,  -- Reemplaza con un ID_FACTURA existente
        p_cod_factura => v_cod_factura,
        p_cod_cliente => v_cod_cliente,
        p_fecha_factura => v_fecha_factura,
        p_total_factura => v_total_factura,
        p_nombre_contacto => v_nombre_contacto,
        p_telefono_contacto => v_telefono_contacto
    );
    DBMS_OUTPUT.PUT_LINE('Código de Factura: ' || v_cod_factura);
    DBMS_OUTPUT.PUT_LINE('Código de Cliente: ' || v_cod_cliente);
    DBMS_OUTPUT.PUT_LINE('Fecha de Factura: ' || v_fecha_factura);
    DBMS_OUTPUT.PUT_LINE('Total de Factura: ' || v_total_factura);
    DBMS_OUTPUT.PUT_LINE('Nombre de Contacto: ' || v_nombre_contacto);
    DBMS_OUTPUT.PUT_LINE('Teléfono de Contacto: ' || v_telefono_contacto);
END;
------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_factura (
    p_id_factura IN FACTURAS.ID_FACTURA%TYPE,
    p_cod_factura IN FACTURAS.COD_FACTURA%TYPE,
    p_cod_cliente IN FACTURAS.COD_CLIENTE%TYPE,
    p_fecha_factura IN FACTURAS.FECHA_FACTURA%TYPE,
    p_total_factura IN FACTURAS.TOTAL_FACTURA%TYPE
) AS
BEGIN
    UPDATE FACTURAS
    SET COD_FACTURA = p_cod_factura,
        COD_CLIENTE = p_cod_cliente,
        FECHA_FACTURA = p_fecha_factura,
        TOTAL_FACTURA = p_total_factura
    WHERE ID_FACTURA = p_id_factura;
    
    DBMS_OUTPUT.PUT_LINE('Factura actualizada correctamente');
END;

-- Usar procedure

BEGIN
    update_factura(
        p_id_factura =>21,  -- ID de la factura a actualizar
        p_cod_factura => '2022',
        p_cod_cliente => 24,  -- Asegúrate de que este COD_CLIENTE existe en CONTACTOS
        p_fecha_factura => DATE '2024-07-23',
        p_total_factura => 32000
    );
END;
------------------------    ELIMINAR   -----------------------------------------

CREATE OR REPLACE PROCEDURE delete_factura (
    p_id_factura IN FACTURAS.ID_FACTURA%TYPE
) AS
BEGIN
    DELETE FROM FACTURAS
    WHERE ID_FACTURA = p_id_factura;
    
    DBMS_OUTPUT.PUT_LINE('Factura eliminada correctamente');
END;

-- Usar procedure

BEGIN
    delete_factura(
        p_id_factura => 21 
    );
END;
--------------------------    FACTURAS   ---------------------------------------
SELECT * FROM REPUESTOS;
------------------------    CREAR   --------------------------------------------

CREATE OR REPLACE PROCEDURE insert_repuesto (
    p_cod_repuesto IN REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN REPUESTOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
    VALUES (p_cod_repuesto, p_nombre_repuesto, p_fecha_registro, p_nombre_usuario);
    
    DBMS_OUTPUT.PUT_LINE('Repuesto insertado correctamente.');
END;

-- Usar procedure

BEGIN
      insert_repuesto(
        p_cod_repuesto => '307',
        p_nombre_repuesto => 'Amortiguador',
        p_fecha_registro => DATE '2024-07-16',
        p_nombre_usuario => 'admin'
    );
END;
------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE,
    p_cod_repuesto OUT REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto OUT REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro OUT REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario OUT REPUESTOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    SELECT COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO
    INTO p_cod_repuesto, p_nombre_repuesto, p_fecha_registro, p_nombre_usuario
    FROM REPUESTOS
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto encontrado correctamente.');
END;

-- Usar procedure

DECLARE
    v_id_repuesto REPUESTOS.ID_REPUESTO%TYPE := 22; 
    v_cod_repuesto REPUESTOS.COD_REPUESTO%TYPE;
    v_nombre_repuesto REPUESTOS.NOMBRE_REPUESTO%TYPE;
    v_fecha_registro REPUESTOS.FECHA_REGISTRO%TYPE;
    v_nombre_usuario REPUESTOS.NOMBRE_USUARIO%TYPE;
BEGIN
    -- Llamada al procedimiento get_repuesto
    get_repuesto(
        p_id_repuesto => v_id_repuesto,
        p_cod_repuesto => v_cod_repuesto,
        p_nombre_repuesto => v_nombre_repuesto,
        p_fecha_registro => v_fecha_registro,
        p_nombre_usuario => v_nombre_usuario
    );

    -- Imprimir los resultados
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || v_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_REPUESTO: ' || v_nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('FECHA_REGISTRO: ' || v_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_USUARIO: ' || v_nombre_usuario);
END;
------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE,
    p_cod_repuesto IN REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN REPUESTOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    UPDATE REPUESTOS
    SET COD_REPUESTO = p_cod_repuesto,
        NOMBRE_REPUESTO = p_nombre_repuesto,
        FECHA_REGISTRO = p_fecha_registro,
        NOMBRE_USUARIO = p_nombre_usuario
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto actualizado correctamente.');
END;

-- Usar procedure

BEGIN
    update_repuesto(
        p_id_repuesto => 22,  
        p_cod_repuesto => '333',
        p_nombre_repuesto => 'Filtro de Aire Modificado',
        p_fecha_registro => DATE '2024-07-24',
        p_nombre_usuario => 'admin_modificado'
    );
END;
------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE
) AS
BEGIN
    DELETE FROM REPUESTOS
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto eliminado correctamente.');
END;

-- Usar procedure

BEGIN
    delete_repuesto(
        p_id_repuesto => 22  -- ID del repuesto a eliminar
    );
END;
-----------------------    DETALLE_FACTURA   -----------------------------------
SELECT * FROM DETALLE_FACTURA;
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_detalle_factura(
    p_cod_factura IN DETALLE_FACTURA.COD_FACTURA%TYPE,
    p_cod_repuesto IN DETALLE_FACTURA.COD_REPUESTO%TYPE,
    p_cantidad IN DETALLE_FACTURA.CANTIDAD%TYPE
) AS
BEGIN
    INSERT INTO DETALLE_FACTURA (COD_FACTURA, COD_REPUESTO, CANTIDAD)
    VALUES (p_cod_factura, p_cod_repuesto, p_cantidad);
    
    DBMS_OUTPUT.PUT_LINE('Detalle de factura insertado correctamente');
END;

-- Usar procedure

BEGIN
    insert_detalle_factura(
        p_cod_factura =>41,   --
        p_cod_repuesto => 23,  --
        p_cantidad => 10
    );
END;

------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_detalle_factura (
    p_id_detalle_factura IN DETALLE_FACTURA.ID_DETALLE_FACTURA%TYPE,
    p_cod_factura OUT DETALLE_FACTURA.COD_FACTURA%TYPE,
    p_cod_repuesto OUT DETALLE_FACTURA.COD_REPUESTO%TYPE,
    p_cantidad OUT DETALLE_FACTURA.CANTIDAD%TYPE
) AS
BEGIN
    SELECT COD_FACTURA, COD_REPUESTO, CANTIDAD
    INTO p_cod_factura, p_cod_repuesto, p_cantidad
    FROM DETALLE_FACTURA
    WHERE ID_DETALLE_FACTURA = p_id_detalle_factura;

    DBMS_OUTPUT.PUT_LINE('Detalle de factura encontrado correctamente');
END;

-- Usar procedure

DECLARE
    v_cod_factura DETALLE_FACTURA.COD_FACTURA%TYPE;
    v_cod_repuesto DETALLE_FACTURA.COD_REPUESTO%TYPE;
    v_cantidad DETALLE_FACTURA.CANTIDAD%TYPE;
BEGIN
    get_detalle_factura(
        p_id_detalle_factura => 25,  -- Reemplaza con un ID_DETALLE_FACTURA existente
        p_cod_factura => v_cod_factura,
        p_cod_repuesto => v_cod_repuesto,
        p_cantidad => v_cantidad
    );
    DBMS_OUTPUT.PUT_LINE('Código de Factura: ' || v_cod_factura);
    DBMS_OUTPUT.PUT_LINE('Código de Repuesto: ' || v_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('Cantidad: ' || v_cantidad);
END;
------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_detalle_factura (
    p_id_detalle_factura IN DETALLE_FACTURA.ID_DETALLE_FACTURA%TYPE,
    p_cod_factura IN DETALLE_FACTURA.COD_FACTURA%TYPE,
    p_cod_repuesto IN DETALLE_FACTURA.COD_REPUESTO%TYPE,
    p_cantidad IN DETALLE_FACTURA.CANTIDAD%TYPE
) AS
BEGIN
    UPDATE DETALLE_FACTURA
    SET COD_FACTURA = p_cod_factura,
        COD_REPUESTO = p_cod_repuesto,
        CANTIDAD = p_cantidad
    WHERE ID_DETALLE_FACTURA = p_id_detalle_factura;

    DBMS_OUTPUT.PUT_LINE('Detalle de factura actualizado correctamente');
END;

-- Usar procedure

BEGIN
    update_detalle_factura(
        p_id_detalle_factura => 5,  -- 
        p_cod_factura => 1,      --
        p_cod_repuesto => 1,     -- 
        p_cantidad => 32
    );
END;
------------------------    ELIMINAR   -----------------------------------------

CREATE OR REPLACE PROCEDURE delete_detalle_factura (
    p_id_detalle_factura IN DETALLE_FACTURA.ID_DETALLE_FACTURA%TYPE
) AS
BEGIN
    DELETE FROM DETALLE_FACTURA
    WHERE ID_DETALLE_FACTURA = p_id_detalle_factura;
    
    DBMS_OUTPUT.PUT_LINE('Detalle de factura eliminado correctamente');
END;

-- Usar procedure

BEGIN
    delete_detalle_factura(
        p_id_detalle_factura => 2  -- Reemplaza con un ID_DETALLE_FACTURA existente
    );
END;

--------------------------    FACTURAS   ---------------------------------------
SELECT * FROM OFICINAS;
------------------------    CREAR   --------------------------------------------

CREATE OR REPLACE PROCEDURE insert_oficina (
    p_nombre_oficina IN OFICINAS.NOMBRE_OFICINA%TYPE,
    p_fecha_registro IN OFICINAS.FECHA_REGISTRO%TYPE
) AS
BEGIN
    INSERT INTO OFICINAS (NOMBRE_OFICINA, FECHA_REGISTRO)
    VALUES (p_nombre_oficina, p_fecha_registro);
    
    DBMS_OUTPUT.PUT_LINE('Oficina insertada correctamente');
END;

-- Usar procedure

BEGIN
    insert_oficina(
        p_nombre_oficina => 'Oficina Central',
        p_fecha_registro => DATE '2024-07-23'
    );
END;
------------------------    LEER   ---------------------------------------------

CREATE OR REPLACE PROCEDURE get_oficina (
    p_id_oficina IN OFICINAS.ID_OFICINA%TYPE,
    p_nombre_oficina OUT OFICINAS.NOMBRE_OFICINA%TYPE,
    p_fecha_registro OUT OFICINAS.FECHA_REGISTRO%TYPE
) AS
BEGIN
    SELECT NOMBRE_OFICINA, FECHA_REGISTRO
    INTO p_nombre_oficina, p_fecha_registro
    FROM OFICINAS
    WHERE ID_OFICINA = p_id_oficina;

    DBMS_OUTPUT.PUT_LINE('Oficina encontrada correctamente');
END;

-- Usar procedure

DECLARE
    v_nombre_oficina OFICINAS.NOMBRE_OFICINA%TYPE;
    v_fecha_registro OFICINAS.FECHA_REGISTRO%TYPE;
BEGIN
    get_oficina(
        p_id_oficina => 1,  -- 
        p_nombre_oficina => v_nombre_oficina,
        p_fecha_registro => v_fecha_registro
    );
    DBMS_OUTPUT.PUT_LINE('Nombre de Oficina: ' || v_nombre_oficina);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || v_fecha_registro);
END;

------------------------    ACTUALIZAR   ---------------------------------------

CREATE OR REPLACE PROCEDURE update_oficina (
    p_id_oficina IN OFICINAS.ID_OFICINA%TYPE,
    p_nombre_oficina IN OFICINAS.NOMBRE_OFICINA%TYPE,
    p_fecha_registro IN OFICINAS.FECHA_REGISTRO%TYPE
) AS
BEGIN
    UPDATE OFICINAS
    SET NOMBRE_OFICINA = p_nombre_oficina,
        FECHA_REGISTRO = p_fecha_registro
    WHERE ID_OFICINA = p_id_oficina;
    
    DBMS_OUTPUT.PUT_LINE('Oficina actualizada correctamente');
END;

-- Usar procedure

BEGIN
    update_oficina(
        p_id_oficina => 1,  -- Reemplaza con un ID_OFICINA existente
        p_nombre_oficina => 'Oficina Regional',
        p_fecha_registro => DATE '2024-07-24'
    );
END;



------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_oficina (
    p_id_oficina IN OFICINAS.ID_OFICINA%TYPE
) AS
BEGIN
    DELETE FROM OFICINAS
    WHERE ID_OFICINA = p_id_oficina;
    
    DBMS_OUTPUT.PUT_LINE('Oficina eliminada correctamente');
END;

-- Usar procedure

BEGIN
    delete_oficina(
        p_id_oficina => 1  -- Reemplaza con un ID_OFICINA existente
    );
END;
--------------------------    VEHICULOS   ---------------------------------------
SELECT * FROM VEHICULOS;
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_vehiculo (
    p_num_placa IN VEHICULOS.NUM_PLACA%TYPE,
    p_tipo_vehiculo IN VEHICULOS.TIPO_VEHICULO%TYPE,
    p_estado_vehiculo IN VEHICULOS.ESTADO_VEHICULO%TYPE,
    p_marca IN VEHICULOS.MARCA%TYPE,
    p_modelo IN VEHICULOS.MODELO%TYPE,
    p_fecha_registro IN VEHICULOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN VEHICULOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO)
    VALUES (p_num_placa, p_tipo_vehiculo, p_estado_vehiculo, p_marca, p_modelo, p_fecha_registro, p_nombre_usuario);
    
    DBMS_OUTPUT.PUT_LINE('Vehículo insertado correctamente');
END;
-- Usar procedure
BEGIN
    insert_vehiculo(
        p_num_placa => 'ABC123',
        p_tipo_vehiculo => 'SUV',
        p_estado_vehiculo => 'Nuevo',
        p_marca => 'Toyota',
        p_modelo => 'RAV4',
        p_fecha_registro => DATE '2024-07-23',
        p_nombre_usuario => 'Juan Pérez'
    );
END;
/


------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_vehiculo (
    p_id_vehiculo IN VEHICULOS.ID_VEHICULO%TYPE,
    p_num_placa OUT VEHICULOS.NUM_PLACA%TYPE,
    p_tipo_vehiculo OUT VEHICULOS.TIPO_VEHICULO%TYPE,
    p_estado_vehiculo OUT VEHICULOS.ESTADO_VEHICULO%TYPE,
    p_marca OUT VEHICULOS.MARCA%TYPE,
    p_modelo OUT VEHICULOS.MODELO%TYPE,
    p_fecha_registro OUT VEHICULOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario OUT VEHICULOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    SELECT NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO
    INTO p_num_placa, p_tipo_vehiculo, p_estado_vehiculo, p_marca, p_modelo, p_fecha_registro, p_nombre_usuario
    FROM VEHICULOS
    WHERE ID_VEHICULO = p_id_vehiculo;

    DBMS_OUTPUT.PUT_LINE('Vehículo encontrado correctamente');
END;


-- Usar procedure

DECLARE
    v_num_placa VEHICULOS.NUM_PLACA%TYPE;
    v_tipo_vehiculo VEHICULOS.TIPO_VEHICULO%TYPE;
    v_estado_vehiculo VEHICULOS.ESTADO_VEHICULO%TYPE;
    v_marca VEHICULOS.MARCA%TYPE;
    v_modelo VEHICULOS.MODELO%TYPE;
    v_fecha_registro VEHICULOS.FECHA_REGISTRO%TYPE;
    v_nombre_usuario VEHICULOS.NOMBRE_USUARIO%TYPE;
BEGIN
    get_vehiculo(
        p_id_vehiculo => 1,  -- 
        p_num_placa => v_num_placa,
        p_tipo_vehiculo => v_tipo_vehiculo,
        p_estado_vehiculo => v_estado_vehiculo,
        p_marca => v_marca,
        p_modelo => v_modelo,
        p_fecha_registro => v_fecha_registro,
        p_nombre_usuario => v_nombre_usuario
    );
    DBMS_OUTPUT.PUT_LINE('Número de Placa: ' || v_num_placa);
    DBMS_OUTPUT.PUT_LINE('Tipo de Vehículo: ' || v_tipo_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Estado del Vehículo: ' || v_estado_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Marca: ' || v_marca);
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || v_modelo);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || v_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || v_nombre_usuario);
END;

------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_vehiculo (
    p_id_vehiculo IN VEHICULOS.ID_VEHICULO%TYPE,
    p_num_placa IN VEHICULOS.NUM_PLACA%TYPE,
    p_tipo_vehiculo IN VEHICULOS.TIPO_VEHICULO%TYPE,
    p_estado_vehiculo IN VEHICULOS.ESTADO_VEHICULO%TYPE,
    p_marca IN VEHICULOS.MARCA%TYPE,
    p_modelo IN VEHICULOS.MODELO%TYPE,
    p_fecha_registro IN VEHICULOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN VEHICULOS.NOMBRE_USUARIO%TYPE
) AS
BEGIN
    UPDATE VEHICULOS
    SET NUM_PLACA = p_num_placa,
        TIPO_VEHICULO = p_tipo_vehiculo,
        ESTADO_VEHICULO = p_estado_vehiculo,
        MARCA = p_marca,
        MODELO = p_modelo,
        FECHA_REGISTRO = p_fecha_registro,
        NOMBRE_USUARIO = p_nombre_usuario
    WHERE ID_VEHICULO = p_id_vehiculo;
    
    DBMS_OUTPUT.PUT_LINE('Vehículo actualizado correctamente');
END;

-- Usar procedure

BEGIN
    update_vehiculo(
        p_id_vehiculo => 1,  -- Reemplaza con un ID_VEHICULO existente
        p_num_placa => 'XYZ789',
        p_tipo_vehiculo => 'Sedán',
        p_estado_vehiculo => 'Usado',
        p_marca => 'Honda',
        p_modelo => 'Civic',
        p_fecha_registro => DATE '2024-07-24',
        p_nombre_usuario => 'Ana García'
    );
END;


BEGIN
    update_vehiculo(
        p_id_vehiculo => 1,  -- Reemplaza con un ID_VEHICULO existente
        p_num_placa => 'XYZ789',
        p_tipo_vehiculo => 'Sedán',
        p_estado_vehiculo => 'Usado',
        p_marca => 'Honda',
        p_modelo => 'Civic',
        p_fecha_registro => DATE '2024-07-24',
        p_nombre_usuario => 'Ana García'
    );
END;

------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_vehiculo (
    p_id_vehiculo IN VEHICULOS.ID_VEHICULO%TYPE
) AS
BEGIN
    DELETE FROM VEHICULOS
    WHERE ID_VEHICULO = p_id_vehiculo;
    
    DBMS_OUTPUT.PUT_LINE('Vehículo eliminado correctamente');
END;

-- Usar procedure

BEGIN
    delete_vehiculo(
        p_id_vehiculo => 1  
END;

--------------------------    SERVICIOS   ---------------------------------------
SELECT * FROM SERVICIOS;
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_servicio (
    p_cod_servicio IN SERVICIOS.COD_SERVICIO%TYPE,
    p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE,
    p_descripcion_servicio IN SERVICIOS.DESCRIPCION_SERVICIO%TYPE,
    p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE
) AS
BEGIN
    INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
    VALUES (p_cod_servicio, p_nombre_servicio, p_descripcion_servicio, p_precio_servicio);
    
    DBMS_OUTPUT.PUT_LINE('Servicio insertado correctamente');
END;


-- Usar procedure

BEGIN
    insert_servicio(
        p_cod_servicio => 1001,
        p_nombre_servicio => 'Lavado de Autos',
        p_descripcion_servicio => 'Lavado exterior e interior de autos',
        p_precio_servicio => 25.00
    );
END;




------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_servicio (
    p_id_servicio IN SERVICIOS.ID_SERVICIO%TYPE,
    p_cod_servicio OUT SERVICIOS.COD_SERVICIO%TYPE,
    p_nombre_servicio OUT SERVICIOS.NOMBRE_SERVICIO%TYPE,
    p_descripcion_servicio OUT SERVICIOS.DESCRIPCION_SERVICIO%TYPE,
    p_precio_servicio OUT SERVICIOS.PRECIO_SERVICIO%TYPE
) AS
BEGIN
    SELECT COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO
    INTO p_cod_servicio, p_nombre_servicio, p_descripcion_servicio, p_precio_servicio
    FROM SERVICIOS
    WHERE ID_SERVICIO = p_id_servicio;

    DBMS_OUTPUT.PUT_LINE('Servicio encontrado correctamente');
END;


-- Usar procedure

DECLARE
    v_cod_servicio SERVICIOS.COD_SERVICIO%TYPE;
    v_nombre_servicio SERVICIOS.NOMBRE_SERVICIO%TYPE;
    v_descripcion_servicio SERVICIOS.DESCRIPCION_SERVICIO%TYPE;
    v_precio_servicio SERVICIOS.PRECIO_SERVICIO%TYPE;
BEGIN
    get_servicio(
        p_id_servicio => 1,  -- Reemplaza con un ID_SERVICIO existente
        p_cod_servicio => v_cod_servicio,
        p_nombre_servicio => v_nombre_servicio,
        p_descripcion_servicio => v_descripcion_servicio,
        p_precio_servicio => v_precio_servicio
    );
    DBMS_OUTPUT.PUT_LINE('Código de Servicio: ' || v_cod_servicio);
    DBMS_OUTPUT.PUT_LINE('Nombre de Servicio: ' || v_nombre_servicio);
    DBMS_OUTPUT.PUT_LINE('Descripción de Servicio: ' || v_descripcion_servicio);
    DBMS_OUTPUT.PUT_LINE('Precio de Servicio: ' || v_precio_servicio);
END;


------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_servicio (
    p_id_servicio IN SERVICIOS.ID_SERVICIO%TYPE,
    p_cod_servicio IN SERVICIOS.COD_SERVICIO%TYPE,
    p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE,
    p_descripcion_servicio IN SERVICIOS.DESCRIPCION_SERVICIO%TYPE,
    p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE
) AS
BEGIN
    UPDATE SERVICIOS
    SET COD_SERVICIO = p_cod_servicio,
        NOMBRE_SERVICIO = p_nombre_servicio,
        DESCRIPCION_SERVICIO = p_descripcion_servicio,
        PRECIO_SERVICIO = p_precio_servicio
    WHERE ID_SERVICIO = p_id_servicio;
    
    DBMS_OUTPUT.PUT_LINE('Servicio actualizado correctamente');
END;



-- Usar procedure

BEGIN
    update_servicio(
        p_id_servicio => 5,  -- Reemplaza con un ID_SERVICIO existente
        p_cod_servicio => 1002,
        p_nombre_servicio => 'Cambio de Aceite',
        p_descripcion_servicio => 'Cambio de aceite para todo tipo de vehículos',
        p_precio_servicio => 50.00
    );
END;


------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_servicio (
    p_id_servicio IN SERVICIOS.ID_SERVICIO%TYPE
) AS
BEGIN
    DELETE FROM SERVICIOS
    WHERE ID_SERVICIO = p_id_servicio;
    
    DBMS_OUTPUT.PUT_LINE('Servicio eliminado correctamente');
END;


-- Usar procedure

BEGIN
    delete_servicio(
        p_id_servicio => 1  -- Reemplaza con un ID_SERVICIO existente
    );
END;
--------------------------    EMPLEADOS   ---------------------------------------
SELECT * FROM EMPLEADOS;
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_empleado (
    p_nombre_empleado IN EMPLEADOS.NOMBRE_EMPLEADO%TYPE,
    p_apellido_empleado IN EMPLEADOS.APELLIDO_EMPLEADO%TYPE,
    p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE,
    p_fecha_contratacion IN EMPLEADOS.FECHA_CONTRATACION%TYPE,
    p_salario IN EMPLEADOS.SALARIO%TYPE
) AS
BEGIN
    INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO)
    VALUES (p_nombre_empleado, p_apellido_empleado, p_cargo_empleado, p_fecha_contratacion, p_salario);
    
    DBMS_OUTPUT.PUT_LINE('Empleado insertado correctamente');
END;



-- Usar procedure

BEGIN
    insert_empleado(
        p_nombre_empleado => 'Carlos',
        p_apellido_empleado => 'Gómez',
        p_cargo_empleado => 'Gerente',
        p_fecha_contratacion => DATE '2024-07-23',
        p_salario => 5000.00
    );
END;






------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_empleado (
    p_id_empleado IN EMPLEADOS.ID_EMPLEADO%TYPE,
    p_nombre_empleado OUT EMPLEADOS.NOMBRE_EMPLEADO%TYPE,
    p_apellido_empleado OUT EMPLEADOS.APELLIDO_EMPLEADO%TYPE,
    p_cargo_empleado OUT EMPLEADOS.CARGO_EMPLEADO%TYPE,
    p_fecha_contratacion OUT EMPLEADOS.FECHA_CONTRATACION%TYPE,
    p_salario OUT EMPLEADOS.SALARIO%TYPE
) AS
BEGIN
    SELECT NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO
    INTO p_nombre_empleado, p_apellido_empleado, p_cargo_empleado, p_fecha_contratacion, p_salario
    FROM EMPLEADOS
    WHERE ID_EMPLEADO = p_id_empleado;

    DBMS_OUTPUT.PUT_LINE('Empleado encontrado correctamente');
END;
/


-- Usar procedure

DECLARE
    v_nombre_empleado EMPLEADOS.NOMBRE_EMPLEADO%TYPE;
    v_apellido_empleado EMPLEADOS.APELLIDO_EMPLEADO%TYPE;
    v_cargo_empleado EMPLEADOS.CARGO_EMPLEADO%TYPE;
    v_fecha_contratacion EMPLEADOS.FECHA_CONTRATACION%TYPE;
    v_salario EMPLEADOS.SALARIO%TYPE;
BEGIN
    get_empleado(
        p_id_empleado => 1,  -- Reemplaza con un ID_EMPLEADO existente
        p_nombre_empleado => v_nombre_empleado,
        p_apellido_empleado => v_apellido_empleado,
        p_cargo_empleado => v_cargo_empleado,
        p_fecha_contratacion => v_fecha_contratacion,
        p_salario => v_salario
    );
    DBMS_OUTPUT.PUT_LINE('Nombre del Empleado: ' || v_nombre_empleado);
    DBMS_OUTPUT.PUT_LINE('Apellido del Empleado: ' || v_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Cargo del Empleado: ' || v_cargo_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha de Contratación: ' || v_fecha_contratacion);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
END;




------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_empleado (
    p_id_empleado IN EMPLEADOS.ID_EMPLEADO%TYPE,
    p_nombre_empleado IN EMPLEADOS.NOMBRE_EMPLEADO%TYPE,
    p_apellido_empleado IN EMPLEADOS.APELLIDO_EMPLEADO%TYPE,
    p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE,
    p_fecha_contratacion IN EMPLEADOS.FECHA_CONTRATACION%TYPE,
    p_salario IN EMPLEADOS.SALARIO%TYPE
) AS
BEGIN
    UPDATE EMPLEADOS
    SET NOMBRE_EMPLEADO = p_nombre_empleado,
        APELLIDO_EMPLEADO = p_apellido_empleado,
        CARGO_EMPLEADO = p_cargo_empleado,
        FECHA_CONTRATACION = p_fecha_contratacion,
        SALARIO = p_salario
    WHERE ID_EMPLEADO = p_id_empleado;
    
    DBMS_OUTPUT.PUT_LINE('Empleado actualizado correctamente');
END;


-- Usar procedure

BEGIN
    update_empleado(
        p_id_empleado => 5,  -- Reemplaza con un ID_EMPLEADO existente
        p_nombre_empleado => 'Sebastian',
        p_apellido_empleado => 'Hernandez',
        p_cargo_empleado => 'Jimenez',
        p_fecha_contratacion => DATE '2024-07-24',
        p_salario => 10500.00
    );
END;



------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_empleado (
    p_id_empleado IN EMPLEADOS.ID_EMPLEADO%TYPE
) AS
BEGIN
    DELETE FROM EMPLEADOS
    WHERE ID_EMPLEADO = p_id_empleado;
    
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado correctamente');
END;


-- Usar procedure

BEGIN

    delete_empleado(
        p_id_empleado => 21  -- Reemplaza con un ID_EMPLEADO existente
    );
END;



/*
**********************************************************************
*                                                                    *
*                             FUNCIONES                              *
*                                                                    *
**********************************************************************
*/

--------------------------Dani----------------------------------------

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 1: Calcular el total de una factura
CREATE OR REPLACE FUNCTION calcular_total_factura(p_id_factura IN INTEGER)
RETURN NUMBER IS
    v_total NUMBER(10, 2);
BEGIN
    SELECT SUM(rp.PRECIO_REPUESTO * df.CANTIDAD)
    INTO v_total
    FROM DETALLE_FACTURA df
    JOIN REPUESTOS rp ON df.COD_REPUESTO = rp.ID_REPUESTO
    WHERE df.COD_FACTURA = p_id_factura;
    
    DBMS_OUTPUT.PUT_LINE('El total de la factura ' || p_id_factura || ' es: ' || v_total);
    
    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron datos para la factura ' || p_id_factura);
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurri� un error al calcular el total de la factura ' || p_id_factura);
        RETURN -1;
END;
/

-- Llamada a la funci�n calcular_total_factura
DECLARE
    v_total NUMBER;
BEGIN
    v_total := calcular_total_factura(2); -- Cambiar el ID de la factura seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('Resultado de la funci�n calcular_total_factura: ' || v_total);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 2: Calcular el total de todas las facturas
CREATE OR REPLACE FUNCTION calcular_total_facturas
RETURN NUMBER IS
    v_total NUMBER(10, 2);
BEGIN
    SELECT SUM(TOTAL_FACTURA)
    INTO v_total
    FROM FACTURAS;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n calcular_total_facturas
DECLARE
    v_total NUMBER;
BEGIN
    v_total := calcular_total_facturas();
    DBMS_OUTPUT.PUT_LINE('Resultado de la funci�n calcular_total_facturas: ' || v_total);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 3: Obtener el total de los servicios de una oficina
CREATE OR REPLACE FUNCTION total_servicios_oficina(p_id_oficina IN INTEGER)
RETURN NUMBER IS
    v_total NUMBER(10, 2);
BEGIN
    SELECT NVL(SUM(s.PRECIO_SERVICIO), 0)
    INTO v_total
    FROM SERVICIOS s
    JOIN EMPLEADOS e ON s.COD_SERVICIO = e.ID_EMPLEADO
    WHERE e.ID_OFICINA = p_id_oficina;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n total_servicios_oficina
DECLARE
    v_total NUMBER;
BEGIN
    v_total := total_servicios_oficina(1); -- Cambiar el ID de la oficina seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('Resultado de la funci�n total_servicios_oficina: ' || v_total);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 4: Obtener los detalles de una factura espec�fica
CREATE OR REPLACE FUNCTION obtener_detalle_factura(p_id_factura IN INTEGER)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT df.COD_REPUESTO, r.NOMBRE_REPUESTO, df.CANTIDAD, r.PRECIO_REPUESTO
        FROM DETALLE_FACTURA df
        JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
        WHERE df.COD_FACTURA = p_id_factura;

    RETURN v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/

-- Llamada a la funci�n obtener_detalle_factura
DECLARE
    v_cursor SYS_REFCURSOR;
    v_cod_repuesto REPUESTOS.COD_REPUESTO%TYPE;
    v_nombre_repuesto REPUESTOS.NOMBRE_REPUESTO%TYPE;
    v_cantidad DETALLE_FACTURA.CANTIDAD%TYPE;
    v_precio_repuesto REPUESTOS.PRECIO_REPUESTO%TYPE;
BEGIN
    v_cursor := obtener_detalle_factura(1); -- Cambiar el ID de la factura seg�n sea necesario
    
    LOOP
        FETCH v_cursor INTO v_cod_repuesto, v_nombre_repuesto, v_cantidad, v_precio_repuesto;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('C�digo Repuesto: ' || v_cod_repuesto || ', Nombre: ' || v_nombre_repuesto || 
                             ', Cantidad: ' || v_cantidad || ', Precio: ' || v_precio_repuesto);
    END LOOP;
    
    CLOSE v_cursor;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 5: Obtener el contacto con m�s facturas
CREATE OR REPLACE FUNCTION obtener_contacto_mas_facturas
RETURN VARCHAR2 IS
    v_nombre_contacto CONTACTOS.NOMBRE_CONTACTO%TYPE;
BEGIN
    SELECT c.NOMBRE_CONTACTO
    INTO v_nombre_contacto
    FROM CONTACTOS c
    JOIN FACTURAS f ON c.ID_CONTACTO = f.COD_CLIENTE
    GROUP BY c.NOMBRE_CONTACTO
    ORDER BY COUNT(f.ID_FACTURA) DESC
    FETCH FIRST ROW ONLY;

    RETURN v_nombre_contacto;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No se encontraron contactos.';
    WHEN OTHERS THEN
        RETURN 'Ocurri� un error al obtener el contacto.';
END;
/

-- Llamada a la funci�n obtener_contacto_mas_facturas
DECLARE
    v_contacto VARCHAR2(100);
BEGIN
    v_contacto := obtener_contacto_mas_facturas();
    DBMS_OUTPUT.PUT_LINE('Contacto con m�s facturas: ' || v_contacto);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 6: Calcular el total de ventas de un repuesto
CREATE OR REPLACE FUNCTION total_ventas_repuesto(p_cod_repuesto IN INTEGER)
RETURN NUMBER IS
    v_total_ventas NUMBER(10, 2);
BEGIN
    SELECT SUM(df.CANTIDAD * r.PRECIO_REPUESTO)
    INTO v_total_ventas
    FROM DETALLE_FACTURA df
    JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
    WHERE df.COD_REPUESTO = p_cod_repuesto;

    RETURN v_total_ventas;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n total_ventas_repuesto
DECLARE
    v_total_ventas NUMBER;
BEGIN
    v_total_ventas := total_ventas_repuesto(301); -- Cambiar el c�digo del repuesto seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('Total de ventas del repuesto: ' || v_total_ventas);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 7: Contar veh�culos activos
CREATE OR REPLACE FUNCTION contar_vehiculos_activos
RETURN INTEGER IS
    v_num_vehiculos INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_num_vehiculos
    FROM VEHICULOS
    WHERE ESTADO_VEHICULO = 'Activo';

    RETURN v_num_vehiculos;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n contar_vehiculos_activos
DECLARE
    v_num_vehiculos INTEGER;
BEGIN
    v_num_vehiculos := contar_vehiculos_activos();
    DBMS_OUTPUT.PUT_LINE('N�mero de veh�culos activos: ' || v_num_vehiculos);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 8: Obtener precio promedio de servicios
CREATE OR REPLACE FUNCTION obtener_precio_promedio_servicios
RETURN NUMBER IS
    v_precio_promedio NUMBER(10, 2);
BEGIN
    SELECT AVG(PRECIO_SERVICIO)
    INTO v_precio_promedio
    FROM SERVICIOS;

    RETURN v_precio_promedio;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n obtener_precio_promedio_servicios
DECLARE
    v_precio_promedio NUMBER;
BEGIN
    v_precio_promedio := obtener_precio_promedio_servicios();
    DBMS_OUTPUT.PUT_LINE('Precio promedio de los servicios: ' || v_precio_promedio);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 9: Obtener empleados por cargo
CREATE OR REPLACE FUNCTION obtener_empleados_por_cargo(p_cargo IN VARCHAR2)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT e.NOMBRE_EMPLEADO, e.CARGO
        FROM EMPLEADOS e
        WHERE e.CARGO = p_cargo;

    RETURN v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/

-- Llamada a la funci�n obtener_empleados_por_cargo
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre_empleado EMPLEADOS.NOMBRE_EMPLEADO%TYPE;
    v_cargo EMPLEADOS.CARGO%TYPE;
BEGIN
    v_cursor := obtener_empleados_por_cargo('Mec�nico'); -- Cambiar el cargo seg�n sea necesario
    
    LOOP
        FETCH v_cursor INTO v_nombre_empleado, v_cargo;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Nombre Empleado: ' || v_nombre_empleado || ', Cargo: ' || v_cargo);
    END LOOP;
    
    CLOSE v_cursor;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 10: Obtener repuestos en stock
CREATE OR REPLACE FUNCTION obtener_repuestos_en_stock
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT r.NOMBRE_REPUESTO, r.STOCK
        FROM REPUESTOS r
        WHERE r.STOCK > 0;

    RETURN v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/

-- Llamada a la funci�n obtener_repuestos_en_stock
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre_repuesto REPUESTOS.NOMBRE_REPUESTO%TYPE;
    v_stock REPUESTOS.STOCK%TYPE;
BEGIN
    v_cursor := obtener_repuestos_en_stock();
    
    LOOP
        FETCH v_cursor INTO v_nombre_repuesto, v_stock;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Nombre Repuesto: ' || v_nombre_repuesto || ', Stock: ' || v_stock);
    END LOOP;
    
    CLOSE v_cursor;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 11: Obtener clientes con m�s de una factura
CREATE OR REPLACE FUNCTION clientes_con_mas_de_una_factura
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT c.NOMBRE_CLIENTE, COUNT(f.ID_FACTURA) AS NUM_FACTURAS
        FROM CLIENTES c
        JOIN FACTURAS f ON c.ID_CLIENTE = f.COD_CLIENTE
        GROUP BY c.NOMBRE_CLIENTE
        HAVING COUNT(f.ID_FACTURA) > 1;

    RETURN v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/

-- Llamada a la funci�n clientes_con_mas_de_una_factura
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre_cliente CLIENTES.NOMBRE_CLIENTE%TYPE;
    v_num_facturas INTEGER;
BEGIN
    v_cursor := clientes_con_mas_de_una_factura();
    
    LOOP
        FETCH v_cursor INTO v_nombre_cliente, v_num_facturas;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nombre_cliente || ', N�mero de Facturas: ' || v_num_facturas);
    END LOOP;
    
    CLOSE v_cursor;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 12: Contar servicios en una oficina
CREATE OR REPLACE FUNCTION contar_servicios_oficina(p_id_oficina IN INTEGER)
RETURN INTEGER IS
    v_num_servicios INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_num_servicios
    FROM SERVICIOS s
    JOIN EMPLEADOS e ON s.COD_SERVICIO = e.ID_EMPLEADO
    WHERE e.ID_OFICINA = p_id_oficina;

    RETURN v_num_servicios;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n contar_servicios_oficina
DECLARE
    v_num_servicios INTEGER;
BEGIN
    v_num_servicios := contar_servicios_oficina(1); -- Cambiar el ID de la oficina seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('N�mero de servicios en la oficina: ' || v_num_servicios);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 13: Calcular el costo total de los repuestos de una factura
CREATE OR REPLACE FUNCTION calcular_costo_repuestos_factura(p_id_factura IN INTEGER)
RETURN NUMBER IS
    v_costo_total NUMBER(10, 2);
BEGIN
    SELECT SUM(r.PRECIO_REPUESTO * df.CANTIDAD)
    INTO v_costo_total
    FROM DETALLE_FACTURA df
    JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
    WHERE df.COD_FACTURA = p_id_factura;

    RETURN v_costo_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n calcular_costo_repuestos_factura
DECLARE
    v_costo_total NUMBER;
BEGIN
    v_costo_total := calcular_costo_repuestos_factura(2); -- Cambiar el ID de la factura seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('Costo total de los repuestos de la factura: ' || v_costo_total);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 14: Obtener n�mero de repuestos por tipo
CREATE OR REPLACE FUNCTION contar_repuestos_por_tipo(p_tipo IN VARCHAR2)
RETURN INTEGER IS
    v_num_repuestos INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_num_repuestos
    FROM REPUESTOS
    WHERE TIPO_REPUESTO = p_tipo;

    RETURN v_num_repuestos;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/

-- Llamada a la funci�n contar_repuestos_por_tipo
DECLARE
    v_num_repuestos INTEGER;
BEGIN
    v_num_repuestos := contar_repuestos_por_tipo('Filtro'); -- Cambiar el tipo de repuesto seg�n sea necesario
    DBMS_OUTPUT.PUT_LINE('N�mero de repuestos del tipo especificado: ' || v_num_repuestos);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para la funci�n
SET SERVEROUTPUT ON;

-- Funci�n 15: Obtener las oficinas con m�s servicios
CREATE OR REPLACE FUNCTION obtener_oficinas_con_mas_servicios
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT e.ID_OFICINA, COUNT(s.COD_SERVICIO) AS NUM_SERVICIOS
        FROM EMPLEADOS e
        JOIN SERVICIOS s ON s.COD_SERVICIO = e.ID_EMPLEADO
        GROUP BY e.ID_OFICINA
        ORDER BY NUM_SERVICIOS DESC;

    RETURN v_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/

-- Llamada a la funci�n obtener_oficinas_con_mas_servicios
DECLARE
    v_cursor SYS_REFCURSOR;
    v_id_oficina EMPLEADOS.ID_OFICINA%TYPE;
    v_num_servicios INTEGER;
BEGIN
    v_cursor := obtener_oficinas_con_mas_servicios();
    
    LOOP
        FETCH v_cursor INTO v_id_oficina, v_num_servicios;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('ID Oficina: ' || v_id_oficina || ', N�mero de Servicios: ' || v_num_servicios);
    END LOOP;
    
    CLOSE v_cursor;
END;
/


/*
**********************************************************************
*                                                                    *
*                             PROCEDIMIENTOS                         *
*                                                                    *
**********************************************************************
*/
--1.
CREATE OR REPLACE PROCEDURE select_contactos_por_tipo (
    p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = p_tipo_contacto) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ID_CONTACTO || ', Nombre: ' || r.NOMBRE_CONTACTO);
    END LOOP;
END;
/
--2.
CREATE OR REPLACE PROCEDURE select_facturas_por_cliente (
    p_cod_cliente IN FACTURAS.COD_CLIENTE%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM FACTURAS WHERE COD_CLIENTE = p_cod_cliente) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || r.ID_FACTURA || ', Total: ' || r.TOTAL_FACTURA);
    END LOOP;
END;
/
--3.
CREATE OR REPLACE PROCEDURE select_repuestos_por_fecha (
    p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM REPUESTOS WHERE FECHA_REGISTRO = p_fecha_registro) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Repuesto: ' || r.ID_REPUESTO || ', Nombre: ' || r.NOMBRE_REPUESTO);
    END LOOP;
END;
/
--4.
CREATE OR REPLACE PROCEDURE select_detalle_por_factura (
    p_cod_factura IN DETALLE_FACTURA.COD_FACTURA%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM DETALLE_FACTURA WHERE COD_FACTURA = p_cod_factura) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Detalle: ' || r.ID_DETALLE_FACTURA || ', Cantidad: ' || r.CANTIDAD);
    END LOOP;
END;
/
--5. 
CREATE OR REPLACE PROCEDURE select_oficinas_por_nombre (
    p_nombre_oficina IN OFICINAS.NOMBRE_OFICINA%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM OFICINAS WHERE NOMBRE_OFICINA = p_nombre_oficina) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Oficina: ' || r.ID_OFICINA || ', Nombre: ' || r.NOMBRE_OFICINA);
    END LOOP;
END;
/
--6.
CREATE OR REPLACE PROCEDURE select_vehiculos_por_estado (
    p_estado_vehiculo IN VEHICULOS.ESTADO_VEHICULO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM VEHICULOS WHERE ESTADO_VEHICULO = p_estado_vehiculo) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Veh�culo: ' || r.ID_VEHICULO || ', Placa: ' || r.NUM_PLACA);
    END LOOP;
END;
/

--7.
CREATE OR REPLACE PROCEDURE select_servicios_por_precio (
    p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM SERVICIOS WHERE PRECIO_SERVICIO = p_precio_servicio) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.ID_SERVICIO || ', Nombre: ' || r.NOMBRE_SERVICIO);
    END LOOP;
END;
/

--8.
CREATE OR REPLACE PROCEDURE select_empleados_por_cargo (
    p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM EMPLEADOS WHERE CARGO_EMPLEADO = p_cargo_empleado) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || r.ID_EMPLEADO || ', Nombre: ' || r.NOMBRE_EMPLEADO);
    END LOOP;
END;
/

--9. 
CREATE OR REPLACE PROCEDURE select_contactos_por_nombre (
    p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM CONTACTOS WHERE NOMBRE_CONTACTO = p_nombre_contacto) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ID_CONTACTO || ', Tipo: ' || r.TIPO_CONTACTO);
    END LOOP;
END;
/

--10.
CREATE OR REPLACE PROCEDURE select_facturas_por_fecha (
    p_fecha_factura IN FACTURAS.FECHA_FACTURA%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM FACTURAS WHERE FECHA_FACTURA = p_fecha_factura) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || r.ID_FACTURA || ', Cliente: ' || r.COD_CLIENTE);
    END LOOP;
END;
/

--11.
CREATE OR REPLACE PROCEDURE select_repuestos_por_nombre (
    p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM REPUESTOS WHERE NOMBRE_REPUESTO = p_nombre_repuesto) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Repuesto: ' || r.ID_REPUESTO || ', Fecha Registro: ' || r.FECHA_REGISTRO);
    END LOOP;
END;
/

--12.
CREATE OR REPLACE PROCEDURE select_detalle_por_repuesto (
    p_cod_repuesto IN DETALLE_FACTURA.COD_REPUESTO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM DETALLE_FACTURA WHERE COD_REPUESTO = p_cod_repuesto) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Detalle: ' || r.ID_DETALLE_FACTURA || ', Cantidad: ' || r.CANTIDAD);
    END LOOP;
END;
/

--13. 
CREATE OR REPLACE PROCEDURE select_oficinas_por_fecha (
    p_fecha_registro IN OFICINAS.FECHA_REGISTRO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM OFICINAS WHERE FECHA_REGISTRO = p_fecha_registro) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Oficina: ' || r.ID_OFICINA || ', Nombre: ' || r.NOMBRE_OFICINA);
    END LOOP;
END;
/
--14.
CREATE OR REPLACE PROCEDURE select_vehiculos_por_tipo (
    p_tipo_vehiculo IN VEHICULOS.TIPO_VEHICULO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM VEHICULOS WHERE TIPO_VEHICULO = p_tipo_vehiculo) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Veh�culo: ' || r.ID_VEHICULO || ', Placa: ' || r.NUM_PLACA);
    END LOOP;
END;
/

--15.
CREATE OR REPLACE PROCEDURE select_servicios_por_nombre (
    p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE
) AS
BEGIN
    FOR r IN (SELECT * FROM SERVICIOS WHERE NOMBRE_SERVICIO = p_nombre_servicio) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.ID_SERVICIO || ', Precio: ' || r.PRECIO_SERVICIO);
    END LOOP;
END;
/ 

/*
**********************************************************************
*                                                                    *
*                             VISTAS                                 *
*                                                                    *
**********************************************************************
*/


-- Vista de Clientes
CREATE OR REPLACE VIEW V_CLIENTES AS
SELECT ID_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO
FROM CONTACTOS
WHERE TIPO_CONTACTO = 'Cliente';

-- Vista de Proveedores
CREATE OR REPLACE VIEW V_PROVEEDORES AS
SELECT ID_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO
FROM CONTACTOS
WHERE TIPO_CONTACTO = 'Proveedor';

-- Vista de Facturas por Cliente
CREATE OR REPLACE VIEW V_FACTURAS_CLIENTE AS
SELECT F.ID_FACTURA, C.NOMBRE_CONTACTO AS CLIENTE, F.FECHA_FACTURA, F.TOTAL_FACTURA
FROM FACTURAS F
JOIN CONTACTOS C ON F.COD_CLIENTE = C.ID_CONTACTO;

-- Vista de Detalle de Facturas
CREATE OR REPLACE VIEW V_DETALLE_FACTURA AS
SELECT DF.ID_DETALLE_FACTURA, F.COD_FACTURA, R.NOMBRE_REPUESTO, DF.CANTIDAD
FROM DETALLE_FACTURA DF
JOIN FACTURAS F ON DF.COD_FACTURA = F.ID_FACTURA
JOIN REPUESTOS R ON DF.COD_REPUESTO = R.ID_REPUESTO;

-- Vista de Servicios con Precios
CREATE OR REPLACE VIEW V_SERVICIOS_PRECIOS AS
SELECT COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO
FROM SERVICIOS;

-- Vista de Vehículos Activos
CREATE OR REPLACE VIEW V_VEHICULOS_ACTIVOS AS
SELECT NUM_PLACA, TIPO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO
FROM VEHICULOS
WHERE ESTADO_VEHICULO = 'Activo';

-- Vista de Empleados con Salarios
CREATE OR REPLACE VIEW V_EMPLEADOS_SALARIOS AS
SELECT NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, CARGO_EMPLEADO, FECHA_CONTRATACION, SALARIO
FROM EMPLEADOS;


-- Vista de Clientes con sus Facturas y el Total Facturado
CREATE OR REPLACE VIEW V_CLIENTES_FACTURAS_TOTAL AS
SELECT C.ID_CONTACTO, C.NOMBRE_CONTACTO, SUM(F.TOTAL_FACTURA) AS TOTAL_FACTURADO
FROM CONTACTOS C
JOIN FACTURAS F ON C.ID_CONTACTO = F.COD_CLIENTE
WHERE C.TIPO_CONTACTO = 'Cliente'
GROUP BY C.ID_CONTACTO, C.NOMBRE_CONTACTO;

-- Vista de Servicios Prestados en Facturas
CREATE OR REPLACE VIEW V_SERVICIOS_FACTURAS AS
SELECT S.COD_SERVICIO, S.NOMBRE_SERVICIO, DF.CANTIDAD, F.COD_FACTURA, F.FECHA_FACTURA
FROM SERVICIOS S
JOIN DETALLE_FACTURA DF ON S.COD_SERVICIO = DF.COD_REPUESTO
JOIN FACTURAS F ON DF.COD_FACTURA = F.ID_FACTURA;

-- Vista de Vehículos con su Estado y Fecha de Registro
CREATE OR REPLACE VIEW V_VEHICULOS_ESTADO_REGISTRO AS
SELECT NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, FECHA_REGISTRO
FROM VEHICULOS;

/*
********
*                                                                    *
*                             Triggers                                 *
*                                                                    *
********
*/

CREATE OR REPLACE TRIGGER actualizar_total_factura
AFTER INSERT OR UPDATE OR DELETE ON DETALLE_FACTURA
FOR EACH ROW
BEGIN
    DECLARE
        v_total NUMBER(10, 2);
    BEGIN
        SELECT SUM(rp.PRECIO_REPUESTO * df.CANTIDAD)
        INTO v_total
        FROM DETALLE_FACTURA df
        JOIN REPUESTOS rp ON df.COD_REPUESTO = rp.ID_REPUESTO
        WHERE df.COD_FACTURA = :NEW.COD_FACTURA;

        UPDATE FACTURAS
        SET TOTAL_FACTURA = NVL(v_total, 0)
        WHERE ID_FACTURA = :NEW.COD_FACTURA;
    END;
END;
/

CREATE OR REPLACE TRIGGER actualizar_estado_vehiculo
BEFORE UPDATE ON VEHICULOS
FOR EACH ROW
BEGIN
    IF :NEW.ESTADO_VEHICULO != :OLD.ESTADO_VEHICULO THEN
        :NEW.FECHA_ESTADO := SYSDATE;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER evitar_duplicados_contacto
BEFORE INSERT OR UPDATE ON CONTACTOS
FOR EACH ROW
BEGIN
    DECLARE
        v_count INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM CONTACTOS
        WHERE EMAIL_CONTACTO = :NEW.EMAIL_CONTACTO
        AND ID_CONTACTO != :NEW.ID_CONTACTO;

        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'El contacto con este email ya existe.');
        END IF;
    END;
END;
/

CREATE OR REPLACE TRIGGER actualizar_total_ventas_repuesto
AFTER INSERT OR UPDATE OR DELETE ON DETALLE_FACTURA
FOR EACH ROW
BEGIN
    DECLARE
        v_total NUMBER(10, 2);
    BEGIN
        SELECT SUM(df.CANTIDAD * r.PRECIO_REPUESTO)
        INTO v_total
        FROM DETALLE_FACTURA df
        JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
        WHERE df.COD_REPUESTO = :NEW.COD_REPUESTO;

        UPDATE REPUESTOS
        SET TOTAL_VENTAS = NVL(v_total, 0)
        WHERE ID_REPUESTO = :NEW.COD_REPUESTO;
    END;
END;
/

CREATE OR REPLACE TRIGGER registrar_fechas_factura
BEFORE INSERT OR UPDATE ON FACTURAS
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.FECHA_CREACION := SYSDATE;
    END IF;

    IF UPDATING THEN
        :NEW.FECHA_ACTUALIZACION := SYSDATE;
    END IF;
END;
/


/*
********
*                                                                    *
*                             Cursores                                *
*                                                                    *
********
*/


CREATE OR REPLACE FUNCTION obtener_facturas
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM FACTURAS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_repuestos
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM REPUESTOS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_servicios
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM SERVICIOS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_vehiculos_activos
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM VEHICULOS WHERE ESTADO_VEHICULO = 'Activo';
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_empleados
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM EMPLEADOS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_clientes
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Cliente';
    RETURN v_cursor;
END;
/

 CREATE OR REPLACE FUNCTION obtener_proveedores
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Proveedor';
    RETURN v_cursor;
END;
/

 CREATE OR REPLACE FUNCTION obtener_detalle_factura(p_id_factura IN INTEGER)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT df.COD_REPUESTO, r.NOMBRE_REPUESTO, df.CANTIDAD, r.PRECIO_REPUESTO
        FROM DETALLE_FACTURA df
        JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
        WHERE df.COD_FACTURA = p_id_factura;
    RETURN v_cursor;
END;
/

 CREATE OR REPLACE FUNCTION obtener_facturas_cliente(p_id_cliente IN INTEGER)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * 
        FROM FACTURAS 
        WHERE COD_CLIENTE = p_id_cliente;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_servicios_precios
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO
        FROM SERVICIOS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_vehiculos_por_tipo(p_tipo_vehiculo IN VARCHAR2)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * 
        FROM VEHICULOS 
        WHERE TIPO_VEHICULO = p_tipo_vehiculo;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_empleados_por_cargo(p_cargo_empleado IN VARCHAR2)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * 
        FROM EMPLEADOS 
        WHERE CARGO_EMPLEADO = p_cargo_empleado;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_repuestos_precios
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT ID_REPUESTO, NOMBRE_REPUESTO, PRECIO_REPUESTO 
        FROM REPUESTOS;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_servicios_oficina(p_id_oficina IN INTEGER)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT s.COD_SERVICIO, s.NOMBRE_SERVICIO, s.PRECIO_SERVICIO
        FROM SERVICIOS s
        JOIN EMPLEADOS e ON s.COD_SERVICIO = e.ID_EMPLEADO
        WHERE e.ID_OFICINA = p_id_oficina;
    RETURN v_cursor;
END;
/

CREATE OR REPLACE FUNCTION obtener_facturas_por_cliente(p_id_cliente IN INTEGER)
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT f.ID_FACTURA, f.FECHA_FACTURA, f.TOTAL_FACTURA
        FROM FACTURAS f
        WHERE f.COD_CLIENTE = p_id_cliente;
    RETURN v_cursor;
END;
/

/*
********
*                                                                    *
*                            Paquetes                                *
*                                                                    *
********
*/

-- 1. Paquete de Contactos-- 

CREATE OR REPLACE PACKAGE contactos_pkg AS
    PROCEDURE select_contactos_por_tipo(p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE);
    PROCEDURE select_contactos_por_nombre(p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE);
    FUNCTION obtener_clientes RETURN SYS_REFCURSOR;
    FUNCTION obtener_proveedores RETURN SYS_REFCURSOR;
END contactos_pkg;
/

CREATE OR REPLACE PACKAGE BODY contactos_pkg AS
    PROCEDURE select_contactos_por_tipo(p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = p_tipo_contacto) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || r.ID_CONTACTO || ', Nombre: ' || r.NOMBRE_CONTACTO);
        END LOOP;
    END;

    PROCEDURE select_contactos_por_nombre(p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM CONTACTOS WHERE NOMBRE_CONTACTO = p_nombre_contacto) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || r.ID_CONTACTO || ', Tipo: ' || r.TIPO_CONTACTO);
        END LOOP;
    END;

    FUNCTION obtener_clientes RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Cliente';
        RETURN v_cursor;
    END;

    FUNCTION obtener_proveedores RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Proveedor';
        RETURN v_cursor;
    END;
END contactos_pkg;
/

-- 2. Paquete de Facturas --
CREATE OR REPLACE PACKAGE facturas_pkg AS
    PROCEDURE select_facturas_por_cliente(p_cod_cliente IN FACTURAS.COD_CLIENTE%TYPE);
    PROCEDURE select_facturas_por_fecha(p_fecha_factura IN FACTURAS.FECHA_FACTURA%TYPE);
    FUNCTION obtener_facturas RETURN SYS_REFCURSOR;
    FUNCTION obtener_facturas_cliente(p_id_cliente IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION obtener_facturas_por_cliente(p_id_cliente IN INTEGER) RETURN SYS_REFCURSOR;
END facturas_pkg;
/

CREATE OR REPLACE PACKAGE BODY facturas_pkg AS
    PROCEDURE select_facturas_por_cliente(p_cod_cliente IN FACTURAS.COD_CLIENTE%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM FACTURAS WHERE COD_CLIENTE = p_cod_cliente) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Factura: ' || r.ID_FACTURA || ', Total: ' || r.TOTAL_FACTURA);
        END LOOP;
    END;

    PROCEDURE select_facturas_por_fecha(p_fecha_factura IN FACTURAS.FECHA_FACTURA%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM FACTURAS WHERE FECHA_FACTURA = p_fecha_factura) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Factura: ' || r.ID_FACTURA || ', Cliente: ' || r.COD_CLIENTE);
        END LOOP;
    END;

    FUNCTION obtener_facturas RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM FACTURAS;
        RETURN v_cursor;
    END;

    FUNCTION obtener_facturas_cliente(p_id_cliente IN INTEGER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM FACTURAS WHERE COD_CLIENTE = p_id_cliente;
        RETURN v_cursor;
    END;

    FUNCTION obtener_facturas_por_cliente(p_id_cliente IN INTEGER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT f.ID_FACTURA, f.FECHA_FACTURA, f.TOTAL_FACTURA
        FROM FACTURAS f
        WHERE f.COD_CLIENTE = p_id_cliente;
        RETURN v_cursor;
    END;
END facturas_pkg;
/

-- 3. Paquete de Repuestos --

CREATE OR REPLACE PACKAGE repuestos_pkg AS
    PROCEDURE select_repuestos_por_fecha(p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE);
    PROCEDURE select_repuestos_por_nombre(p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE);
    FUNCTION obtener_repuestos RETURN SYS_REFCURSOR;
    FUNCTION obtener_repuestos_precios RETURN SYS_REFCURSOR;
END repuestos_pkg;
/

CREATE OR REPLACE PACKAGE BODY repuestos_pkg AS
    PROCEDURE select_repuestos_por_fecha(p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM REPUESTOS WHERE FECHA_REGISTRO = p_fecha_registro) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Repuesto: ' || r.ID_REPUESTO || ', Nombre: ' || r.NOMBRE_REPUESTO);
        END LOOP;
    END;

    PROCEDURE select_repuestos_por_nombre(p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM REPUESTOS WHERE NOMBRE_REPUESTO = p_nombre_repuesto) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Repuesto: ' || r.ID_REPUESTO || ', Fecha Registro: ' || r.FECHA_REGISTRO);
        END LOOP;
    END;

    FUNCTION obtener_repuestos RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM REPUESTOS;
        RETURN v_cursor;
    END;

    FUNCTION obtener_repuestos_precios RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT ID_REPUESTO, NOMBRE_REPUESTO, PRECIO_REPUESTO 
        FROM REPUESTOS;
        RETURN v_cursor;
    END;
END repuestos_pkg;
/

-- 4.  Paquete de Vehículos --

CREATE OR REPLACE PACKAGE vehiculos_pkg AS
    PROCEDURE select_vehiculos_por_estado(p_estado_vehiculo IN VEHICULOS.ESTADO_VEHICULO%TYPE);
    PROCEDURE select_vehiculos_por_tipo(p_tipo_vehiculo IN VEHICULOS.TIPO_VEHICULO%TYPE);
    FUNCTION obtener_vehiculos_activos RETURN SYS_REFCURSOR;
    FUNCTION obtener_vehiculos_por_tipo(p_tipo_vehiculo IN VARCHAR2) RETURN SYS_REFCURSOR;
END vehiculos_pkg;
/

CREATE OR REPLACE PACKAGE BODY vehiculos_pkg AS
    PROCEDURE select_vehiculos_por_estado(p_estado_vehiculo IN VEHICULOS.ESTADO_VEHICULO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM VEHICULOS WHERE ESTADO_VEHICULO = p_estado_vehiculo) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Vehículo: ' || r.ID_VEHICULO || ', Placa: ' || r.NUM_PLACA);
        END LOOP;
    END;

    PROCEDURE select_vehiculos_por_tipo(p_tipo_vehiculo IN VEHICULOS.TIPO_VEHICULO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM VEHICULOS WHERE TIPO_VEHICULO = p_tipo_vehiculo) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Vehículo: ' || r.ID_VEHICULO || ', Placa: ' || r.NUM_PLACA);
        END LOOP;
    END;

    FUNCTION obtener_vehiculos_activos RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM VEHICULOS WHERE ESTADO_VEHICULO = 'Activo';
        RETURN v_cursor;
    END;

    FUNCTION obtener_vehiculos_por_tipo(p_tipo_vehiculo IN VARCHAR2) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM VEHICULOS WHERE TIPO_VEHICULO = p_tipo_vehiculo;
        RETURN v_cursor;
    END;
END vehiculos_pkg;
/

-- 5. Paquete de Servicios y Empleados --

CREATE OR REPLACE PACKAGE servicios_empleados_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE);
    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE);
    PROCEDURE select_empleados_por_cargo(p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE);
    FUNCTION obtener_servicios RETURN SYS_REFCURSOR;
    FUNCTION obtener_servicios_oficina(p_id_oficina IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION obtener_empleados RETURN SYS_REFCURSOR;
    FUNCTION obtener_empleados_por_cargo(p_cargo_empleado IN VARCHAR2) RETURN SYS_REFCURSOR;
END servicios_empleados_pkg;
/

CREATE OR REPLACE PACKAGE BODY servicios_empleados_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE PRECIO_SERVICIO = p_precio_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Nombre: ' || r.NOMBRE_SERVICIO);
        END LOOP;
    END;

    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE NOMBRE_SERVICIO = p_nombre_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Precio: ' || r.PRECIO_SERVICIO);
        END LOOP;
    END;

    PROCEDURE select_empleados_por_cargo(p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM EMPLEADOS WHERE CARGO_EMPLEADO = p_cargo_empleado) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || r.ID_EMPLEADO || ', Nombre: ' || r.NOMBRE_EMPLEADO);
        END LOOP;
    END;

    FUNCTION obtener_servicios RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM SERVICIOS;
        RETURN v_cursor;
    END;

    FUNCTION obtener_servicios_oficina(p_id_oficina IN INTEGER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT s.COD_SERVICIO, s.NOMBRE_SERVICIO, s.PRECIO_SERVICIO
        FROM SERVICIOS s
        JOIN EMPLEADOS e ON s.COD_SERVICIO = e.ID_EMPLEADO
        WHERE e.ID_OFICINA = p_id_oficina;
        RETURN v_cursor;
    END;

    FUNCTION obtener_empleados RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM EMPLEADOS;
        RETURN v_cursor;
    END;

    FUNCTION obtener_empleados_por_cargo(p_cargo_empleado IN VARCHAR2) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM EMPLEADOS WHERE CARGO_EMPLEADO = p_cargo_empleado;
        RETURN v_cursor;
    END;
END servicios_empleados_pkg;
/

CREATE OR REPLACE PACKAGE oficinas_pkg AS
    PROCEDURE select_oficinas_por_nombre(p_nombre_oficina IN OFICINAS.NOMBRE_OFICINA%TYPE);
    PROCEDURE select_oficinas_por_fecha(p_fecha_registro IN OFICINAS.FECHA_REGISTRO%TYPE);
    FUNCTION obtener_oficinas RETURN SYS_REFCURSOR;
END oficinas_pkg;


CREATE OR REPLACE PACKAGE BODY oficinas_pkg AS
    PROCEDURE select_oficinas_por_nombre(p_nombre_oficina IN OFICINAS.NOMBRE_OFICINA%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM OFICINAS WHERE NOMBRE_OFICINA = p_nombre_oficina) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Oficina: ' || r.ID_OFICINA || ', Nombre: ' || r.NOMBRE_OFICINA);
        END LOOP;
    END;

    PROCEDURE select_oficinas_por_fecha(p_fecha_registro IN OFICINAS.FECHA_REGISTRO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM OFICINAS WHERE FECHA_REGISTRO = p_fecha_registro) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Oficina: ' || r.ID_OFICINA || ', Nombre: ' || r.NOMBRE_OFICINA);
        END LOOP;
    END;

    FUNCTION obtener_oficinas RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM OFICINAS;
        RETURN v_cursor;
    END;
END oficinas_pkg;



CREATE OR REPLACE PACKAGE detalle_factura_pkg AS
    PROCEDURE select_detalle_por_factura(p_cod_factura IN DETALLE_FACTURA.COD_FACTURA%TYPE);
    PROCEDURE select_detalle_por_repuesto(p_cod_repuesto IN DETALLE_FACTURA.COD_REPUESTO%TYPE);
    FUNCTION obtener_detalle_factura(p_id_factura IN INTEGER) RETURN SYS_REFCURSOR;
END detalle_factura_pkg;


CREATE OR REPLACE PACKAGE BODY detalle_factura_pkg AS
    PROCEDURE select_detalle_por_factura(p_cod_factura IN DETALLE_FACTURA.COD_FACTURA%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM DETALLE_FACTURA WHERE COD_FACTURA = p_cod_factura) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Detalle: ' || r.ID_DETALLE_FACTURA || ', Cantidad: ' || r.CANTIDAD);
        END LOOP;
    END;

    PROCEDURE select_detalle_por_repuesto(p_cod_repuesto IN DETALLE_FACTURA.COD_REPUESTO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM DETALLE_FACTURA WHERE COD_REPUESTO = p_cod_repuesto) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Detalle: ' || r.ID_DETALLE_FACTURA || ', Cantidad: ' || r.CANTIDAD);
        END LOOP;
    END;

    FUNCTION obtener_detalle_factura(p_id_factura IN INTEGER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT df.COD_REPUESTO, r.NOMBRE_REPUESTO, df.CANTIDAD, r.PRECIO_REPUESTO
            FROM DETALLE_FACTURA df
            JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
            WHERE df.COD_FACTURA = p_id_factura;
        RETURN v_cursor;
    END;
END detalle_factura_pkg;



CREATE OR REPLACE PACKAGE servicios_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE);
    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE);
    FUNCTION obtener_servicios RETURN SYS_REFCURSOR;
END servicios_pkg;


CREATE OR REPLACE PACKAGE BODY servicios_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE PRECIO_SERVICIO = p_precio_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Nombre: ' || r.NOMBRE_SERVICIO);
        END LOOP;
    END;

    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE NOMBRE_SERVICIO = p_nombre_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Precio: ' || r.PRECIO_SERVICIO);
        END LOOP;
    END;

    FUNCTION obtener_servicios RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM SERVICIOS;
        RETURN v_cursor;
    END;
END servicios_pkg;

CREATE OR REPLACE PACKAGE servicios_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE);
    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE);
    FUNCTION obtener_servicios RETURN SYS_REFCURSOR;
END servicios_pkg;


CREATE OR REPLACE PACKAGE BODY servicios_pkg AS
    PROCEDURE select_servicios_por_precio(p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE PRECIO_SERVICIO = p_precio_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Nombre: ' || r.NOMBRE_SERVICIO);
        END LOOP;
    END;

    PROCEDURE select_servicios_por_nombre(p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM SERVICIOS WHERE NOMBRE_SERVICIO = p_nombre_servicio) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || r.COD_SERVICIO || ', Precio: ' || r.PRECIO_SERVICIO);
        END LOOP;
    END;

    FUNCTION obtener_servicios RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM SERVICIOS;
        RETURN v_cursor;
    END;
END servicios_pkg;

CREATE OR REPLACE PACKAGE empleados_pkg AS
    PROCEDURE select_empleados_por_cargo(p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE);
    FUNCTION obtener_empleados RETURN SYS_REFCURSOR;
    FUNCTION obtener_empleados_por_cargo(p_cargo_empleado IN VARCHAR2) RETURN SYS_REFCURSOR;
END empleados_pkg;


CREATE OR REPLACE PACKAGE BODY empleados_pkg AS
    PROCEDURE select_empleados_por_cargo(p_cargo_empleado IN EMPLEADOS.CARGO_EMPLEADO%TYPE) AS
    BEGIN
        FOR r IN (SELECT * FROM EMPLEADOS WHERE CARGO_EMPLEADO = p_cargo_empleado) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || r.ID_EMPLEADO || ', Nombre: ' || r.NOMBRE_EMPLEADO);
        END LOOP;
    END;

    FUNCTION obtener_empleados RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM EMPLEADOS;
        RETURN v_cursor;
    END;

    FUNCTION obtener_empleados_por_cargo(p_cargo_empleado IN VARCHAR2) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM EMPLEADOS WHERE CARGO_EMPLEADO = p_cargo_empleado;
        RETURN v_cursor;
    END;
END empleados_pkg;

CREATE OR REPLACE PACKAGE clientes_proveedores_pkg AS
    FUNCTION obtener_clientes RETURN SYS_REFCURSOR;
    FUNCTION obtener_proveedores RETURN SYS_REFCURSOR;
    PROCEDURE select_clientes_con_multiples_facturas;
END clientes_proveedores_pkg;


CREATE OR REPLACE PACKAGE BODY clientes_proveedores_pkg AS
    FUNCTION obtener_clientes RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Cliente';
        RETURN v_cursor;
    END;

    FUNCTION obtener_proveedores RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR SELECT * FROM CONTACTOS WHERE TIPO_CONTACTO = 'Proveedor';
        RETURN v_cursor;
    END;

    PROCEDURE select_clientes_con_multiples_facturas AS
    BEGIN
        FOR r IN (SELECT c.NOMBRE_CONTACTO, COUNT(f.ID_FACTURA) AS NUM_FACTURAS
                  FROM CONTACTOS c
                  JOIN FACTURAS f ON c.ID_CONTACTO = f.COD_CLIENTE
                  GROUP BY c.NOMBRE_CONTACTO
                  HAVING COUNT(f.ID_FACTURA) > 1) LOOP
            DBMS_OUTPUT.PUT_LINE('Cliente: ' || r.NOMBRE_CONTACTO || ', Número de Facturas: ' || r.NUM_FACTURAS);
        END LOOP;
    END;
END clientes_proveedores_pkg;







