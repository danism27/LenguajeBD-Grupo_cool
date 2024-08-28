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
-- GENERADO AUTOMï¿½TICAMENTE CON AS IDENTITY: La columna usa una secuencia implï¿½cita para generar valores ï¿½nicos automï¿½ticamente.
-- START WITH 1: El valor inicial de la secuencia es 1.
-- INCREMENT BY 1: Cada nuevo valor generado aumenta en 1 respecto al anterior.
--------------------------------------------------------------------------------

-- CONSTRAINT PK_OFICINAS PRIMARY KEY (ID_OFICINA):
-- Define la restricciï¿½n de clave primaria llamada PK_OFICINAS en la columna ID_OFICINA.
-- Garantiza que los valores en ID_OFICINA sean ï¿½nicos y no nulos.
-- Crea automï¿½ticamente un ï¿½ndice para mejorar el rendimiento en bï¿½squedas y consultas.
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
VALUES ('Cliente', 203, 'Carlos Sanchez', 'Boulevard de los Sueï¿½os Rotos 99', '555-8765', 'carlos.sanchez@example.com');

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
VALUES (302, 'Baterï¿½a', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (303, 'Aceite de motor', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (304, 'Filtro de combustible', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'admin');

INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO)
VALUES (305, 'Pastillas de freno', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'admin');

ALTER TABLE REPUESTOS ADD (PRECIO_REPUESTO NUMBER(10, 2));

UPDATE REPUESTOS SET PRECIO_REPUESTO = 2500 WHERE COD_REPUESTO = 301; -- Filtro de aire
UPDATE REPUESTOS SET PRECIO_REPUESTO = 7000 WHERE COD_REPUESTO = 302; -- Baterï¿½a
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
-- Crear tabla de vehï¿½culos
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
VALUES (102, 'Alineaciï¿½n y Balanceo', 'Servicio de alineaciï¿½n y balanceo de neumï¿½ticos', 75.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (103, 'Lavado de Carro', 'Lavado completo del vehï¿½culo', 25.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (104, 'Revisiï¿½n de Frenos', 'Inspecciï¿½n y ajuste de frenos', 100.00);

INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
VALUES (105, 'Cambio de Baterï¿½a', 'Reemplazo de baterï¿½a del vehï¿½culo', 150.00);
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


SET SERVEROUTPUT ON;

-----------------------    CONTACTOS   -----------------------------------------
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_contacto (
    p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE,
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE,
    p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_direccion_contacto IN CONTACTOS.DIRECCION_CONTACTO%TYPE,
    p_telefono_contacto IN CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_email_contacto IN CONTACTOS.EMAIL_CONTACTO%TYPE
) AS
BEGIN
    INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO)
    VALUES (p_tipo_contacto, p_cod_contacto, p_nombre_contacto, p_direccion_contacto, p_telefono_contacto, p_email_contacto);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Contacto insertado:');
    DBMS_OUTPUT.PUT_LINE(' Tipo de Contacto: ' || p_tipo_contacto);
    DBMS_OUTPUT.PUT_LINE(' Código de Contacto: ' || p_cod_contacto);
    DBMS_OUTPUT.PUT_LINE(' Nombre: ' || p_nombre_contacto);
    DBMS_OUTPUT.PUT_LINE(' Dirección: ' || p_direccion_contacto);
    DBMS_OUTPUT.PUT_LINE(' Teléfono: ' || p_telefono_contacto);
    DBMS_OUTPUT.PUT_LINE(' Email: ' || p_email_contacto);
END;
/
-- Ejemplo de uso:
BEGIN
    insert_contacto('Cliente', 206, 'Pedro Alvarado', 'Calle del Sol 123', '555-9999', 'pedro.alvarado@example.com');
END;
/
SELECT * FROM CONTACTOS;

------------------------    LEER   --------------------------------------------
CREATE OR REPLACE PROCEDURE get_contacto (
    p_id_contacto IN CONTACTOS.ID_CONTACTO%TYPE
) AS
    v_tipo_contacto CONTACTOS.TIPO_CONTACTO%TYPE;
    v_cod_contacto CONTACTOS.COD_CONTACTO%TYPE;
    v_nombre_contacto CONTACTOS.NOMBRE_CONTACTO%TYPE;
    v_direccion_contacto CONTACTOS.DIRECCION_CONTACTO%TYPE;
    v_telefono_contacto CONTACTOS.TELEFONO_CONTACTO%TYPE;
    v_email_contacto CONTACTOS.EMAIL_CONTACTO%TYPE;
BEGIN
    SELECT TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO
    INTO v_tipo_contacto, v_cod_contacto, v_nombre_contacto, v_direccion_contacto, v_telefono_contacto, v_email_contacto
    FROM CONTACTOS
    WHERE ID_CONTACTO = p_id_contacto;

    DBMS_OUTPUT.PUT_LINE('Detalles del Contacto:');
    DBMS_OUTPUT.PUT_LINE(' Tipo de Contacto: ' || v_tipo_contacto);
    DBMS_OUTPUT.PUT_LINE(' Código de Contacto: ' || v_cod_contacto);
    DBMS_OUTPUT.PUT_LINE(' Nombre: ' || v_nombre_contacto);
    DBMS_OUTPUT.PUT_LINE(' Dirección: ' || v_direccion_contacto);
    DBMS_OUTPUT.PUT_LINE(' Teléfono: ' || v_telefono_contacto);
    DBMS_OUTPUT.PUT_LINE(' Email: ' || v_email_contacto);
END;
/
-- Ejemplo de uso:
BEGIN
    get_contacto(1);
END;
/
SELECT * FROM CONTACTOS;

------------------------    ACTUALIZAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE update_contacto (
    p_id_contacto IN CONTACTOS.ID_CONTACTO%TYPE,
    p_tipo_contacto IN CONTACTOS.TIPO_CONTACTO%TYPE,
    p_cod_contacto IN CONTACTOS.COD_CONTACTO%TYPE,
    p_nombre_contacto IN CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_direccion_contacto IN CONTACTOS.DIRECCION_CONTACTO%TYPE,
    p_telefono_contacto IN CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_email_contacto IN CONTACTOS.EMAIL_CONTACTO%TYPE
) AS
BEGIN
    UPDATE CONTACTOS
    SET TIPO_CONTACTO = p_tipo_contacto,
        COD_CONTACTO = p_cod_contacto,
        NOMBRE_CONTACTO = p_nombre_contacto,
        DIRECCION_CONTACTO = p_direccion_contacto,
        TELEFONO_CONTACTO = p_telefono_contacto,
        EMAIL_CONTACTO = p_email_contacto
    WHERE ID_CONTACTO = p_id_contacto;
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Contacto actualizado:');
    DBMS_OUTPUT.PUT_LINE(' ID de Contacto: ' || p_id_contacto);
    DBMS_OUTPUT.PUT_LINE(' Tipo de Contacto: ' || p_tipo_contacto);
    DBMS_OUTPUT.PUT_LINE(' Código de Contacto: ' || p_cod_contacto);
    DBMS_OUTPUT.PUT_LINE(' Nombre: ' || p_nombre_contacto);
    DBMS_OUTPUT.PUT_LINE(' Dirección: ' || p_direccion_contacto);
    DBMS_OUTPUT.PUT_LINE(' Teléfono: ' || p_telefono_contacto);
    DBMS_OUTPUT.PUT_LINE(' Email: ' || p_email_contacto);
END;
/
-- Ejemplo de uso:
BEGIN
    update_contacto(1, 'Proveedor', 201, 'Juan Perez', 'Calle Falsa 123', '555-1234', 'nuevo.juan.perez@example.com');
END;
/
SELECT * FROM CONTACTOS;

------------------------    ELIMINAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE delete_contacto(p_id_contacto IN CONTACTOS.ID_CONTACTO%TYPE) AS
BEGIN
    -- Eliminar registros relacionados en la tabla DETALLE_FACTURA
    DELETE FROM DETALLE_FACTURA
    WHERE COD_FACTURA IN (
        SELECT ID_FACTURA 
        FROM FACTURAS 
        WHERE COD_CLIENTE = p_id_contacto
    );

    -- Eliminar registros relacionados en la tabla FACTURAS
    DELETE FROM FACTURAS
    WHERE COD_CLIENTE = p_id_contacto;

    -- Eliminar el contacto en la tabla CONTACTOS
    DELETE FROM CONTACTOS
    WHERE ID_CONTACTO = p_id_contacto;

    -- Confirmar que la eliminación se realizó correctamente
    DBMS_OUTPUT.PUT_LINE('Contacto con ID ' || p_id_contacto || ' eliminado correctamente.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el contacto con ID ' || p_id_contacto || ': ' || SQLERRM);
END;
/

BEGIN
    delete_contacto(206);  -- Aquí hay que poner el ID según se quiera
END;

SELECT * FROM CONTACTOS;

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
    
    DBMS_OUTPUT.PUT_LINE('Factura insertada: ' || p_cod_factura);
END;
/

-- Ejemplo de uso:
SET SERVEROUTPUT ON;
BEGIN
    insert_factura(1006, 2, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 3000.00);
END;
/

SELECT * FROM FACTURAS;
------------------------    LEER   ---------------------------------------------

CREATE OR REPLACE PROCEDURE get_factura (
    p_id_factura IN FACTURAS.ID_FACTURA%TYPE
) AS
    v_cod_factura FACTURAS.COD_FACTURA%TYPE;
    v_cod_cliente FACTURAS.COD_CLIENTE%TYPE;
    v_fecha_factura FACTURAS.FECHA_FACTURA%TYPE;
    v_total_factura FACTURAS.TOTAL_FACTURA%TYPE;
BEGIN
    SELECT COD_FACTURA, COD_CLIENTE, FECHA_FACTURA, TOTAL_FACTURA
    INTO v_cod_factura, v_cod_cliente, v_fecha_factura, v_total_factura
    FROM FACTURAS
    WHERE ID_FACTURA = p_id_factura;
    
    DBMS_OUTPUT.PUT_LINE('Código Factura: ' || v_cod_factura);
    DBMS_OUTPUT.PUT_LINE('Código Cliente: ' || v_cod_cliente);
    DBMS_OUTPUT.PUT_LINE('Fecha Factura: ' || v_fecha_factura);
    DBMS_OUTPUT.PUT_LINE('Total Factura: ' || v_total_factura);
END;
/

-- Ejemplo de uso:
SET SERVEROUTPUT ON;
BEGIN
    get_factura(1);
END;
/

SELECT * FROM FACTURAS;
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
    
    DBMS_OUTPUT.PUT_LINE('Factura actualizada: ' || p_cod_factura);
END;
/

-- Ejemplo de uso:
SET SERVEROUTPUT ON;
BEGIN
    update_factura(1, 1001, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1600.00);
END;
/

SELECT * FROM FACTURAS;
------------------------    BORRAR   -------------------------------------------
CREATE OR REPLACE PROCEDURE delete_factura (
    p_id_factura IN FACTURAS.ID_FACTURA%TYPE
) AS
BEGIN
    -- Eliminar detalles de la factura
    DELETE FROM DETALLE_FACTURA WHERE COD_FACTURA = p_id_factura;

    -- Eliminar la factura
    DELETE FROM FACTURAS WHERE ID_FACTURA = p_id_factura;
    
    -- Confirmar la eliminación
    DBMS_OUTPUT.PUT_LINE('Factura eliminada con ID: ' || p_id_factura);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la factura: ' || SQLERRM);
END;
/


-- Ejemplo de uso:
SET SERVEROUTPUT ON;
BEGIN
    delete_factura(6); -- aquí se cambia el id de factura que queremos eliminar
END;
/

SELECT * FROM FACTURAS;


--------------------------   REPUESTOS   ---------------------------------------
-- Ver todos los repuestos
SELECT * FROM REPUESTOS;

SET SERVEROUTPUT ON;
------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_repuesto (
    p_cod_repuesto IN REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN REPUESTOS.NOMBRE_USUARIO%TYPE,
    p_precio_repuesto IN REPUESTOS.PRECIO_REPUESTO%TYPE
) AS
BEGIN
    INSERT INTO REPUESTOS (COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO, PRECIO_REPUESTO)
    VALUES (p_cod_repuesto, p_nombre_repuesto, p_fecha_registro, p_nombre_usuario, p_precio_repuesto);
    
    DBMS_OUTPUT.PUT_LINE('Repuesto insertado correctamente.');
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_REPUESTO: ' || p_nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('FECHA_REGISTRO: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_USUARIO: ' || p_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('PRECIO_REPUESTO: ' || p_precio_repuesto);
END;
/

-- Usar procedimiento
BEGIN
    insert_repuesto(
        p_cod_repuesto => 307,
        p_nombre_repuesto => 'Amortiguador',
        p_fecha_registro => DATE '2024-07-16',
        p_nombre_usuario => 'admin',
        p_precio_repuesto => 2000.00
    );
END;
/

SELECT * FROM REPUESTOS;
------------------------    LEER   ---------------------------------------------
CREATE OR REPLACE PROCEDURE get_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE,
    p_cod_repuesto OUT REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto OUT REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro OUT REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario OUT REPUESTOS.NOMBRE_USUARIO%TYPE,
    p_precio_repuesto OUT REPUESTOS.PRECIO_REPUESTO%TYPE
) AS
BEGIN
    SELECT COD_REPUESTO, NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO, PRECIO_REPUESTO
    INTO p_cod_repuesto, p_nombre_repuesto, p_fecha_registro, p_nombre_usuario, p_precio_repuesto
    FROM REPUESTOS
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto encontrado correctamente.');
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_REPUESTO: ' || p_nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('FECHA_REGISTRO: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_USUARIO: ' || p_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('PRECIO_REPUESTO: ' || p_precio_repuesto);
END;
/

-- Usar procedimiento
DECLARE
    v_id_repuesto REPUESTOS.ID_REPUESTO%TYPE := 1; 
    v_cod_repuesto REPUESTOS.COD_REPUESTO%TYPE;
    v_nombre_repuesto REPUESTOS.NOMBRE_REPUESTO%TYPE;
    v_fecha_registro REPUESTOS.FECHA_REGISTRO%TYPE;
    v_nombre_usuario REPUESTOS.NOMBRE_USUARIO%TYPE;
    v_precio_repuesto REPUESTOS.PRECIO_REPUESTO%TYPE;
BEGIN
    -- Llamada al procedimiento get_repuesto
    get_repuesto(
        p_id_repuesto => v_id_repuesto,
        p_cod_repuesto => v_cod_repuesto,
        p_nombre_repuesto => v_nombre_repuesto,
        p_fecha_registro => v_fecha_registro,
        p_nombre_usuario => v_nombre_usuario,
        p_precio_repuesto => v_precio_repuesto
    );

    -- Imprimir los resultados
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || v_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_REPUESTO: ' || v_nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('FECHA_REGISTRO: ' || v_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_USUARIO: ' || v_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('PRECIO_REPUESTO: ' || v_precio_repuesto);
END;
/

------------------------    ACTUALIZAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE update_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE,
    p_cod_repuesto IN REPUESTOS.COD_REPUESTO%TYPE,
    p_nombre_repuesto IN REPUESTOS.NOMBRE_REPUESTO%TYPE,
    p_fecha_registro IN REPUESTOS.FECHA_REGISTRO%TYPE,
    p_nombre_usuario IN REPUESTOS.NOMBRE_USUARIO%TYPE,
    p_precio_repuesto IN REPUESTOS.PRECIO_REPUESTO%TYPE
) AS
BEGIN
    UPDATE REPUESTOS
    SET COD_REPUESTO = p_cod_repuesto,
        NOMBRE_REPUESTO = p_nombre_repuesto,
        FECHA_REGISTRO = p_fecha_registro,
        NOMBRE_USUARIO = p_nombre_usuario,
        PRECIO_REPUESTO = p_precio_repuesto
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto actualizado correctamente.');
    DBMS_OUTPUT.PUT_LINE('ID_REPUESTO: ' || p_id_repuesto);
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_REPUESTO: ' || p_nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('FECHA_REGISTRO: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('NOMBRE_USUARIO: ' || p_nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('PRECIO_REPUESTO: ' || p_precio_repuesto);
END;
/

-- Usar procedimiento
BEGIN
    update_repuesto(
        p_id_repuesto => 1,  
        p_cod_repuesto => 333,
        p_nombre_repuesto => 'Filtro de Aire Modificado',
        p_fecha_registro => DATE '2024-07-24',
        p_nombre_usuario => 'admin_modificado',
        p_precio_repuesto => 2200.00
    );
END;
/

SELECT * FROM REPUESTOS;
------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_repuesto (
    p_id_repuesto IN REPUESTOS.ID_REPUESTO%TYPE
) AS
BEGIN
    DELETE FROM REPUESTOS
    WHERE ID_REPUESTO = p_id_repuesto;
    
    DBMS_OUTPUT.PUT_LINE('Repuesto eliminado correctamente.');
    DBMS_OUTPUT.PUT_LINE('ID_REPUESTO: ' || p_id_repuesto);
END;
/

-- Usar procedimiento
BEGIN
    delete_repuesto(
        p_id_repuesto => 22  -- Aquí se pone el ID del repuesto a eliminar
    );
END;
/

SELECT * FROM REPUESTOS;

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
    
    DBMS_OUTPUT.PUT_LINE('Detalle de factura insertado correctamente.');
    DBMS_OUTPUT.PUT_LINE('COD_FACTURA: ' || p_cod_factura);
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('CANTIDAD: ' || p_cantidad);
END;
/

-- Usar procedimiento
BEGIN
    insert_detalle_factura(
        p_cod_factura => 2,
        p_cod_repuesto => 1,
        p_cantidad => 10
    );
END;
/

SELECT * FROM DETALLE_FACTURA;

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

    DBMS_OUTPUT.PUT_LINE('Detalle de factura encontrado correctamente.');
    DBMS_OUTPUT.PUT_LINE('COD_FACTURA: ' || p_cod_factura);
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('CANTIDAD: ' || p_cantidad);
END;
/

-- Usar procedimiento
DECLARE
    v_cod_factura DETALLE_FACTURA.COD_FACTURA%TYPE;
    v_cod_repuesto DETALLE_FACTURA.COD_REPUESTO%TYPE;
    v_cantidad DETALLE_FACTURA.CANTIDAD%TYPE;
BEGIN
    get_detalle_factura(
        p_id_detalle_factura => 21, -- Acá se pone un ID_DETALLE_FACTURA existente
        p_cod_factura => v_cod_factura,
        p_cod_repuesto => v_cod_repuesto,
        p_cantidad => v_cantidad
    );
    
    DBMS_OUTPUT.PUT_LINE('COD_FACTURA: ' || v_cod_factura);
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || v_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('CANTIDAD: ' || v_cantidad);
END;
/

SELECT * FROM DETALLE_FACTURA;

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

    DBMS_OUTPUT.PUT_LINE('Detalle de factura actualizado correctamente.');
    DBMS_OUTPUT.PUT_LINE('ID_DETALLE_FACTURA: ' || p_id_detalle_factura);
    DBMS_OUTPUT.PUT_LINE('COD_FACTURA: ' || p_cod_factura);
    DBMS_OUTPUT.PUT_LINE('COD_REPUESTO: ' || p_cod_repuesto);
    DBMS_OUTPUT.PUT_LINE('CANTIDAD: ' || p_cantidad);
END;
/

-- Usar procedimiento
BEGIN
    update_detalle_factura(
        p_id_detalle_factura => 5,  -- Aquí se pone un ID_DETALLE_FACTURA existente
        p_cod_factura => 2,
        p_cod_repuesto => 1,
        p_cantidad => 32
    );
END;
/

SELECT * FROM DETALLE_FACTURA;

------------------------    ELIMINAR   -----------------------------------------
CREATE OR REPLACE PROCEDURE delete_detalle_factura (
    p_id_detalle_factura IN DETALLE_FACTURA.ID_DETALLE_FACTURA%TYPE
) AS
BEGIN
    DELETE FROM DETALLE_FACTURA
    WHERE ID_DETALLE_FACTURA = p_id_detalle_factura;
    
    DBMS_OUTPUT.PUT_LINE('Detalle de factura eliminado correctamente.');
    DBMS_OUTPUT.PUT_LINE('ID_DETALLE_FACTURA: ' || p_id_detalle_factura);
END;
/

-- Usar procedimiento
BEGIN
    delete_detalle_factura(
        p_id_detalle_factura => 21  -- Aquí se pone un ID_DETALLE_FACTURA existente
    );
END;
/

SELECT * FROM DETALLE_FACTURA;

--------------------------    OFICINAS   ---------------------------------------
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
    -- Mostrar el contenido de la tabla después de la inserción
    FOR rec IN (SELECT * FROM OFICINAS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID_OFICINA: ' || rec.ID_OFICINA || ', NOMBRE_OFICINA: ' || rec.NOMBRE_OFICINA || ', FECHA_REGISTRO: ' || rec.FECHA_REGISTRO);
    END LOOP;
END;

-- Usar procedure
BEGIN
    insert_oficina(
        p_nombre_oficina => 'Oficina Central',
        p_fecha_registro => DATE '2024-07-23'
    );
END;

SELECT * FROM OFICINAS;
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
    DBMS_OUTPUT.PUT_LINE('Nombre de Oficina: ' || p_nombre_oficina);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || p_fecha_registro);
END;

-- Usar procedure
DECLARE
    v_nombre_oficina OFICINAS.NOMBRE_OFICINA%TYPE;
    v_fecha_registro OFICINAS.FECHA_REGISTRO%TYPE;
BEGIN
    get_oficina(
        p_id_oficina => 1,  -- Aquí se pone un ID_OFICINA existente
        p_nombre_oficina => v_nombre_oficina,
        p_fecha_registro => v_fecha_registro
    );
END;

SELECT * FROM OFICINAS;

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
    -- Mostrar el contenido de la tabla después de la actualización
    FOR rec IN (SELECT * FROM OFICINAS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID_OFICINA: ' || rec.ID_OFICINA || ', NOMBRE_OFICINA: ' || rec.NOMBRE_OFICINA || ', FECHA_REGISTRO: ' || rec.FECHA_REGISTRO);
    END LOOP;
END;

-- Usar procedure
BEGIN
    update_oficina(
        p_id_oficina => 1,  -- Aquí se pone un ID_OFICINA existente
        p_nombre_oficina => 'Oficina Regional',
        p_fecha_registro => DATE '2024-07-24'
    );
END;

SELECT * FROM OFICINAS;

------------------------    ELIMINAR   -----------------------------------------

CREATE OR REPLACE PROCEDURE delete_oficina (
    p_id_oficina IN OFICINAS.ID_OFICINA%TYPE
) AS
BEGIN
    DELETE FROM OFICINAS
    WHERE ID_OFICINA = p_id_oficina;
    
    DBMS_OUTPUT.PUT_LINE('Oficina eliminada correctamente');
    -- Mostrar el contenido de la tabla después de la eliminación
    FOR rec IN (SELECT * FROM OFICINAS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID_OFICINA: ' || rec.ID_OFICINA || ', NOMBRE_OFICINA: ' || rec.NOMBRE_OFICINA || ', FECHA_REGISTRO: ' || rec.FECHA_REGISTRO);
    END LOOP;
END;

-- Usar procedure
BEGIN
    delete_oficina(
        p_id_oficina => 21  -- Aquí con un ID_OFICINA existente
    );
END;

SELECT * FROM OFICINAS;

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
    
    DBMS_OUTPUT.PUT_LINE('Vehículo insertado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Número de Placa: ' || p_num_placa);
    DBMS_OUTPUT.PUT_LINE('Tipo de Vehículo: ' || p_tipo_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Estado del Vehículo: ' || p_estado_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Marca: ' || p_marca);
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || p_modelo);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || p_nombre_usuario);
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

SELECT * FROM VEHICULOS;

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

    DBMS_OUTPUT.PUT_LINE('Vehículo encontrado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Número de Placa: ' || p_num_placa);
    DBMS_OUTPUT.PUT_LINE('Tipo de Vehículo: ' || p_tipo_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Estado del Vehículo: ' || p_estado_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Marca: ' || p_marca);
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || p_modelo);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || p_nombre_usuario);
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
        p_id_vehiculo => 1,  -- Reemplaza con un ID_VEHICULO existente
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

