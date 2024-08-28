<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id_vehiculo'])) {
    $id_vehiculo = $_GET['id_vehiculo'];

    // Variables para capturar los resultados
    $num_placa = "";
    $tipo_vehiculo = "";
    $estado_vehiculo = "";
    $marca = "";
    $modelo = "";
    $fecha_registro = "";
    $nombre_usuario = "";

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN get_vehiculo(:id_vehiculo, :num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, :fecha_registro, :nombre_usuario); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros de entrada y salida
    oci_bind_by_name($stid, ':id_vehiculo', $id_vehiculo);
    oci_bind_by_name($stid, ':num_placa', $num_placa, 50);
    oci_bind_by_name($stid, ':tipo_vehiculo', $tipo_vehiculo, 50);
    oci_bind_by_name($stid, ':estado_vehiculo', $estado_vehiculo, 50);
    oci_bind_by_name($stid, ':marca', $marca, 50);
    oci_bind_by_name($stid, ':modelo', $modelo, 50);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50);
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario, 50);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al consultar el vehículo: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de vehículo en la URL.</p>";
}
?>


<!DOCTYPE html>
<html lang="es">

<head>
    <title>Auto Max</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">

    <!-- LIBRERÍAS BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <style>
        .carousel-inner {
            max-block-size: 35rem;
        }

        .indexh1 {
            font-size: 5rem;
            color: rgb(17, 17, 150);
        }

        .main {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            font-size: 20px;
        }

        .logo {
            font-family: 'Fredoka One', cursive;
            font-family: 'Qwitcher Grypen', cursive;
            font-size: 20px;
            /* Ajusta el tamaño de la fuente del logo */
            margin-right: 20px;
        }

        .nav-link {
            font-size: 16px;
            /* Ajusta el tamaño de la fuente de los enlaces de navegación */
            color: whitesmoke;
        }
    </style>
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

    <br><br><br><br><br>

    <div class="container">
        <h1 class="text-center">Leer Vehículo</h1>
        <!-- Formulario para ver el vehículo -->
        <form>
            <div class="form-group">
                <label for="id_vehiculo">ID Vehículo:</label>
                <input type="text" class="form-control" id="id_vehiculo" name="id_vehiculo"
                    value="<?php echo isset($id_vehiculo) ? htmlentities($id_vehiculo, ENT_QUOTES) : ''; ?>" readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="num_placa">Número de Placa:</label>
                <input type="text" class="form-control" id="num_placa" name="num_placa"
                    value="<?php echo isset($num_placa) ? htmlentities($num_placa, ENT_QUOTES) : ''; ?>" readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="tipo_vehiculo">Tipo de Vehículo:</label>
                <input type="text" class="form-control" id="tipo_vehiculo" name="tipo_vehiculo"
                    value="<?php echo isset($tipo_vehiculo) ? htmlentities($tipo_vehiculo, ENT_QUOTES) : ''; ?>"
                    readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="estado_vehiculo">Estado del Vehículo:</label>
                <input type="text" class="form-control" id="estado_vehiculo" name="estado_vehiculo"
                    value="<?php echo isset($estado_vehiculo) ? htmlentities($estado_vehiculo, ENT_QUOTES) : ''; ?>"
                    readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="marca">Marca:</label>
                <input type="text" class="form-control" id="marca" name="marca"
                    value="<?php echo isset($marca) ? htmlentities($marca, ENT_QUOTES) : ''; ?>" readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input type="text" class="form-control" id="modelo" name="modelo"
                    value="<?php echo isset($modelo) ? htmlentities($modelo, ENT_QUOTES) : ''; ?>" readonly>
            </div>
            <br>
            <div class="form-group">
                <label for="fecha_registro">Fecha de Registro:</label>
                <input type="text" class="form-control" id="fecha_registro" name="fecha_registro"
                    value="<?php echo isset($fecha_registro) ? htmlentities($fecha_registro, ENT_QUOTES) : ''; ?>"
                    readonly>
            </div>
            <br><br>
            <a class="btn btn-success" href="Tabla_Vehiculo.php">Volver</a>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>

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