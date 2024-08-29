<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id'])) {
    $id_repuesto = $_GET['id'];  // Cambié a id_repuesto ya que estamos trabajando con REPUESTOS

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Obtener los datos actuales del repuesto
    $sql = 'BEGIN get_repuesto(:id_repuesto, :cod_repuesto, :nombre_repuesto, :fecha_registro, :nombre_usuario, :precio_repuesto); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':id_repuesto', $id_repuesto);
    oci_bind_by_name($stid, ':cod_repuesto', $cod_repuesto, 100);
    oci_bind_by_name($stid, ':nombre_repuesto', $nombre_repuesto, 100);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50);
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario, 100);
    oci_bind_by_name($stid, ':precio_repuesto', $precio_repuesto, 10);
    oci_execute($stid);
    oci_free_statement($stid);

    // Llamar al procedimiento contar_repuestos
    $sql_contar = 'BEGIN contar_repuestos; END;';
    $stid_contar = oci_parse($conn, $sql_contar);
    oci_execute($stid_contar);
    oci_free_statement($stid_contar);

    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de repuesto en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Actualizar Repuesto</title>
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
        <h1 class="text-center">Actualizar Repuesto</h1>
        <!-- Formulario para ver y enviar los datos del repuesto -->
        <form action="Procesar_Actualizar_Repuesto.php" method="GET">
            <!-- Campo oculto para el ID del repuesto -->
            <input type="hidden" name="id_repuesto" value="<?php echo htmlentities($id_repuesto, ENT_QUOTES); ?>">

            <div class="form-group">
                <label for="cod_repuesto">Código del Repuesto:</label>
                <input type="text" class="form-control" id="cod_repuesto" name="cod_repuesto"
                    value="<?php echo htmlentities($cod_repuesto, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="nombre_repuesto">Nombre del Repuesto:</label>
                <input type="text" class="form-control" id="nombre_repuesto" name="nombre_repuesto"
                    value="<?php echo htmlentities($nombre_repuesto, ENT_QUOTES); ?>" required>
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

            <div class="form-group">
                <label for="precio_repuesto">Precio del Repuesto:</label>
                <input type="text" class="form-control" id="precio_repuesto" name="precio_repuesto"
                    value="<?php echo htmlentities($precio_repuesto, ENT_QUOTES); ?>" required>
            </div>

            <br><br>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a class="btn btn-secondary" href="Tabla_Repuestos.php">Volver</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

