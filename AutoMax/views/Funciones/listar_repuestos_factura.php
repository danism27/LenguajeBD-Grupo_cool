<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

$repuestos = [];
$facturas = [];
$selected_factura_id = null;

// Verificar si se ha enviado el formulario para seleccionar una factura
if (isset($_POST['factura_id'])) {
    $selected_factura_id = $_POST['factura_id'];

    // Preparar y ejecutar el bloque PL/SQL para obtener los detalles del repuesto
    $sql = 'BEGIN :cursor := listar_repuestos(:cod_factura); END;';
    $stid = oci_parse($conn, $sql);

    // Bind variables
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ':cod_factura', $selected_factura_id);
    oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    oci_execute($cursor);

    // Fetch all rows from the cursor
    while ($row = oci_fetch_assoc($cursor)) {
        $repuestos[] = $row;
    }

    // Libera los recursos
    oci_free_statement($stid);
    oci_free_statement($cursor);
}

// Preparar y ejecutar el bloque PL/SQL para obtener las facturas
$sql_facturas = 'BEGIN :cursor := listar_facturas(); END;';
$stid_facturas = oci_parse($conn, $sql_facturas);

// Bind variables
$cursor_facturas = oci_new_cursor($conn);
oci_bind_by_name($stid_facturas, ':cursor', $cursor_facturas, -1, OCI_B_CURSOR);

// Ejecutar el bloque PL/SQL
oci_execute($stid_facturas);
oci_execute($cursor_facturas);

// Fetch all rows from the cursor
while ($row_factura = oci_fetch_assoc($cursor_facturas)) {
    $facturas[] = $row_factura;
}

// Libera los recursos
oci_free_statement($stid_facturas);
oci_free_statement($cursor_facturas);
oci_close($conn);
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
        
        <!-- Formulario para seleccionar la factura -->
        <form method="POST" action="">
            <div class="form-group">
                <label for="factura_id">Selecciona una factura:</label>
                <select id="factura_id" name="factura_id" class="form-control">
                    <option value="">Seleccione una factura</option>
                    <?php foreach ($facturas as $factura) : ?>
                        <option value="<?php echo htmlentities($factura['COD_FACTURA'], ENT_QUOTES); ?>">
                            Factura ID: <?php echo htmlentities($factura['COD_FACTURA'], ENT_QUOTES); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <br>
            <button type="submit" class="btn btn-primary">Mostrar Detalles</button>
        </form>

        <?php if (!empty($repuestos)) : ?>
            <h2 class="text-center">Detalles del Repuesto</h2>
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
        <?php elseif ($selected_factura_id !== null) : ?>
            <p class="text-center">No se encontraron repuestos para el código de factura proporcionado.</p>
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
        </div>
    </div>
</footer>

</html>