SELECT * FROM VEHICULOS;

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
    
    DBMS_OUTPUT.PUT_LINE('Vehículo actualizado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Vehículo: ' || p_id_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Número de Placa: ' || p_num_placa);
    DBMS_OUTPUT.PUT_LINE('Tipo de Vehículo: ' || p_tipo_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Estado del Vehículo: ' || p_estado_vehiculo);
    DBMS_OUTPUT.PUT_LINE('Marca: ' || p_marca);
    DBMS_OUTPUT.PUT_LINE('Modelo: ' || p_modelo);
    DBMS_OUTPUT.PUT_LINE('Fecha de Registro: ' || p_fecha_registro);
    DBMS_OUTPUT.PUT_LINE('Nombre de Usuario: ' || p_nombre_usuario);
END;

-- Usar procedure
BEGIN
    update_vehiculo(
        p_id_vehiculo => 1,  -- Reemplaza con un ID_VEHICULO existente
        p_num_placa => 'XYZ78911',
        p_tipo_vehiculo => 'Hatchback',
        p_estado_vehiculo => 'Activo',
        p_marca => 'Ford',
        p_modelo => 'Focus',
        p_fecha_registro => DATE '2024-08-26',
        p_nombre_usuario => 'Ana Pérez'
    );
END;
/

SELECT * FROM VEHICULOS;

------------------------    ELIMINAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE delete_vehiculo (
    p_id_vehiculo IN VEHICULOS.ID_VEHICULO%TYPE
) AS
BEGIN
    DELETE FROM VEHICULOS
    WHERE ID_VEHICULO = p_id_vehiculo;
    
    DBMS_OUTPUT.PUT_LINE('Vehículo eliminado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Vehículo: ' || p_id_vehiculo);
END;

-- Usar procedure
BEGIN
    delete_vehiculo(
        p_id_vehiculo => 21  -- Reemplaza con un ID_VEHICULO existente
    );
END;
/

SELECT * FROM VEHICULOS;

--------------------------    SERVICIOS   ---------------------------------------
SELECT * FROM SERVICIOS;
-- ----------------------------    CREAR   --------------------------------------------
CREATE OR REPLACE PROCEDURE insert_servicio (
    p_cod_servicio IN SERVICIOS.COD_SERVICIO%TYPE,
    p_nombre_servicio IN SERVICIOS.NOMBRE_SERVICIO%TYPE,
    p_descripcion_servicio IN SERVICIOS.DESCRIPCION_SERVICIO%TYPE,
    p_precio_servicio IN SERVICIOS.PRECIO_SERVICIO%TYPE
) AS
BEGIN
    INSERT INTO SERVICIOS (COD_SERVICIO, NOMBRE_SERVICIO, DESCRIPCION_SERVICIO, PRECIO_SERVICIO)
    VALUES (p_cod_servicio, p_nombre_servicio, p_descripcion_servicio, p_precio_servicio);
    
    DBMS_OUTPUT.PUT_LINE('Servicio insertado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Código Servicio: ' || p_cod_servicio);
    DBMS_OUTPUT.PUT_LINE('Nombre del Servicio: ' || p_nombre_servicio);
    DBMS_OUTPUT.PUT_LINE('Descripción del Servicio: ' || p_descripcion_servicio);
    DBMS_OUTPUT.PUT_LINE('Precio del Servicio: ' || p_precio_servicio);
END;

-- Usar procedure
BEGIN
    insert_servicio(
        p_cod_servicio => 106,
        p_nombre_servicio => 'Cambio de Neumáticos',
        p_descripcion_servicio => 'Reemplazo de neumáticos',
        p_precio_servicio => 200.00
    );
END;
/

SELECT * FROM SERVICIOS;

-- ----------------------------    LEER   ---------------------------------------------
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

    DBMS_OUTPUT.PUT_LINE('Servicio encontrado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Código Servicio: ' || p_cod_servicio);
    DBMS_OUTPUT.PUT_LINE('Nombre del Servicio: ' || p_nombre_servicio);
    DBMS_OUTPUT.PUT_LINE('Descripción del Servicio: ' || p_descripcion_servicio);
    DBMS_OUTPUT.PUT_LINE('Precio del Servicio: ' || p_precio_servicio);
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
    DBMS_OUTPUT.PUT_LINE('Código Servicio: ' || v_cod_servicio);
    DBMS_OUTPUT.PUT_LINE('Nombre del Servicio: ' || v_nombre_servicio);
    DBMS_OUTPUT.PUT_LINE('Descripción del Servicio: ' || v_descripcion_servicio);
    DBMS_OUTPUT.PUT_LINE('Precio del Servicio: ' || v_precio_servicio);
END;
/

SELECT * FROM SERVICIOS;

-- ----------------------------    ACTUALIZAR   ---------------------------------------
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
    
    DBMS_OUTPUT.PUT_LINE('Servicio actualizado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || p_id_servicio);
    DBMS_OUTPUT.PUT_LINE('Código Servicio: ' || p_cod_servicio);
    DBMS_OUTPUT.PUT_LINE('Nombre del Servicio: ' || p_nombre_servicio);
    DBMS_OUTPUT.PUT_LINE('Descripción del Servicio: ' || p_descripcion_servicio);
    DBMS_OUTPUT.PUT_LINE('Precio del Servicio: ' || p_precio_servicio);
END;

-- Usar procedure
BEGIN
    update_servicio(
        p_id_servicio => 21,  -- Reemplaza con un ID_SERVICIO existente
        p_cod_servicio => 106,
        p_nombre_servicio => 'Cambio de Neumáticos y Balanceo',
        p_descripcion_servicio => 'Reemplazo y balanceo de neumáticos',
        p_precio_servicio => 250.00
    );
END;
/

SELECT * FROM SERVICIOS;

-- ----------------------------    ELIMINAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE delete_servicio (
    p_id_servicio IN SERVICIOS.ID_SERVICIO%TYPE
) AS
BEGIN
    DELETE FROM SERVICIOS
    WHERE ID_SERVICIO = p_id_servicio;
    
    DBMS_OUTPUT.PUT_LINE('Servicio eliminado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || p_id_servicio);
END;

-- Usar procedure
BEGIN
    delete_servicio(
        p_id_servicio => 21  -- Reemplaza con un ID_SERVICIO existente
    );
END;
/

SELECT * FROM SERVICIOS;

-- --------------------------    EMPLEADOS   ---------------------------------------
SELECT * FROM EMPLEADOS;

-- ----------------------------    CREAR   --------------------------------------------
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
    
    DBMS_OUTPUT.PUT_LINE('Empleado insertado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Nombre del Empleado: ' || p_nombre_empleado);
    DBMS_OUTPUT.PUT_LINE('Apellido del Empleado: ' || p_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Cargo del Empleado: ' || p_cargo_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha de Contratación: ' || p_fecha_contratacion);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || p_salario);
END;

-- Usar procedure
BEGIN
    insert_empleado(
        p_nombre_empleado => 'Pedro',
        p_apellido_empleado => 'López',
        p_cargo_empleado => 'Técnico',
        p_fecha_contratacion => TO_DATE('2024-08-15', 'YYYY-MM-DD'),
        p_salario => 3200.00
    );
END;
/

SELECT * FROM EMPLEADOS;

-- ----------------------------    LEER   ---------------------------------------------
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

    DBMS_OUTPUT.PUT_LINE('Empleado encontrado correctamente:');
    DBMS_OUTPUT.PUT_LINE('Nombre del Empleado: ' || p_nombre_empleado);
    DBMS_OUTPUT.PUT_LINE('Apellido del Empleado: ' || p_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Cargo del Empleado: ' || p_cargo_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha de Contratación: ' || p_fecha_contratacion);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || p_salario);
END;

-- Usar procedure
DECLARE
    v_nombre_empleado EMPLEADOS.NOMBRE_EMPLEADO%TYPE;
    v_apellido_empleado EMPLEADOS.APELLIDO_EMPLEADO%TYPE;
    v_cargo_empleado EMPLEADOS.CARGO_EMPLEADO%TYPE;
    v_fecha_contratacion EMPLEADOS.FECHA_CONTRATACION%TYPE;
    v_salario EMPLEADOS.SALARIO%TYPE;
BEGIN
    get_empleado(
        p_id_empleado => 1,  -- Aquí se pone un ID_EMPLEADO existente
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
/

SELECT * FROM EMPLEADOS;

-- ----------------------------    ACTUALIZAR   ---------------------------------------
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
    
    DBMS_OUTPUT.PUT_LINE('Empleado actualizado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || p_id_empleado);
    DBMS_OUTPUT.PUT_LINE('Nombre del Empleado: ' || p_nombre_empleado);
    DBMS_OUTPUT.PUT_LINE('Apellido del Empleado: ' || p_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Cargo del Empleado: ' || p_cargo_empleado);
    DBMS_OUTPUT.PUT_LINE('Fecha de Contratación: ' || p_fecha_contratacion);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || p_salario);
END;

-- Usar procedure
BEGIN
    update_empleado(
        p_id_empleado => 2,  -- Reemplaza con un ID_EMPLEADO existente
        p_nombre_empleado => 'Maria',
        p_apellido_empleado => 'Gómez',
        p_cargo_empleado => 'Coordinadora',
        p_fecha_contratacion => TO_DATE('2023-02-15', 'YYYY-MM-DD'),
        p_salario => 3500.00
    );
END;
/

SELECT * FROM EMPLEADOS;

-- ----------------------------    ELIMINAR   ---------------------------------------
CREATE OR REPLACE PROCEDURE delete_empleado (
    p_id_empleado IN EMPLEADOS.ID_EMPLEADO%TYPE
) AS
BEGIN
    DELETE FROM EMPLEADOS
    WHERE ID_EMPLEADO = p_id_empleado;
    
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado correctamente:');
    DBMS_OUTPUT.PUT_LINE('ID Empleado: ' || p_id_empleado);
END;

-- Usar procedure
BEGIN
    delete_empleado(
        p_id_empleado => 1  -- Reemplaza con un ID_EMPLEADO existente
    );
END;
/

SELECT * FROM EMPLEADOS;

/*
**********************************************************************
*                                                                    *
*                             FUNCIONES                              *
*                                                                    *
**********************************************************************
*/

--------------------------Dani----------------------------------------

-- Habilitar la salida de DBMS_OUTPUT para las funciones
SET SERVEROUTPUT ON;

--------------------------------------------------------------------------------
-- Función 1: Obtener el nombre completo de un contacto por su ID
CREATE OR REPLACE FUNCTION obtener_nombre_contacto (p_id_contacto INTEGER) RETURN VARCHAR2 IS
    v_nombre_contacto VARCHAR2(100);
BEGIN
    SELECT NOMBRE_CONTACTO INTO v_nombre_contacto 
    FROM CONTACTOS 
    WHERE ID_CONTACTO = p_id_contacto;
    RETURN v_nombre_contacto;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Contacto no encontrado';
END obtener_nombre_contacto;
/
-- Llamada a la función 1
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nombre del contacto: ' || obtener_nombre_contacto(1));
END;
/
--------------------------------------------------------------------------------
-- Función 2: Calcular el total de una factura por ID_FACTURA
CREATE OR REPLACE FUNCTION calcular_total_factura (p_id_factura INTEGER) RETURN NUMBER IS
    v_total NUMBER(10,2);
BEGIN
    SELECT SUM(df.CANTIDAD * r.PRECIO_REPUESTO) INTO v_total
    FROM DETALLE_FACTURA df
    JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
    WHERE df.COD_FACTURA = p_id_factura;
    RETURN NVL(v_total, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END calcular_total_factura;
/
-- Llamada a la función 2
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total de la factura: ' || calcular_total_factura(1));
END;
/
--------------------------------------------------------------------------------
-- Función 3: Obtener la lista de repuestos en una factura por ID_FACTURA
CREATE OR REPLACE FUNCTION listar_repuestos_factura (p_id_factura INTEGER) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT r.NOMBRE_REPUESTO, df.CANTIDAD, r.PRECIO_REPUESTO
        FROM DETALLE_FACTURA df
        JOIN REPUESTOS r ON df.COD_REPUESTO = r.ID_REPUESTO
        WHERE df.COD_FACTURA = p_id_factura;
    RETURN v_cursor;
END listar_repuestos_factura;
/
-- Llamada a la función 3
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre_repuesto VARCHAR2(100);
    v_cantidad INTEGER;
    v_precio NUMBER(10,2);
BEGIN
    v_cursor := listar_repuestos_factura(1);
    LOOP
        FETCH v_cursor INTO v_nombre_repuesto, v_cantidad, v_precio;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Repuesto: ' || v_nombre_repuesto || 
                             ', Cantidad: ' || v_cantidad || 
                             ', Precio Unitario: ' || v_precio);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------------------------------------------------------------------
-- Función 4: Obtener la información de una oficina por su ID
CREATE OR REPLACE FUNCTION obtener_informacion_oficina (p_id_oficina INTEGER) RETURN VARCHAR2 IS
    v_info VARCHAR2(200);
BEGIN
    SELECT 'Nombre: ' || NOMBRE_OFICINA || ', Fecha Registro: ' || TO_CHAR(FECHA_REGISTRO, 'DD/MM/YYYY')
    INTO v_info
    FROM OFICINAS
    WHERE ID_OFICINA = p_id_oficina;
    RETURN v_info;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Oficina no encontrada';
END obtener_informacion_oficina;
/
-- Llamada a la función 4
BEGIN
    DBMS_OUTPUT.PUT_LINE('Información de la oficina: ' || obtener_informacion_oficina(1));
END;
/
--------------------------------------------------------------------------------
-- Función 5: Listar vehículos por tipo de vehículo
CREATE OR REPLACE FUNCTION listar_vehiculos_por_tipo (p_tipo VARCHAR2) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT NUM_PLACA, MARCA, MODELO, ESTADO_VEHICULO
        FROM VEHICULOS
        WHERE TIPO_VEHICULO = p_tipo;
    RETURN v_cursor;
END listar_vehiculos_por_tipo;
/
-- Llamada a la función 5
DECLARE
    v_cursor SYS_REFCURSOR;
    v_num_placa VARCHAR2(100);
    v_marca VARCHAR2(100);
    v_modelo VARCHAR2(100);
    v_estado VARCHAR2(100);
BEGIN
    v_cursor := listar_vehiculos_por_tipo('Sedan');
    LOOP
        FETCH v_cursor INTO v_num_placa, v_marca, v_modelo, v_estado;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Placa: ' || v_num_placa || 
                             ', Marca: ' || v_marca || 
                             ', Modelo: ' || v_modelo || 
                             ', Estado: ' || v_estado);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------------------------------------------------------------------
-- Función 6: Obtener el salario anual de un empleado por su ID
CREATE OR REPLACE FUNCTION obtener_salario_anual (p_id_empleado INTEGER) RETURN NUMBER IS
    v_salario_mensual NUMBER(10,2);
BEGIN
    SELECT SALARIO INTO v_salario_mensual FROM EMPLEADOS WHERE ID_EMPLEADO = p_id_empleado;
    RETURN v_salario_mensual * 12;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END obtener_salario_anual;
/
-- Llamada a la función 6
BEGIN
    DBMS_OUTPUT.PUT_LINE('Salario anual del empleado: ' || obtener_salario_anual(1));
END;
/
--------------------------------------------------------------------------------
-- Función 7: Obtener la descripción de un servicio por su código
CREATE OR REPLACE FUNCTION obtener_descripcion_servicio (p_cod_servicio INTEGER) RETURN VARCHAR2 IS
    v_descripcion VARCHAR2(200);
BEGIN
    SELECT DESCRIPCION_SERVICIO INTO v_descripcion 
    FROM SERVICIOS 
    WHERE COD_SERVICIO = p_cod_servicio;
    RETURN v_descripcion;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Servicio no encontrado';
END obtener_descripcion_servicio;
/
-- Llamada a la función 7
BEGIN
    DBMS_OUTPUT.PUT_LINE('Descripción del servicio: ' || obtener_descripcion_servicio(101));
END;
/
--------------------------------------------------------------------------------
-- Función 8: Listar empleados por cargo
CREATE OR REPLACE FUNCTION listar_empleados_por_cargo (p_cargo VARCHAR2) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, SALARIO
        FROM EMPLEADOS
        WHERE CARGO_EMPLEADO = p_cargo;
    RETURN v_cursor;
END listar_empleados_por_cargo;
/
-- Llamada a la función 8
DECLARE
    v_cursor SYS_REFCURSOR;
    v_nombre VARCHAR2(100);
    v_apellido VARCHAR2(100);
    v_salario NUMBER(10,2);
BEGIN
    v_cursor := listar_empleados_por_cargo('Gerente');
    LOOP
        FETCH v_cursor INTO v_nombre, v_apellido, v_salario;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_nombre || ' ' || v_apellido || 
                             ', Salario: ' || v_salario);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------------------------------------------------------------------
-- Función 9: Calcular el total de repuestos vendidos para un repuesto por su código
CREATE OR REPLACE FUNCTION total_repuestos_vendidos (p_cod_repuesto INTEGER) RETURN INTEGER IS
    v_total INTEGER;
BEGIN
    SELECT SUM(CANTIDAD) INTO v_total
    FROM DETALLE_FACTURA
    WHERE COD_REPUESTO = p_cod_repuesto;
    RETURN NVL(v_total, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END total_repuestos_vendidos;
/
-- Llamada a la función 9
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total de repuestos vendidos: ' || total_repuestos_vendidos(1));
END;
/
--------------------------------------------------------------------------------
-- Función 10: Obtener la fecha de contratación de un empleado por su ID
CREATE OR REPLACE FUNCTION obtener_fecha_contratacion (p_id_empleado INTEGER) RETURN VARCHAR2 IS
    v_fecha DATE;
BEGIN
    SELECT FECHA_CONTRATACION INTO v_fecha 
    FROM EMPLEADOS 
    WHERE ID_EMPLEADO = p_id_empleado;
    RETURN TO_CHAR(v_fecha, 'DD/MM/YYYY');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Empleado no encontrado';
END obtener_fecha_contratacion;
/
-- Llamada a la función 10
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fecha de contratación: ' || obtener_fecha_contratacion(1));
END;
/
--------------------------------------------------------------------------------
-- Función 11: Verificar si un contacto tiene facturas asociadas
CREATE OR REPLACE FUNCTION contacto_tiene_facturas (p_id_contacto INTEGER) RETURN VARCHAR2 IS
    v_existe NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_existe 
    FROM FACTURAS 
    WHERE COD_CLIENTE = p_id_contacto;
    IF v_existe > 0 THEN
        RETURN 'Sí';
    ELSE
        RETURN 'No';
    END IF;
END contacto_tiene_facturas;
/
-- Llamada a la función 11
BEGIN
    DBMS_OUTPUT.PUT_LINE('¿El contacto tiene facturas asociadas? ' || contacto_tiene_facturas(1));
END;
/
--------------------------------------------------------------------------------
-- Función 12: Listar facturas entre dos fechas
CREATE OR REPLACE FUNCTION listar_facturas_por_fecha (p_fecha_inicio DATE, p_fecha_fin DATE) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT COD_FACTURA, FECHA_FACTURA, TOTAL_FACTURA
        FROM FACTURAS
        WHERE FECHA_FACTURA BETWEEN p_fecha_inicio AND p_fecha_fin;
    RETURN v_cursor;
END listar_facturas_por_fecha;
/
-- Llamada a la función 12
DECLARE
    v_cursor SYS_REFCURSOR;
    v_cod_factura INTEGER;
    v_fecha_factura DATE;
    v_total NUMBER(10,2);
BEGIN
    v_cursor := listar_facturas_por_fecha(TO_DATE('2023-01-01','YYYY-MM-DD'), TO_DATE('2023-12-31','YYYY-MM-DD'));
    LOOP
        FETCH v_cursor INTO v_cod_factura, v_fecha_factura, v_total;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Factura: ' || v_cod_factura || 
                             ', Fecha: ' || TO_CHAR(v_fecha_factura, 'DD/MM/YYYY') || 
                             ', Total: ' || v_total);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------------------------------------------------------------------
-- Función 13: Obtener la lista de contactos por tipo (Cliente o Proveedor)
CREATE OR REPLACE FUNCTION listar_contactos_por_tipo (p_tipo VARCHAR2) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT COD_CONTACTO, NOMBRE_CONTACTO, EMAIL_CONTACTO
        FROM CONTACTOS
        WHERE TIPO_CONTACTO = p_tipo;
    RETURN v_cursor;
END listar_contactos_por_tipo;
/
-- Llamada a la función 13
DECLARE
    v_cursor SYS_REFCURSOR;
    v_cod_contacto INTEGER;
    v_nombre VARCHAR2(100);
    v_email VARCHAR2(100);
BEGIN
    v_cursor := listar_contactos_por_tipo('Cliente');
    LOOP
        FETCH v_cursor INTO v_cod_contacto, v_nombre, v_email;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Contacto ID: ' || v_cod_contacto || 
                             ', Nombre: ' || v_nombre || 
                             ', Email: ' || v_email);
    END LOOP;
    CLOSE v_cursor;
END;
/
--------------------------------------------------------------------------------
-- Función 14: Calcular el promedio de salario de los empleados
CREATE OR REPLACE FUNCTION promedio_salario_empleados RETURN NUMBER IS
    v_promedio NUMBER(10,2);
BEGIN
    SELECT AVG(SALARIO) INTO v_promedio FROM EMPLEADOS;
    RETURN NVL(v_promedio, 0);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END promedio_salario_empleados;
/
-- Llamada a la función 14
BEGIN
    DBMS_OUTPUT.PUT_LINE('Promedio de salario de empleados: ' || promedio_salario_empleados());
END;
/
--------------------------------------------------------------------------------
-- Función 15: Obtener el nombre de la oficina con más registros
CREATE OR REPLACE FUNCTION oficina_con_mas_registros RETURN VARCHAR2 IS
    v_nombre_oficina VARCHAR2(50);
BEGIN
    SELECT NOMBRE_OFICINA INTO v_nombre_oficina
    FROM OFICINAS
    WHERE ID_OFICINA = (
        SELECT ID_OFICINA
        FROM OFICINAS
        ORDER BY ID_OFICINA DESC
        FETCH FIRST 1 ROWS ONLY
    );
    RETURN v_nombre_oficina;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No hay oficinas registradas';
END oficina_con_mas_registros;
/
-- Llamada a la función 15
BEGIN
    DBMS_OUTPUT.PUT_LINE('Oficina con más registros: ' || oficina_con_mas_registros());
END;
/

/*
**********************************************************************
*                                                                    *
*                             PROCEDIMIENTOS                         *
*                                                                    *
**********************************************************************
*/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 1: Mostrar todos los contactos
CREATE OR REPLACE PROCEDURE mostrar_contactos IS
BEGIN
    FOR rec IN (SELECT * FROM CONTACTOS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_CONTACTO || ', Nombre: ' || rec.NOMBRE_CONTACTO || ', Tipo: ' || rec.TIPO_CONTACTO);
    END LOOP;
END mostrar_contactos;
/

-- Llamada al procedimiento
BEGIN
    mostrar_contactos;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 2: Mostrar todas las facturas
CREATE OR REPLACE PROCEDURE mostrar_facturas IS
BEGIN
    FOR rec IN (SELECT * FROM FACTURAS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_FACTURA || ', Fecha: ' || rec.FECHA_FACTURA || ', Total: ' || rec.TOTAL_FACTURA);
    END LOOP;
END mostrar_facturas;
/

-- Llamada al procedimiento
BEGIN
    mostrar_facturas;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 3: Mostrar todos los repuestos
CREATE OR REPLACE PROCEDURE mostrar_repuestos IS
BEGIN
    FOR rec IN (SELECT * FROM REPUESTOS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_REPUESTO || ', Nombre: ' || rec.NOMBRE_REPUESTO || ', Precio: ' || rec.PRECIO_REPUESTO);
    END LOOP;
END mostrar_repuestos;
/

-- Llamada al procedimiento
BEGIN
    mostrar_repuestos;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 4: Mostrar todas las oficinas
CREATE OR REPLACE PROCEDURE mostrar_oficinas IS
BEGIN
    FOR rec IN (SELECT * FROM OFICINAS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_OFICINA || ', Nombre: ' || rec.NOMBRE_OFICINA);
    END LOOP;
END mostrar_oficinas;
/

-- Llamada al procedimiento
BEGIN
    mostrar_oficinas;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 5: Mostrar todos los vehículos
CREATE OR REPLACE PROCEDURE mostrar_vehiculos IS
BEGIN
    FOR rec IN (SELECT * FROM VEHICULOS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_VEHICULO || ', Placa: ' || rec.NUM_PLACA || ', Marca: ' || rec.MARCA);
    END LOOP;
END mostrar_vehiculos;
/

-- Llamada al procedimiento
BEGIN
    mostrar_vehiculos;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 6: Mostrar todos los servicios
CREATE OR REPLACE PROCEDURE mostrar_servicios IS
BEGIN
    FOR rec IN (SELECT * FROM SERVICIOS) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_SERVICIO || ', Nombre: ' || rec.NOMBRE_SERVICIO || ', Precio: ' || rec.PRECIO_SERVICIO);
    END LOOP;
