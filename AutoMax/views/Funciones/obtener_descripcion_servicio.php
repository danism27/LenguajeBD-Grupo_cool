<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Inicializar variables
$cod_servicio = null;
$descripcion = null;

// Verificar si se ha enviado el formulario
if (isset($_POST['submit'])) {
    $cod_servicio = $_POST['cod_servicio'];

    // Preparar y ejecutar el bloque PL/SQL para obtener la descripción del servicio
    $sql = 'BEGIN :descripcion := obtener_descripcion_servicio(:cod_servicio); END;';
    $stid = oci_parse($conn, $sql);
    
    // Bind variables
    oci_bind_by_name($stid, ':cod_servicio', $cod_servicio);
    oci_bind_by_name($stid, ':descripcion', $descripcion, 1000);  // Ajusta el tamaño según sea necesario
    
    // Ejecutar el bloque PL/SQL
    if (!oci_execute($stid)) {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar el bloque PL/SQL: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        oci_free_statement($stid);
        oci_close($conn);
        exit;
    }

    // Liberar recursos
    oci_free_statement($stid);
}

// Obtener la lista de servicios para el formulario
$sql = 'SELECT COD_SERVICIO, NOMBRE_SERVICIO FROM SERVICIOS ORDER BY NOMBRE_SERVICIO';
$stid = oci_parse($conn, $sql);
oci_execute($stid);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Descripción del Servicio</title>
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
        <h1 class="text-center">Descripción del Servicio</h1>

        <!-- Formulario para seleccionar un servicio -->
        <form method="post" action="">
            <div class="mb-3">
                <label for="cod_servicio" class="form-label">Selecciona el Servicio:</label>
                <select id="cod_servicio" name="cod_servicio" class="form-select" required>
                    <option value="">Seleccione un servicio</option>
                    <?php while ($row = oci_fetch_assoc($stid)) : ?>
                        <option value="<?php echo htmlentities($row['COD_SERVICIO'], ENT_QUOTES); ?>">
                            <?php echo htmlentities($row['NOMBRE_SERVICIO'], ENT_QUOTES); ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Obtener Descripción</button>
        </form>

        <!-- Mostrar la descripción si se ha seleccionado un servicio -->
        <?php if ($descripcion !== null) : ?>
            <br>
            <div class="alert alert-info">
                <h4>Descripción:</h4>
                <p><?php echo htmlentities($descripcion, ENT_QUOTES); ?></p>
            </div>
        <?php elseif ($cod_servicio !== null) : ?>
            <p class="text-center">No se encontró descripción para el servicio seleccionado.</p>
        <?php endif; ?>

        <br>
        <a class="btn btn-secondary" href="/LenguajeBD-Grupo_cool/AutoMax/views/tablas.php">Volver</a>
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
