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

------------------------    CRUD    --------------------------------------------
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

