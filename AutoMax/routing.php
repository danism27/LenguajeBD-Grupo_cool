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


?>