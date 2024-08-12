<?php

if ($_GET['page'] == 'inicio') {
	require_once('views/home.php');
}
// 	-- DROP TABLE VEHICULOS;
// -- DROP TABLE ESTADOS_VEHICULOS;
// -- DROP TABLE MARCAS;
// -- DROP TABLE REPUESTOS;
// -- DROP TABLE OFICINAS;
// -- DROP TABLE TIPOS_VEHICULOS;
// -- DROP TABLE ESTADOS_VEHICULOS;
// -- DROP TABLE TIPOS_VEHICULOS;
// -- DROP TABLE MODELOS;
// -- DROP TABLE CLIENTE;
// -- DROP TABLE PROVEEDORES;
// -- DROP TABLE TALLERES;
// -- DROP TABLE DETALLE_FACTURA;
// -- DROP TABLE FACTURAS;
// -- DROP TABLE SERVICIOS;

if ($_GET['page'] == 'inicio') {
	require_once('views/home.php');
}




if ($_GET['page'] == 'tablas') {
	require_once('views/tablas.php');
}

if ($_GET['page'] == 'vehiculos') {
	require_once('views/vehiculos.php');
}

if ($_GET['page'] == 'marcas') {
	require_once('views/marcas.php');
}

if ($_GET['page'] == 'modelos') {
	require_once('views/modelos.php');
}

if ($_GET['page'] == 'repuestos') {
	require_once('views/repuestos.php');
}

if ($_GET['page'] == 'talleres') {
	require_once('views/talleres.php');
}

if ($_GET['page'] == 'oficinas') {
	require_once('views/oficinas.php');
}

if ($_GET['page'] == 'clientes') {
	require_once('views/clientes.php');
}

if ($_GET['page'] == 'proveedores') {
	require_once('views/proveedores.php');
}

if ($_GET['page'] == 'facturas') {
	require_once('views/facturas.php');
}

if ($_GET['page'] == 'servicios') {
	require_once('views/servicios.php');
}

if ($_GET['page'] == 'detalle_factura') {
	require_once('views/detalleFactura.php');
}

if ($_GET['page'] == 'estados_vehiculos') {
	require_once('views/estadosVehiculos.php');
}

if ($_GET['page'] == 'tipos_vehiculos') {
	require_once('views/tiposVehiculos.php');
}
if ($_GET['page'] == 'VISTA_DETALLE_FACTURA') {
	require_once('views/VISTA_DETALLE_FACTURA.php');
}
if ($_GET['page'] == 'VISTA_FACTURAS') {
	require_once('views/vistaFacturas.php');
}


?>