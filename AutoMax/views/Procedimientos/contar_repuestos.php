<?php
// Verificar si se ha proporcionado un ID en la URL
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_repuesto = $_POST['id_repuesto'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Declarar variables para los parámetros de salida
    $cod_repuesto = '';
    $nombre_repuesto = '';
    $fecha_registro = '';
    $nombre_usuario = '';
    $precio_repuesto = '';

    // Obtener los datos actuales del repuesto
    $sql = 'BEGIN get_repuesto(:id_repuesto, :cod_repuesto, :nombre_repuesto, :fecha_registro, :nombre_usuario, :precio_repuesto); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':id_repuesto', $id_repuesto);
    oci_bind_by_name($stid, ':cod_repuesto', $cod_repuesto, 100);
    oci_bind_by_name($stid, ':nombre_repuesto', $nombre_repuesto, 100);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50); // Ajustar si es necesario según el formato de fecha
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario, 100);
    oci_bind_by_name($stid, ':precio_repuesto', $precio_repuesto, 10);

    // Ejecutar el query
    oci_execute($stid);

    // Liberar el statement y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);

    // Mostrar los datos del repuesto
    echo "<p>Código del Repuesto: $cod_repuesto</p>";
    echo "<p>Nombre del Repuesto: $nombre_repuesto</p>";
    echo "<p>Fecha de Registro: $fecha_registro</p>";
    echo "<p>Usuario: $nombre_usuario</p>";
    echo "<p>Precio del Repuesto: $precio_repuesto</p>";
}
?>



<!DOCTYPE html>
<html lang="es">
<head>
    <title>Contar Empleados</title>
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

<!-- Botones para Contar -->
<div class="mb-3 d-flex justify-content-center align-items-center">
    <!-- Mini Formulario para Contar -->
    <form method="POST" class="form-inline d-flex mr-3">
        <label for="id_empleado" class="mr-2">Contar Repuestos:</label>
        <button type="submit" class="btn btn-primary">Contar</button>
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
