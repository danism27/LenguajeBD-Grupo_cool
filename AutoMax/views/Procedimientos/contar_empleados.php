<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id'])) {
    $id_empleado = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Declarar variables para los parámetros de salida
    $nombre_empleado = '';
    $apellido_empleado = '';
    $cargo_empleado = '';
    $fecha_contratacion = '';
    $salario = '';

    // Obtener los datos actuales del empleado
    $sql = 'BEGIN get_empleado(:id_empleado, :nombre_empleado, :apellido_empleado, :cargo_empleado, :fecha_contratacion, :salario); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':id_empleado', $id_empleado);
    oci_bind_by_name($stid, ':nombre_empleado', $nombre_empleado, 100);
    oci_bind_by_name($stid, ':apellido_empleado', $apellido_empleado, 100);
    oci_bind_by_name($stid, ':cargo_empleado', $cargo_empleado, 100);
    oci_bind_by_name($stid, ':fecha_contratacion', $fecha_contratacion, 50); // Adjust if needed based on the date format
    oci_bind_by_name($stid, ':salario', $salario, 10); // Adjust if needed

    // Ejecutar el query
    oci_execute($stid);

    // Liberar el statement y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de empleado en la URL.</p>";
    exit();
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <title>Actualizar Empleado - Paso 1</title>
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
    <br><br><br><br><br>

    <div class="container">
        <h1 class="text-center">Actualizar Empleado</h1>
        <!-- Formulario para ver y enviar los datos del empleado -->
        <form action="Procesar_Actualizar_Empleado.php" method="GET">
            <!-- Campo oculto para el ID del empleado -->
            <input type="hidden" name="id_empleado" value="<?php echo htmlentities($id_empleado, ENT_QUOTES); ?>">

            <div class="form-group">
                <label for="nombre_empleado">Nombre del Empleado:</label>
                <input type="text" class="form-control" id="nombre_empleado" name="nombre_empleado"
                    value="<?php echo htmlentities($nombre_empleado, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="apellido_empleado">Apellido del Empleado:</label>
                <input type="text" class="form-control" id="apellido_empleado" name="apellido_empleado"
                    value="<?php echo htmlentities($apellido_empleado, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="cargo_empleado">Cargo del Empleado:</label>
                <input type="text" class="form-control" id="cargo_empleado" name="cargo_empleado"
                    value="<?php echo htmlentities($cargo_empleado, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="fecha_contratacion">Fecha de Contratación:</label>
                <input type="text" class="form-control" id="fecha_contratacion" name="fecha_contratacion"
                    value="<?php echo htmlentities($fecha_contratacion, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="salario">Salario:</label>
                <input type="text" class="form-control" id="salario" name="salario"
                    value="<?php echo htmlentities($salario, ENT_QUOTES); ?>" required>
            </div>

            <br><br>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a class="btn btn-secondary" href="Tabla_Empleados.php">Volver</a>
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