END mostrar_servicios;
/

-- Llamada al procedimiento
BEGIN
    mostrar_servicios;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 7: Obtener el salario de un empleado por ID
CREATE OR REPLACE PROCEDURE mostrar_salario(emp_id NUMBER) IS
    salario NUMBER;
BEGIN
    SELECT SALARIO INTO salario
    FROM EMPLEADOS
    WHERE ID_EMPLEADO = emp_id;
    DBMS_OUTPUT.PUT_LINE('Salario: ' || salario);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Empleado no encontrado.');
END mostrar_salario;
/

-- Llamada al procedimiento
BEGIN
    mostrar_salario(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 8: Obtener el nombre de un contacto por ID
CREATE OR REPLACE PROCEDURE mostrar_nombre_contacto(contacto_id NUMBER) IS
    nombre_contacto VARCHAR2(100);
BEGIN
    SELECT NOMBRE_CONTACTO INTO nombre_contacto
    FROM CONTACTOS
    WHERE ID_CONTACTO = contacto_id;
    DBMS_OUTPUT.PUT_LINE('Nombre del contacto: ' || nombre_contacto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Contacto no encontrado.');
END mostrar_nombre_contacto;
/

-- Llamada al procedimiento
BEGIN
    mostrar_nombre_contacto(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 9: Obtener las facturas de un cliente por código
CREATE OR REPLACE PROCEDURE mostrar_facturas_cliente(cod_cliente NUMBER) IS
BEGIN
    FOR rec IN (SELECT * FROM FACTURAS WHERE COD_CLIENTE = cod_cliente) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || rec.ID_FACTURA || ', Fecha: ' || rec.FECHA_FACTURA || ', Total: ' || rec.TOTAL_FACTURA);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron facturas para el cliente.');
END mostrar_facturas_cliente;
/

-- Llamada al procedimiento
BEGIN
    mostrar_facturas_cliente(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 10: Obtener los repuestos con precio mayor a un valor
CREATE OR REPLACE PROCEDURE mostrar_repuestos_precio_mayor(valor_precio NUMBER) IS
BEGIN
    FOR rec IN (SELECT * FROM REPUESTOS WHERE PRECIO_REPUESTO > valor_precio) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_REPUESTO || ', Nombre: ' || rec.NOMBRE_REPUESTO || ', Precio: ' || rec.PRECIO_REPUESTO);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron repuestos con el precio especificado.');
END mostrar_repuestos_precio_mayor;
/

-- Llamada al procedimiento
BEGIN
    mostrar_repuestos_precio_mayor(3000);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 11: Obtener el total de facturas para un cliente
CREATE OR REPLACE PROCEDURE total_facturas_cliente(cod_cliente NUMBER) IS
    total NUMBER;
BEGIN
    SELECT SUM(TOTAL_FACTURA) INTO total
    FROM FACTURAS
    WHERE COD_CLIENTE = cod_cliente;
    DBMS_OUTPUT.PUT_LINE('Total de facturas para el cliente: ' || total);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Cliente no encontrado o sin facturas.');
END total_facturas_cliente;
/

-- Llamada al procedimiento
BEGIN
    total_facturas_cliente(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 12: Obtener el número de repuestos en inventario
CREATE OR REPLACE PROCEDURE contar_repuestos IS
    total_repuestos NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_repuestos
    FROM REPUESTOS;
    DBMS_OUTPUT.PUT_LINE('Total de repuestos en inventario: ' || total_repuestos);
END contar_repuestos;
/

-- Llamada al procedimiento
BEGIN
    contar_repuestos;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 13: Mostrar los servicios con precio mayor a un valor
CREATE OR REPLACE PROCEDURE mostrar_servicios_precio_mayor(valor_precio NUMBER) IS
BEGIN
    FOR rec IN (SELECT * FROM SERVICIOS WHERE PRECIO_SERVICIO > valor_precio) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_SERVICIO || ', Nombre: ' || rec.NOMBRE_SERVICIO || ', Precio: ' || rec.PRECIO_SERVICIO);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron servicios con el precio especificado.');
END mostrar_servicios_precio_mayor;
/

-- Llamada al procedimiento
BEGIN
    mostrar_servicios_precio_mayor(50);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 14: Obtener el número de empleados
CREATE OR REPLACE PROCEDURE contar_empleados IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_empleados
    FROM EMPLEADOS;
    DBMS_OUTPUT.PUT_LINE('Total de empleados: ' || total_empleados);
END contar_empleados;
/

-- Llamada al procedimiento
BEGIN
    contar_empleados;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 15: Obtener el nombre y cargo de un empleado por ID
CREATE OR REPLACE PROCEDURE mostrar_nombre_cargo_empleado(emp_id NUMBER) IS
    nombre_empleado VARCHAR2(100);
    cargo_empleado VARCHAR2(100);
BEGIN
    SELECT NOMBRE_EMPLEADO, CARGO_EMPLEADO INTO nombre_empleado, cargo_empleado
    FROM EMPLEADOS
    WHERE ID_EMPLEADO = emp_id;
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre_empleado || ', Cargo: ' || cargo_empleado);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Empleado no encontrado.');
END mostrar_nombre_cargo_empleado;
/

-- Llamada al procedimiento
BEGIN
    mostrar_nombre_cargo_empleado(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 16: Obtener el total de ventas de un cliente con el nombre del cliente
CREATE OR REPLACE PROCEDURE total_ventas_cliente_nombre(cod_cliente NUMBER) IS
    total_ventas NUMBER;
    nombre_cliente VARCHAR2(100);
BEGIN
    -- Obtener el nombre del cliente
    SELECT NOMBRE_CONTACTO INTO nombre_cliente
    FROM CONTACTOS
    WHERE ID_CONTACTO = cod_cliente;
    
    -- Obtener el total de ventas
    SELECT NVL(SUM(TOTAL_FACTURA), 0) INTO total_ventas
    FROM FACTURAS
    WHERE COD_CLIENTE = cod_cliente;
    
    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('Nombre del cliente: ' || nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('Total de ventas para el cliente: ' || total_ventas);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Cliente no encontrado o sin ventas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END total_ventas_cliente_nombre;
/

-- Llamada al procedimiento
BEGIN
    total_ventas_cliente_nombre(1);
END;
/


-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 17: Obtener el nombre y el tipo de contacto por ID
CREATE OR REPLACE PROCEDURE mostrar_nombre_tipo_contacto(contacto_id NUMBER) IS
    nombre_contacto VARCHAR2(100);
    tipo_contacto VARCHAR2(50);
BEGIN
    SELECT NOMBRE_CONTACTO, TIPO_CONTACTO INTO nombre_contacto, tipo_contacto
    FROM CONTACTOS
    WHERE ID_CONTACTO = contacto_id;
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre_contacto || ', Tipo: ' || tipo_contacto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Contacto no encontrado.');
END mostrar_nombre_tipo_contacto;
/

-- Llamada al procedimiento
BEGIN
    mostrar_nombre_tipo_contacto(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 18: Mostrar los vehículos por marca
CREATE OR REPLACE PROCEDURE mostrar_vehiculos_marca(marca_vehiculo VARCHAR2) IS
BEGIN
    FOR rec IN (SELECT * FROM VEHICULOS WHERE MARCA = marca_vehiculo) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_VEHICULO || ', Placa: ' || rec.NUM_PLACA || ', Marca: ' || rec.MARCA);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron vehículos para la marca especificada.');
END mostrar_vehiculos_marca;
/

-- Llamada al procedimiento
BEGIN
    mostrar_vehiculos_marca('Toyota');
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 19: Mostrar las facturas de un período
CREATE OR REPLACE PROCEDURE mostrar_facturas_periodo(fecha_inicio DATE, fecha_fin DATE) IS
BEGIN
    FOR rec IN (SELECT * FROM FACTURAS WHERE FECHA_FACTURA BETWEEN fecha_inicio AND fecha_fin) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || rec.ID_FACTURA || ', Fecha: ' || rec.FECHA_FACTURA || ', Total: ' || rec.TOTAL_FACTURA);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron facturas para el período especificado.');
END mostrar_facturas_periodo;
/

-- Llamada al procedimiento
BEGIN
    mostrar_facturas_periodo(TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 20: Obtener el total de servicios facturados
CREATE OR REPLACE PROCEDURE total_servicios_facturados IS
    total NUMBER;
BEGIN
    SELECT SUM(PRECIO_SERVICIO) INTO total
    FROM SERVICIOS;
    DBMS_OUTPUT.PUT_LINE('Total de servicios facturados: ' || total);
END total_servicios_facturados;
/

-- Llamada al procedimiento
BEGIN
    total_servicios_facturados;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 21: Obtener el nombre y el tipo de repuesto por ID
CREATE OR REPLACE PROCEDURE mostrar_nombre_tipo_repuesto(repuesto_id NUMBER) IS
    nombre_repuesto VARCHAR2(100);
    tipo_repuesto VARCHAR2(50);
BEGIN
    SELECT NOMBRE_REPUESTO, TIPO_REPUESTO INTO nombre_repuesto, tipo_repuesto
    FROM REPUESTOS
    WHERE ID_REPUESTO = repuesto_id;
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre_repuesto || ', Tipo: ' || tipo_repuesto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Repuesto no encontrado.');
END mostrar_nombre_tipo_repuesto;
/

-- Llamada al procedimiento
BEGIN
    mostrar_nombre_tipo_repuesto(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 22: Mostrar todos los servicios prestados a un cliente
CREATE OR REPLACE PROCEDURE mostrar_servicios_cliente(cod_cliente NUMBER) IS
BEGIN
    FOR rec IN (SELECT * FROM SERVICIOS WHERE COD_CLIENTE = cod_cliente) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Servicio: ' || rec.ID_SERVICIO || ', Nombre: ' || rec.NOMBRE_SERVICIO || ', Precio: ' || rec.PRECIO_SERVICIO);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron servicios para el cliente.');
END mostrar_servicios_cliente;
/

-- Llamada al procedimiento
BEGIN
    mostrar_servicios_cliente(1);
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 23: Obtener el promedio de precios de repuestos
CREATE OR REPLACE PROCEDURE promedio_precios_repuestos IS
    promedio_precio NUMBER;
BEGIN
    SELECT AVG(PRECIO_REPUESTO) INTO promedio_precio
    FROM REPUESTOS;
    DBMS_OUTPUT.PUT_LINE('Promedio de precios de repuestos: ' || promedio_precio);
END promedio_precios_repuestos;
/

-- Llamada al procedimiento
BEGIN
    promedio_precios_repuestos;
END;
/

-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 24: Obtener los detalles de un repuesto por código
CREATE OR REPLACE PROCEDURE detalles_repuesto(cod_repuesto NUMBER) IS
    nombre_repuesto VARCHAR2(100);
    fecha_registro DATE;
    nombre_usuario VARCHAR2(100);
    precio_repuesto NUMBER(10, 2);
BEGIN
    -- Obtener los detalles del repuesto (solo el primero en caso de duplicados)
    SELECT NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO, PRECIO_REPUESTO
    INTO nombre_repuesto, fecha_registro, nombre_usuario, precio_repuesto
    FROM (
        SELECT NOMBRE_REPUESTO, FECHA_REGISTRO, NOMBRE_USUARIO, PRECIO_REPUESTO
        FROM REPUESTOS
        WHERE COD_REPUESTO = cod_repuesto
        FETCH FIRST ROW ONLY
    );

    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('Nombre del repuesto: ' || nombre_repuesto);
    DBMS_OUTPUT.PUT_LINE('Fecha de registro: ' || TO_CHAR(fecha_registro, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Nombre del usuario: ' || nombre_usuario);
    DBMS_OUTPUT.PUT_LINE('Precio del repuesto: ' || precio_repuesto);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Repuesto no encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END detalles_repuesto;
/

-- Llamada al procedimiento
BEGIN
    detalles_repuesto(301); -- Se puede cambiar por el código del repuesto que se quiera consultar
END;
/



-- Habilitar la salida de DBMS_OUTPUT para el procedimiento
SET SERVEROUTPUT ON;

-- Procedimiento 25: Mostrar todos los vehículos de un tipo
CREATE OR REPLACE PROCEDURE mostrar_vehiculos_tipo(tipo_vehiculo VARCHAR2) IS
BEGIN
    FOR rec IN (SELECT * FROM VEHICULOS WHERE TIPO_VEHICULO = tipo_vehiculo) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_VEHICULO || ', Placa: ' || rec.NUM_PLACA || ', Tipo: ' || rec.TIPO_VEHICULO);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron vehículos para el tipo especificado.');
END mostrar_vehiculos_tipo;
/

-- Llamada al procedimiento
BEGIN
    mostrar_vehiculos_tipo('SUV');
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

-- Vista de VehÃ­culos Activos
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

-- Vista de VehÃ­culos con su Estado y Fecha de Registro
CREATE OR REPLACE VIEW V_VEHICULOS_ESTADO_REGISTRO AS
SELECT NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, FECHA_REGISTRO
FROM VEHICULOS;

/*
**********************************************************************
*                                                                    *
*                             TRIGGERS                               *
*                                                                    *
**********************************************************************
*/

-- Activar la salida del servidor para ver los mensajes de DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- Trigger para auditar inserciones en la tabla CONTACTOS
CREATE OR REPLACE TRIGGER trg_audit_insert_contactos
AFTER INSERT ON CONTACTOS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo contacto insertado: ID=' || :NEW.ID_CONTACTO || ', Nombre=' || :NEW.NOMBRE_CONTACTO);
END;
/

-- Trigger para actualizar el precio de un repuesto en REPUESTOS
CREATE OR REPLACE TRIGGER trg_audit_update_repuestos
BEFORE UPDATE ON REPUESTOS
FOR EACH ROW
BEGIN
    IF :OLD.PRECIO_REPUESTO != :NEW.PRECIO_REPUESTO THEN
        DBMS_OUTPUT.PUT_LINE('Precio del repuesto cambiado: Código=' || :OLD.COD_REPUESTO || ', Antiguo Precio=' || :OLD.PRECIO_REPUESTO || ', Nuevo Precio=' || :NEW.PRECIO_REPUESTO);
    END IF;
END;
/

-- Trigger para auditar eliminaciones en la tabla FACTURAS
CREATE OR REPLACE TRIGGER trg_audit_delete_facturas
AFTER DELETE ON FACTURAS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Factura eliminada: ID=' || :OLD.ID_FACTURA || ', Código=' || :OLD.COD_FACTURA);
END;
/

-- Trigger para asegurar que el salario de los empleados no sea menor a 2000
CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE UPDATE ON EMPLEADOS
FOR EACH ROW
BEGIN
    IF :NEW.SALARIO < 2000 THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se puede establecer un salario menor a 2000 para el empleado ID=' || :NEW.ID_EMPLEADO);
        RAISE_APPLICATION_ERROR(-20001, 'Salario no puede ser menor a 2000');
    END IF;
END;
/

-- Trigger para auditar inserciones en la tabla VEHICULOS
CREATE OR REPLACE TRIGGER trg_audit_insert_vehiculos
AFTER INSERT ON VEHICULOS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nuevo vehículo insertado: Placa=' || :NEW.NUM_PLACA || ', Marca=' || :NEW.MARCA || ', Modelo=' || :NEW.MODELO);
END;
/

/*
**********************************************************************
*                                                                    *
*                             CURSORES                               *
*                                                                    *
**********************************************************************
*/

-- 1. Cursor para obtener todos los contactos
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_contactos IS
        SELECT * FROM CONTACTOS;
    v_contacto CONTACTOS%ROWTYPE;
BEGIN
    OPEN c_contactos;
    LOOP
        FETCH c_contactos INTO v_contacto;
        EXIT WHEN c_contactos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_contacto.ID_CONTACTO || ', Nombre: ' || v_contacto.NOMBRE_CONTACTO);
    END LOOP;
    CLOSE c_contactos;
END;
/

-- 2. Cursor para obtener todas las facturas
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_facturas IS
        SELECT * FROM FACTURAS;
    v_factura FACTURAS%ROWTYPE;
BEGIN
    OPEN c_facturas;
    LOOP
        FETCH c_facturas INTO v_factura;
        EXIT WHEN c_facturas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_factura.ID_FACTURA || ', Fecha: ' || v_factura.FECHA_FACTURA || ', Total: ' || v_factura.TOTAL_FACTURA);
    END LOOP;
    CLOSE c_facturas;
END;
/

-- 3. Cursor para obtener todos los repuestos
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_repuestos IS
        SELECT * FROM REPUESTOS;
    v_repuesto REPUESTOS%ROWTYPE;
BEGIN
    OPEN c_repuestos;
    LOOP
        FETCH c_repuestos INTO v_repuesto;
        EXIT WHEN c_repuestos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_repuesto.ID_REPUESTO || ', Nombre: ' || v_repuesto.NOMBRE_REPUESTO || ', Precio: ' || v_repuesto.PRECIO_REPUESTO);
    END LOOP;
    CLOSE c_repuestos;
END;
/

-- 4. Cursor para obtener todos los detalles de factura
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_detalle_factura IS
        SELECT * FROM DETALLE_FACTURA;
    v_detalle_factura DETALLE_FACTURA%ROWTYPE;
BEGIN
    OPEN c_detalle_factura;
    LOOP
        FETCH c_detalle_factura INTO v_detalle_factura;
        EXIT WHEN c_detalle_factura%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_detalle_factura.ID_DETALLE_FACTURA || ', Cantidad: ' || v_detalle_factura.CANTIDAD);
    END LOOP;
    CLOSE c_detalle_factura;
