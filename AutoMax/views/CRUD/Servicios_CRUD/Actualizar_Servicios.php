<?php
if (isset($_GET['id'])) {
    $id_servicio = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la consulta para obtener el servicio
    $sql = 'BEGIN get_servicio(:id_servicio, :cod_servicio, :nombre_servicio, :descripcion_servicio, :precio_servicio); END;';
    $stid = oci_parse($conn, $sql);
    
    // Definir las variables de salida
    oci_bind_by_name($stid, ':id_servicio', $id_servicio);
    oci_bind_by_name($stid, ':cod_servicio', $cod_servicio, 32);
    oci_bind_by_name($stid, ':nombre_servicio', $nombre_servicio, 100);
    oci_bind_by_name($stid, ':descripcion_servicio', $descripcion_servicio, 100);
    oci_bind_by_name($stid, ':precio_servicio', $precio_servicio, 10);
    
    // Ejecutar la consulta
    $r = oci_execute($stid);
    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al obtener el servicio: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>ID de servicio no proporcionado.</p>";
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Actualizar Servicio - Auto Max</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <h1 class="text-center">Actualizar Servicio</h1>
        <form action="procesar_actualizar_servicio.php" method="GET">
            <input type="hidden" name="id_servicio" value="<?php echo htmlspecialchars($id_servicio, ENT_QUOTES); ?>">
            <div class="form-group">
                <label for="cod_servicio">Código del Servicio:</label>
                <input type="number" class="form-control" id="cod_servicio" name="cod_servicio" value="<?php echo htmlspecialchars($cod_servicio, ENT_QUOTES); ?>" required>
            </div>
            <div class="form-group">
                <label for="nombre_servicio">Nombre del Servicio:</label>
                <input type="text" class="form-control" id="nombre_servicio" name="nombre_servicio" value="<?php echo htmlspecialchars($nombre_servicio, ENT_QUOTES); ?>" required>
            </div>
            <div class="form-group">
                <label for="descripcion_servicio">Descripción:</label>
                <input type="text" class="form-control" id="descripcion_servicio" name="descripcion_servicio" value="<?php echo htmlspecialchars($descripcion_servicio, ENT_QUOTES); ?>" required>
            </div>
            <div class="form-group">
                <label for="precio_servicio">Precio:</label>
                <input type="number" step="0.01" class="form-control" id="precio_servicio" name="precio_servicio" value="<?php echo htmlspecialchars($precio_servicio, ENT_QUOTES); ?>" required>
            </div>
            <br>
            <button type="submit" class="btn btn-warning">Actualizar Servicio</button>
        </form>
    </div>
</body>
<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark" style="color: white; background-color: #000000">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados, alquiler de autos y venta de repuestos.</p>
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
