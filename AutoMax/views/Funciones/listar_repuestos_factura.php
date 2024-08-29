<?php
// Verificar si se ha proporcionado un código de repuesto en la URL
if (isset($_GET['id'])) {
    $cod_repuesto = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar y ejecutar el bloque PL/SQL para obtener los detalles del repuesto
    $sql = 'BEGIN :cursor := listar_repuestos(:cod_repuesto); END;';
    $stid = oci_parse($conn, $sql);
    
    // Bind variables
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ':cod_repuesto', $cod_repuesto);
    oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);
    
    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    oci_execute($cursor);
    
    // Fetch all rows from the cursor
    $repuestos = [];
    while ($row = oci_fetch_assoc($cursor)) {
        $repuestos[] = $row;
    }

    // Libera los recursos
    oci_free_statement($stid);
    oci_free_statement($cursor);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un código de repuesto en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Detalles del Repuesto</title>
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
        <h1 class="text-center">Detalles del Repuesto</h1>
        <?php if (!empty($repuestos)) : ?>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nombre del Repuesto</th>
                        <th>Fecha de Registro</th>
                        <th>Nombre del Usuario</th>
                        <th>Precio del Repuesto</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($repuestos as $repuesto) : ?>
                        <tr>
                            <td><?php echo htmlentities($repuesto['NOMBRE_REPUESTO'], ENT_QUOTES); ?></td>
                            <td><?php echo htmlentities(date('d/m/Y', strtotime($repuesto['FECHA_REGISTRO'])), ENT_QUOTES); ?></td>
                            <td><?php echo htmlentities($repuesto['NOMBRE_USUARIO'], ENT_QUOTES); ?></td>
                            <td><?php echo htmlentities(number_format($repuesto['PRECIO_REPUESTO'], 2), ENT_QUOTES); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else : ?>
            <p class="text-center">No se encontraron repuestos para el código proporcionado.</p>
        <?php endif; ?>
        <br>
        <a class="btn btn-secondary" href="index.php">Volver</a>
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