END;
/

-- 5. Cursor para obtener todas las oficinas
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_oficinas IS
        SELECT * FROM OFICINAS;
    v_oficina OFICINAS%ROWTYPE;
BEGIN
    OPEN c_oficinas;
    LOOP
        FETCH c_oficinas INTO v_oficina;
        EXIT WHEN c_oficinas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_oficina.ID_OFICINA || ', Nombre: ' || v_oficina.NOMBRE_OFICINA);
    END LOOP;
    CLOSE c_oficinas;
END;
/

-- 6. Cursor para obtener todos los vehículos
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_vehiculos IS
        SELECT * FROM VEHICULOS;
    v_vehiculo VEHICULOS%ROWTYPE;
BEGIN
    OPEN c_vehiculos;
    LOOP
        FETCH c_vehiculos INTO v_vehiculo;
        EXIT WHEN c_vehiculos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_vehiculo.ID_VEHICULO || ', Placa: ' || v_vehiculo.NUM_PLACA || ', Marca: ' || v_vehiculo.MARCA);
    END LOOP;
    CLOSE c_vehiculos;
END;
/

-- 7. Cursor para obtener todos los servicios
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_servicios IS
        SELECT * FROM SERVICIOS;
    v_servicio SERVICIOS%ROWTYPE;
BEGIN
    OPEN c_servicios;
    LOOP
        FETCH c_servicios INTO v_servicio;
        EXIT WHEN c_servicios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_servicio.ID_SERVICIO || ', Nombre: ' || v_servicio.NOMBRE_SERVICIO || ', Precio: ' || v_servicio.PRECIO_SERVICIO);
    END LOOP;
    CLOSE c_servicios;
