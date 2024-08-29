<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Verificar si se ha enviado el formulario
if (isset($_POST['submit'])) {
    $id_factura = $_POST['id_factura'];

    // Preparar y ejecutar el bloque PL/SQL para obtener el total de la factura
    $sql = 'BEGIN :total := calcular_total_factura(:id_factura); END;';
    $stid = oci_parse($conn, $sql);
    
    // Bind variables
    $total = null;
    oci_bind_by_name($stid, ':id_factura', $id_factura);
    oci_bind_by_name($stid, ':total', $total, 20); // Adjust size if necessary
    
    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    oci_free_statement($stid);
} else {
    $id_factura = null;
    $total = null;
}

// Obtener la lista de facturas para el formulario
$sql = 'SELECT COD_FACTURA, FECHA_FACTURA FROM FACTURAS ORDER BY FECHA_FACTURA DESC';
$stid = oci_parse($conn, $sql);
oci_execute($stid);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Total de Factura</title>
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
        <h1 class="text-center">Total de Factura</h1>
        
        <form method="post" action="calcular_total_factura.php">
            <div class="mb-3">
                <label for="id_factura" class="form-label">Selecciona la Factura:</label>
                <select id="id_factura" name="id_factura" class="form-select" required>
                    <option value="">Seleccione una factura</option>
                    <?php while ($row = oci_fetch_assoc($stid)) : ?>
                        <option value="<?php echo htmlentities($row['COD_FACTURA'], ENT_QUOTES); ?>">
                            Factura ID: <?php echo htmlentities($row['COD_FACTURA'], ENT_QUOTES); ?> - 
                            Fecha: <?php echo htmlentities($row['FECHA_FACTURA'], ENT_QUOTES); ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Calcular Total</button>
        </form>

        <?php if ($total !== null) : ?>
            <br>
            <p class="text-center">El total de la factura con ID <?php echo htmlentities($id_factura, ENT_QUOTES); ?> es: <?php echo number_format($total, 2, ',', '.'); ?>.</p>
        <?php elseif ($id_factura === null) : ?>
            <p class="text-center">No se ha seleccionado ninguna factura.</p>
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

<?php
oci_free_statement($stid);
oci_close($conn);
?>
