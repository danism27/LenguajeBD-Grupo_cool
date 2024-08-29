<!DOCTYPE html>
<html lang="es">

<head>
    <title> Auto Max</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">
    <!-- LIBRERIAS BOOTSTRAP-->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
    <header>
        <?php
        require_once('Layouts/header.php');
        ?>
    </header>
    <br><br>

    <div class="container">
        <h1 class="text-center">Menú de Tablas</h1>
        <div class="list-group">
            <a href="CRUD/Oficinas_CRUD/Tabla_Oficinas.php" class="list-group-item list-group-item-action">Oficinas</a>
            <a href="CRUD/Vehiculos_CRUD/Tabla_Vehiculo.php" class="list-group-item list-group-item-action">Vehículos</a>
            <a href="CRUD/Empleados_CRUD/Tabla_Empleados.php" class="list-group-item list-group-item-action">Empleados</a>
            <a href="CRUD/Facturas_CRUD/Tabla_Facturas.php" class="list-group-item list-group-item-action">Facturas</a>
            <a href="CRUD/Detalles_Facturas_CRUD/Tabla_Detalle_factura.php" class="list-group-item list-group-item-action">Detalles Facturas</a>
            <a href="CRUD/Repuestos_CRUD/Tabla_Repuesto.php" class="list-group-item list-group-item-action">Repuestos</a>
            <a href="CRUD/Contactos_CRUD/Tabla_Contacto.php" class="list-group-item list-group-item-action">Contactos</a>
            <a href="CRUD/Servicios_CRUD/Tabla_Servicio.php" class="list-group-item list-group-item-action">Servicios</a>
        </div>
    </div>

    <br><br>

    <div class="container">
        <h1 class="text-center">Menú de Vistas</h1>
        <div class="list-group">
            <a href="Vistas/vistas_clientes.php" class="list-group-item list-group-item-action">Vistas del Cliente</a>
            <a href="Vistas/vistas_proveedores.php" class="list-group-item list-group-item-action">Vistas de los
                Proveedores</a>
            <a href="Vistas/vistas_servicios.php" class="list-group-item list-group-item-action">Vistas de los
                Servicios</a>
            <a href="Vistas/vistas_vehiculos.php" class="list-group-item list-group-item-action">Vistas de los
                Vehículos</a>
            <a href="Vistas/vistas_empleados.php" class="list-group-item list-group-item-action">Vistas de los
                Empleados</a>
        </div>
    </div>

    <div class="container pt-4">
        <h1 class="text-center">Menú de Paquetes</h1>
        <div class="list-group">
            <a href="Paquetes/PaqueteDetalleFactura.php" class="list-group-item list-group-item-action">DetalleFactura</a>
            <a href="Paquetes/ObtenerFacturaspkg.php" class="list-group-item list-group-item-action">Paquete Obtener Facturas</a>
            <a href="Paquetes/ObtenerFacturaspkg.php" class="list-group-item list-group-item-action">Paquete Obtener Facturas</a>
            <a href="Paquetes/PaqueteServicios_Empleado.php" class="list-group-item list-group-item-action">Paquete Servicios Empleados</a>
            <a href="Paquetes/PaqueteVehiculos.php" class="list-group-item list-group-item-action">Paquete Vehiculos Activos</a>
            <a href="Paquetes/PaqueteRespuestos.php" class="list-group-item list-group-item-action">Paquete Respuestos</a>
            <a href="Paquetes/ObtenerClientespkg.php" class="list-group-item list-group-item-action">Paquete Obtener Clientes</a>
        </div>
    </div>

    <div class="container">
        <h1 class="text-center">Menú de Procedimientos</h1>
        <div class="list-group">
            <a href="Procedimientos/contar_empleados.php" class="list-group-item list-group-item-action">Contar Empleados</a>
            <a href="Procedimientos/contar_repuestos.php" class="list-group-item list-group-item-action">Contar Repuestos</a>
            <a href="Procedimientos/detalles_repuesto.php" class="list-group-item list-group-item-action">Detalles Repuestos</a>
            <a href="Procedimientos/mostrar_nombre_cargo_empleado.php" class="list-group-item list-group-item-action">Mostrar nombre de cargo por empleado</a>
            <a href="Procedimientos/mostrar_oficinas.php" class="list-group-item list-group-item-action">Mostrar Oficinas</a>
            <a href="Procedimientos/mostrar_servicios_precio_mayor.php" class="list-group-item list-group-item-action">Mostrar servicios por Precio Mayor</a>
            <a href="Procedimientos/promedio_precios_repuestos.php" class="list-group-item list-group-item-action">Promedio de precios por repuestos</a>
            <a href="Procedimientos/total_facturas_cliente.php" class="list-group-item list-group-item-action">Total facturas por Cliente</a>
            <a href="Procedimientos/total_servicios_facturados.php" class="list-group-item list-group-item-action">Total de Servicios Facturas</a>
            <a href="Procedimientos/total_venta_clientes_nombre.php" class="list-group-item list-group-item-action">Total de Ventas por Nombre de Cliente</a>
        </div>
    </div>

    <div class="container">
        <h1 class="text-center">Menú de Funciones</h1>
        <div class="list-group">
        <a href="Funciones/calcular_total_factura.php" class="list-group-item list-group-item-action">Calcular el Total de la Factura</a>
        <a href="Funciones/contacto_tiene_facturas.php" class="list-group-item list-group-item-action">Facturas por Contacto</a>
        <a href="Funciones/listar_contactos_tipo.php" class="list-group-item list-group-item-action">Lista de Contactos por tipo</a>
        <a href="Funciones/listar_empleados_por_cargo.php" class="list-group-item list-group-item-action">Lista de Empleados por cargo</a>
        <a href="Funciones/listar_facturas_por_fecha.php" class="list-group-item list-group-item-action">Lista de Facturas por fecha</a>
        <a href="Funciones/listar_repuestos_por_factura.php" class="list-group-item list-group-item-action">Lista de repuestos por factura</a>
        <a href="Funciones/obtener_descripcion_servicio.php" class="list-group-item list-group-item-action">Descripcion del Servicio</a>
        <a href="Funciones/obtener_fecha_contratacion.php" class="list-group-item list-group-item-action">Fecha de Contratacion</a>
        <a href="Funciones/obtener_informacion_oficina.php" class="list-group-item list-group-item-action">Informacion de Oficina</a>
        <a href="Funciones/obtener_nombre_contacto.php" class="list-group-item list-group-item-action">Nombre de Contacto</a>
        </div>
    </div>

    <div class="container">
        <h1 class="text-center">Menú de Triggers</h1>
        <div class="list-group">
        <a href="Triggers/trigger_revisar_salario.php" class="list-group-item list-group-item-action">Salario de los Empleados</a>
        <a href="Triggers/trigger_actualizar_repuestos.php" class="list-group-item list-group-item-action">Actualizar Precio de un Repuesto</a>
        <a href="Triggers/trigger_auditar_eliminaciones.php" class="list-group-item list-group-item-action">Auditar Eliminaciones en Facturas</a>
        <a href="Triggers/trigger_auditar_inserciones.php" class="list-group-item list-group-item-action">Auditar Inserciones en Vehiculos</a>
        <a href="Triggers/trigger_auditar_contactos.php" class="list-group-item list-group-item-action">Auditar Inserciones en Contactos</a>
        </div>
    </div>

</body>

<footer>
    <?php
    require_once('Layouts/footer.php');
    ?>
</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
    </script>

</html>