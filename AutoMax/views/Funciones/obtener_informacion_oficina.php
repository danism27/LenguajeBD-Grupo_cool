<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Verificar si se ha enviado el formulario
if (isset($_POST['id_oficina'])) {
    $id_oficina = $_POST['id_oficina'];

    // Preparar y ejecutar el bloque PL/SQL para obtener la información de la oficina
    $sql = 'BEGIN obtener_informacion_oficina(:id_oficina, :info_oficina); END;';
    $stid = oci_parse($conn, $sql);

    // Crear un cursor
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ':id_oficina', $id_oficina, -1, SQLT_INT);
    oci_bind_by_name($stid, ':info_oficina', $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el bloque PL/SQL
    if (oci_execute($stid)) {
        // Ejecutar el cursor
        if (oci_execute($cursor)) {
            $info_oficina = oci_fetch_assoc($cursor);
        } else {
            $e = oci_error($cursor);
            echo "<p>Error al ejecutar el cursor: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
            $info_oficina = null;
        }
    } else {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar el bloque PL/SQL: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        $info_oficina = null;
    }

    // Liberar recursos
    oci_free_statement($stid);
    oci_free_statement($cursor);
} else {
    $info_oficina = null;
}

// Consultar todas las oficinas para el select
$sql_oficinas = 'SELECT ID_OFICINA, NOMBRE_OFICINA FROM OFICINAS ORDER BY NOMBRE_OFICINA';
$stid_oficinas = oci_parse($conn, $sql_oficinas);
oci_execute($stid_oficinas);

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Detalles de la Oficina</title>
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
        <h1 class="text-center">Detalles de la Oficina</h1>

        <!-- Formulario para seleccionar la oficina -->
        <form method="post" class="text-center mb-4">
            <label for="id_oficina">Seleccione una oficina:</label>
            <select name="id_oficina" id="id_oficina" class="form-control d-inline-block w-50">
                <?php while ($row = oci_fetch_assoc($stid_oficinas)) : ?>
                    <option value="<?php echo htmlentities($row['ID_OFICINA'], ENT_QUOTES); ?>">
                        <?php echo htmlentities($row['NOMBRE_OFICINA'], ENT_QUOTES); ?>
                    </option>
                <?php endwhile; ?>
            </select>
            <button type="submit" class="btn btn-primary mt-3">Ver detalles</button>
        </form>

        <?php if ($info_oficina) : ?>
            <div class="alert alert-info">
                <h4>Información de la Oficina:</h4>
                <p><strong>Detalles:</strong> <?php echo htmlentities($info_oficina['INFO_OFICINA'], ENT_QUOTES); ?></p>
            </div>
        <?php elseif (isset($id_oficina)) : ?>
            <p class="text-center">No se encontró información para la oficina seleccionada.</p>
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
                    <p><i class="fa fa-instagram" aria-hidden="true"></i> @autos_max</p>
                    <p><i class="fa fa-twitter" aria-hidden="true"></i> @autos_max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctenos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> +1 (800) 555-5555</p>
                    <p><i class="fa fa-envelope" aria-hidden="true"></i> info@autosmax.com</p>
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i> 123 Calle Principal, Ciudad, País</p>
                </div>
            </div>
        </div>
    </div>
</footer>

</html>
