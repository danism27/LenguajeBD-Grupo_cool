<?php

$id_vehiculo = $_POST['id_vehiculo'];
$num_placa = null;
$tipo_vehiculo = null;
$estado_vehiculo = null;
$marca = null;
$modelo = null;
$fecha_registro = null;
$nombre_usuario = null;


// Verificar si se ha proporcionado un ID en la URL
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Inicializar variables para recibir los datos del procedimiento
    $num_placa = $tipo_vehiculo = $estado_vehiculo = $marca = $modelo = $fecha_registro = $nombre_usuario = null;

    // Preparar la consulta
    $sql = 'BEGIN get_vehiculo(:id_vehiculo, :num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, :fecha_registro, :nombre_usuario); END;';
    $stid = oci_parse($conn, $sql);

    // Bind variables
    oci_bind_by_name($stid, ':id_vehiculo', $id_vehiculo);
    oci_bind_by_name($stid, ':num_placa', $num_placa, 100);
    oci_bind_by_name($stid, ':tipo_vehiculo', $tipo_vehiculo, 100);
    oci_bind_by_name($stid, ':estado_vehiculo', $estado_vehiculo, 100);
    oci_bind_by_name($stid, ':marca', $marca, 100);
    oci_bind_by_name($stid, ':modelo', $modelo, 100);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50);
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario, 100);

    // Ejecutar el procedimiento
    if (!oci_execute($stid)) {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar el procedimiento: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        oci_free_statement($stid);
        oci_close($conn);
        exit;
    }

    // Liberar el statement y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
}
?>


<!DOCTYPE html>
<html lang="es">

<head>
    <title>Mostrar Vehículo - Paso 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
    <link rel="icon" href="logo2.png" type="image/x-icon" />
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                aria-label="Toggle navigation"></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/Automax/index.php">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Automax/views/tablas.php">Ver tablas</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
<!-- Botones para Mostrar -->
<div class="mb-3 d-flex justify-content-center align-items-center">
    <!-- Mini Formulario para Mostrar -->
    <form method="POST" class="form-inline d-flex mr-3">
        <label for="id_empleado" class="mr-2">Mostrar Oficinas:</label>
        <button type="submit" class="btn btn-primary">Mostrar</button>
    </form>
</div>

    <div class="container">
        <h1 class="text-center">Mostrar Oficinas</h1>
        <!-- Formulario para ver y enviar los datos del vehículo -->
        <form action="Procesar_Actualizar_Vehiculo.php" method="GET">
            <!-- Campo oculto para el ID del vehículo -->
            <input type="hidden" name="id_vehiculo" value="<?php echo htmlentities($id_vehiculo, ENT_QUOTES); ?>">

            <div class="form-group">
                <label for="num_placa">Número de Placa:</label>
                <input type="text" class="form-control" id="num_placa" name="num_placa"
                    value="<?php echo htmlentities($num_placa, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="tipo_vehiculo">Tipo de Vehículo:</label>
                <input type="text" class="form-control" id="tipo_vehiculo" name="tipo_vehiculo"
                    value="<?php echo htmlentities($tipo_vehiculo, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="estado_vehiculo">Estado del Vehículo:</label>
                <input type="text" class="form-control" id="estado_vehiculo" name="estado_vehiculo"
                    value="<?php echo htmlentities($estado_vehiculo, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="marca">Marca:</label>
                <input type="text" class="form-control" id="marca" name="marca"
                    value="<?php echo htmlentities($marca, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input type="text" class="form-control" id="modelo" name="modelo"
                    value="<?php echo htmlentities($modelo, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="fecha_registro">Fecha de Registro:</label>
                <input type="text" class="form-control" id="fecha_registro" name="fecha_registro"
                    value="<?php echo htmlentities($fecha_registro, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="nombre_usuario">Nombre del Usuario:</label>
                <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario"
                    value="<?php echo htmlentities($nombre_usuario, ENT_QUOTES); ?>" required>
            </div>

            <br><br>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a class="btn btn-secondary" href="Tabla_Vehiculos.php">Volver</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark" style="color: white; background-color: #000000;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados,
                        alquiler de autos y venta de repuestos.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Redes Sociales</h3>
                    <p><i class="fa fa-facebook" aria-hidden="true"></i> Autos Max</p>
                    <p><i class="fa fa-instagram" aria-hidden="true"></i> Autos Max</p>
                    <p><i class="fa fa-twitter" aria-hidden="true"></i> Autos Max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Teléfono: 809-555-5555</p>
                    <p><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Correo: AutosMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
    </div>
</footer>

</html>