END;
/

-- 8. Cursor para obtener todos los empleados
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_empleados IS
        SELECT * FROM EMPLEADOS;
    v_empleado EMPLEADOS%ROWTYPE;
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados INTO v_empleado;
        EXIT WHEN c_empleados%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_empleado.ID_EMPLEADO || ', Nombre: ' || v_empleado.NOMBRE_EMPLEADO || ' ' || v_empleado.APELLIDO_EMPLEADO || ', Cargo: ' || v_empleado.CARGO_EMPLEADO);
    END LOOP;
    CLOSE c_empleados;
END;
/

-- 9. Cursor para obtener todas las facturas con detalles
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_facturas_detalle IS
        SELECT f.ID_FACTURA, f.FECHA_FACTURA, f.TOTAL_FACTURA, d.COD_REPUESTO, d.CANTIDAD
        FROM FACTURAS f
        JOIN DETALLE_FACTURA d ON f.ID_FACTURA = d.COD_FACTURA;

    -- Definir un tipo de registro para el cursor
    TYPE t_factura_detalle IS RECORD (
        ID_FACTURA FACTURAS.ID_FACTURA%TYPE,
        FECHA_FACTURA FACTURAS.FECHA_FACTURA%TYPE,
        TOTAL_FACTURA FACTURAS.TOTAL_FACTURA%TYPE,
        COD_REPUESTO DETALLE_FACTURA.COD_REPUESTO%TYPE,
        CANTIDAD DETALLE_FACTURA.CANTIDAD%TYPE
    );
    
    v_factura_detalle t_factura_detalle;

