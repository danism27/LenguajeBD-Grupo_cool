<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id'])) {
    $id_contacto = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Obtener los datos actuales del contacto
    $sql = 'BEGIN get_contacto(:id_contacto, :tipo_contacto, :cod_contacto, :nombre_contacto, :direccion_contacto, :telefono_contacto, :email_contacto); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':id_contacto', $id_contacto);
    oci_bind_by_name($stid, ':tipo_contacto', $tipo_contacto, 50);
    oci_bind_by_name($stid, ':cod_contacto', $cod_contacto);
    oci_bind_by_name($stid, ':nombre_contacto', $nombre_contacto, 100);
    oci_bind_by_name($stid, ':direccion_contacto', $direccion_contacto, 100);
    oci_bind_by_name($stid, ':telefono_contacto', $telefono_contacto, 100);
    oci_bind_by_name($stid, ':email_contacto', $email_contacto, 100);
    oci_execute($stid);
    oci_free_statement($stid);

    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de contacto en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Actualizar Contacto - Paso 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">

    <!-- LIBRERIAS BOOTSTRAP-->
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
        <h1 class="text-center">Actualizar Contacto</h1>
        <!-- Formulario para ver y enviar los datos del contacto -->
        <form action="Procesar_Actualizar_Contacto.php" method="GET">
            <!-- Campo oculto para el ID del contacto -->
            <input type="hidden" name="id_contacto" value="<?php echo htmlentities($id_contacto, ENT_QUOTES); ?>">

            <div class="form-group">
                <label for="tipo_contacto">Tipo de Contacto:</label>
                <input type="text" class="form-control" id="tipo_contacto" name="tipo_contacto"
                    value="<?php echo htmlentities($tipo_contacto, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="cod_contacto">Código de Contacto:</label>
                <input type="number" class="form-control" id="cod_contacto" name="cod_contacto"
                    value="<?php echo htmlentities($cod_contacto, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="nombre_contacto">Nombre del Contacto:</label>
                <input type="text" class="form-control" id="nombre_contacto" name="nombre_contacto"
                    value="<?php echo htmlentities($nombre_contacto, ENT_QUOTES); ?>" required>
            </div>

            <div class="form-group">
                <label for="direccion_contacto">Dirección del Contacto:</label>
                <input type="text" class="form-control" id="direccion_contacto" name="direccion_contacto"
                    value="<?php echo htmlentities($direccion_contacto, ENT_QUOTES); ?>">
            </div>

            <div class="form-group">
                <label for="telefono_contacto">Teléfono del Contacto:</label>
                <input type="text" class="form-control" id="telefono_contacto" name="telefono_contacto"
                    value="<?php echo htmlentities($telefono_contacto, ENT_QUOTES); ?>">
            </div>

            <div class="form-group">
                <label for="email_contacto">Email del Contacto:</label>
                <input type="email" class="form-control" id="email_contacto" name="email_contacto"
                    value="<?php echo htmlentities($email_contacto, ENT_QUOTES); ?>">
            </div>

            <br><br>
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a class="btn btn-secondary" href="Tabla_Contactos.php">Volver</a>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>

<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark " style="color: white; background-color: #000000 ">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
