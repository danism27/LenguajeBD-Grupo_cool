<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leer Servicio - Auto Max</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation"></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/Automax/index.php">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Automax/views/tablas.php">Ver tablas</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <h1 class="text-center">Detalles del Servicio</h1>
        <div class="row">
            <div class="col">
                <?php
                if (isset($_GET['id_servicio']) && is_numeric($_GET['id_servicio'])) {
                    $id_servicio = intval($_GET['id_servicio']);

                    // Conectar a la base de datos
                    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
                    if (!$conn) {
                        $e = oci_error();
                        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
                        exit;
                    }

                    // Preparar y ejecutar la consulta para leer el servicio
                    $sql = 'BEGIN get_servicio(:id_servicio, :cod_servicio, :nombre_servicio, :descripcion_servicio, :precio_servicio); END;';
                    $stid = oci_parse($conn, $sql);

                    // Definir los parámetros de salida
                    $cod_servicio = '';
                    $nombre_servicio = '';
                    $descripcion_servicio = '';
                    $precio_servicio = 0.0;

                    oci_bind_by_name($stid, ':id_servicio', $id_servicio);
                    oci_bind_by_name($stid, ':cod_servicio', $cod_servicio, 10);
                    oci_bind_by_name($stid, ':nombre_servicio', $nombre_servicio, 100);
                    oci_bind_by_name($stid, ':descripcion_servicio', $descripcion_servicio, 100);
                    oci_bind_by_name($stid, ':precio_servicio', $precio_servicio);

                    // Ejecutar el procedimiento
                    if (oci_execute($stid)) {
                        echo "<table class='table table-bordered'>\n";
                        echo "<tr><th>ID SERVICIO</th><td>" . htmlentities($id_servicio, ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>CÓDIGO SERVICIO</th><td>" . htmlentities($cod_servicio, ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>NOMBRE DEL SERVICIO</th><td>" . htmlentities($nombre_servicio, ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>DESCRIPCIÓN DEL SERVICIO</th><td>" . htmlentities($descripcion_servicio, ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>PRECIO DEL SERVICIO</th><td>" . htmlentities($precio_servicio, ENT_QUOTES) . "</td></tr>\n";
                        echo "</table>\n";
                    } else {
                        $e = oci_error($stid);
                        echo "<p>Error al leer el servicio: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
                    }

                    oci_free_statement($stid);
                    oci_close($conn);
                } else {
                    echo "<p>ID de servicio no especificado o no válido.</p>";
                }
                ?>
                <button type="button" class="btn btn-secondary mt-3" onclick="window.location.href='Tabla_Servicio.php'">Volver a Servicios</button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark" style="color: white; background-color: #000000">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Auto Max</h3>
                    <p class="mt-3">Auto Max es una empresa dedicada a la venta de autos nuevos y usados, alquiler de autos y venta de repuestos.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Redes Sociales</h3>
                    <p><i class="fa fa-facebook" aria-hidden="true"></i> Auto Max</p>
                    <p><i class="fa fa-instagram" aria-hidden="true"></i> Auto Max</p>
                    <p><i class="fa fa-twitter" aria-hidden="true"></i> Auto Max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Teléfono: 809-555-5555</p>
                    <p><i class="fa fa-envelope" aria-hidden="true"></i> Correo: AutoMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
    </div>
</footer>

</html>
