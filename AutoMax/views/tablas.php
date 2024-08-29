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
            <a href="vehiculos.php" class="list-group-item list-group-item-action">Contactos    ❎</a>
            <a href="ordenes.php" class="list-group-item list-group-item-action">Facturas    ❎</a>
            <a href="servicios.php" class="list-group-item list-group-item-action">Detalles Facturas    ❎</a>
            <a href="ordenes.php" class="list-group-item list-group-item-action">Repuestos    ❎</a>
            <a href="clientes.php" class="list-group-item list-group-item-action">Servicios  ❎</a>
            <a href="clientes.php" class="list-group-item list-group-item-action">Empleados  ❎</a>

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