BEGIN
    OPEN c_facturas_detalle;
    LOOP
        FETCH c_facturas_detalle INTO v_factura_detalle;
        EXIT WHEN c_facturas_detalle%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Factura ID: ' || v_factura_detalle.ID_FACTURA || ', Fecha: ' || v_factura_detalle.FECHA_FACTURA || ', Total: ' || v_factura_detalle.TOTAL_FACTURA || ', Repuesto: ' || v_factura_detalle.COD_REPUESTO || ', Cantidad: ' || v_factura_detalle.CANTIDAD);
    END LOOP;
    CLOSE c_facturas_detalle;
END;
/


-- 10. Cursor para obtener todos los contactos con sus facturas
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_contactos_facturas IS
        SELECT c.ID_CONTACTO, c.NOMBRE_CONTACTO, f.ID_FACTURA, f.FECHA_FACTURA, f.TOTAL_FACTURA
        FROM CONTACTOS c
        LEFT JOIN FACTURAS f ON c.ID_CONTACTO = f.COD_CLIENTE;

    -- Definir un tipo de registro para el cursor
    TYPE t_contacto_factura IS RECORD (
        ID_CONTACTO CONTACTOS.ID_CONTACTO%TYPE,
        NOMBRE_CONTACTO CONTACTOS.NOMBRE_CONTACTO%TYPE,
        ID_FACTURA FACTURAS.ID_FACTURA%TYPE,
        FECHA_FACTURA FACTURAS.FECHA_FACTURA%TYPE,
        TOTAL_FACTURA FACTURAS.TOTAL_FACTURA%TYPE
    );
    
    v_contacto_factura t_contacto_factura;

BEGIN
    OPEN c_contactos_facturas;
    LOOP
        FETCH c_contactos_facturas INTO v_contacto_factura;
        EXIT WHEN c_contactos_facturas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Contacto ID: ' || v_contacto_factura.ID_CONTACTO || ', Nombre: ' || v_contacto_factura.NOMBRE_CONTACTO || ', Factura ID: ' || v_contacto_factura.ID_FACTURA || ', Fecha: ' || v_contacto_factura.FECHA_FACTURA || ', Total: ' || v_contacto_factura.TOTAL_FACTURA);
    END LOOP;
    CLOSE c_contactos_facturas;
END;
/


-- 11. Cursor para obtener los repuestos con el total vendido en todas las facturas
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_repuestos_totales IS
        SELECT r.ID_REPUESTO, r.NOMBRE_REPUESTO, SUM(d.CANTIDAD) AS TOTAL_CANTIDAD, 
               r.PRECIO_REPUESTO, SUM(d.CANTIDAD * r.PRECIO_REPUESTO) AS TOTAL_VENDIDO
        FROM REPUESTOS r
        JOIN DETALLE_FACTURA d ON r.ID_REPUESTO = d.COD_REPUESTO
        GROUP BY r.ID_REPUESTO, r.NOMBRE_REPUESTO, r.PRECIO_REPUESTO;

    v_repuesto_total c_repuestos_totales%ROWTYPE;
BEGIN
    OPEN c_repuestos_totales;
    LOOP
        FETCH c_repuestos_totales INTO v_repuesto_total;
        EXIT WHEN c_repuestos_totales%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Repuesto ID: ' || v_repuesto_total.ID_REPUESTO ||
                             ', Nombre: ' || v_repuesto_total.NOMBRE_REPUESTO ||
                             ', Total Cantidad: ' || v_repuesto_total.TOTAL_CANTIDAD ||
                             ', Precio: ' || v_repuesto_total.PRECIO_REPUESTO ||
                             ', Total Vendido: ' || v_repuesto_total.TOTAL_VENDIDO);
    END LOOP;
    CLOSE c_repuestos_totales;
END;
/


-- 12. Cursor para obtener vehículos con su último servicio (presumido)
SET SERVEROUTPUT ON;
DECLARE
    -- Definir el cursor con tipo de registro explícito
    CURSOR c_vehiculos_servicios IS
        SELECT v.ID_VEHICULO, v.NUM_PLACA, s.NOMBRE_SERVICIO, s.PRECIO_SERVICIO
        FROM VEHICULOS v
        LEFT JOIN SERVICIOS s ON v.ID_VEHICULO = s.COD_SERVICIO; -- Asegúrate de usar la relación correcta
    v_vehiculo_servicio c_vehiculos_servicios%ROWTYPE;
BEGIN
    OPEN c_vehiculos_servicios;
    LOOP
        FETCH c_vehiculos_servicios INTO v_vehiculo_servicio;
        EXIT WHEN c_vehiculos_servicios%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Vehículo ID: ' || v_vehiculo_servicio.ID_VEHICULO || 
                             ', Placa: ' || v_vehiculo_servicio.NUM_PLACA || 
                             ', Servicio: ' || v_vehiculo_servicio.NOMBRE_SERVICIO || 
                             ', Precio: ' || v_vehiculo_servicio.PRECIO_SERVICIO);
    END LOOP;
    CLOSE c_vehiculos_servicios;
END;
/


-- 13. Cursor para obtener todas las facturas de un cliente específico
SET SERVEROUTPUT ON;
DECLARE
    v_cliente_id CONTACTOS.ID_CONTACTO%TYPE := 1; -- Cambia el valor según sea necesario
    CURSOR c_facturas_cliente IS
        SELECT * FROM FACTURAS
        WHERE COD_CLIENTE = v_cliente_id;
    v_factura FACTURAS%ROWTYPE;
BEGIN
    OPEN c_facturas_cliente;
    LOOP
        FETCH c_facturas_cliente INTO v_factura;
        EXIT WHEN c_facturas_cliente%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Factura ID: ' || v_factura.ID_FACTURA || ', Fecha: ' || v_factura.FECHA_FACTURA || ', Total: ' || v_factura.TOTAL_FACTURA);
    END LOOP;
    CLOSE c_facturas_cliente;
END;
/

-- 14. Cursor para obtener todos los repuestos en detalle de factura
SET SERVEROUTPUT ON;
DECLARE
    -- Definir el cursor con tipo de registro explícito
    CURSOR c_repuestos_detalle IS
        SELECT r.ID_REPUESTO, r.NOMBRE_REPUESTO, d.CANTIDAD
        FROM REPUESTOS r
        JOIN DETALLE_FACTURA d ON r.ID_REPUESTO = d.COD_REPUESTO;
    
    -- Definir el tipo de registro correspondiente al cursor
    v_repuesto_detalle c_repuestos_detalle%ROWTYPE;
BEGIN
    OPEN c_repuestos_detalle;
    LOOP
        FETCH c_repuestos_detalle INTO v_repuesto_detalle;
        EXIT WHEN c_repuestos_detalle%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Repuesto ID: ' || v_repuesto_detalle.ID_REPUESTO || 
                             ', Nombre: ' || v_repuesto_detalle.NOMBRE_REPUESTO || 
                             ', Cantidad: ' || v_repuesto_detalle.CANTIDAD);
    END LOOP;
    CLOSE c_repuestos_detalle;
END;
/

-- 15. Cursor para obtener todas las facturas con sus detalles de repuestos
SET SERVEROUTPUT ON;
DECLARE
    -- Definir el cursor con tipo de registro explícito
    CURSOR c_facturas_repuestos IS
        SELECT f.ID_FACTURA, f.FECHA_FACTURA, d.COD_REPUESTO, r.NOMBRE_REPUESTO, d.CANTIDAD
        FROM FACTURAS f
        JOIN DETALLE_FACTURA d ON f.ID_FACTURA = d.COD_FACTURA
        JOIN REPUESTOS r ON d.COD_REPUESTO = r.ID_REPUESTO;
    
    -- Definir el tipo de registro correspondiente al cursor
    v_factura_repuesto c_facturas_repuestos%ROWTYPE;
BEGIN
    OPEN c_facturas_repuestos;
    LOOP
        FETCH c_facturas_repuestos INTO v_factura_repuesto;
        EXIT WHEN c_facturas_repuestos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Factura ID: ' || v_factura_repuesto.ID_FACTURA || 
                             ', Fecha: ' || v_factura_repuesto.FECHA_FACTURA || 
                             ', Repuesto: ' || v_factura_repuesto.NOMBRE_REPUESTO || 
                             ', Cantidad: ' || v_factura_repuesto.CANTIDAD);
    END LOOP;
    CLOSE c_facturas_repuestos;
END;
/