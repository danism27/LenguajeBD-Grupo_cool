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
    $id_contacto = $_POST['id_contacto'];

    // Preparar y ejecutar el bloque PL/SQL para verificar si el contacto tiene facturas
    $sql = 'BEGIN :resultado := contacto_tiene_facturas(:id_contacto); END;';
    $stid = oci_parse($conn, $sql);
    
    // Bind variables
    $resultado = null;
    oci_bind_by_name($stid, ':id_contacto', $id_contacto);
    oci_bind_by_name($stid, ':resultado', $resultado, 100); // Ajustar tamaño si es necesario
    
    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    
    // Liberar el recurso del statement
    oci_free_statement($stid);
} else {
    $id_contacto = null;
    $resultado = null;
}

// Obtener la lista de contactos para el formulario
$sql = 'SELECT ID_CONTACTO, NOMBRE_CONTACTO FROM CONTACTOS ORDER BY NOMBRE_CONTACTO ASC';
$stid = oci_parse($conn, $sql);
oci_execute($stid);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Verificación de Facturas</title>
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
        <h1 class="text-center">Verificación de Facturas del Contacto</h1>
        
        <form method="post" action="verificar_facturas.php">
            <div class="mb-3">
                <label for="id_contacto" class="form-label">Selecciona el Contacto:</label>
                <select id="id_contacto" name="id_contacto" class="form-select" required>
                    <option value="">Seleccione un contacto</option>
                    <?php while ($row = oci_fetch_assoc($stid)) : ?>
                        <option value="<?php echo htmlentities($row['ID_CONTACTO'], ENT_QUOTES); ?>">
                            <?php echo htmlentities($row['NOMBRE_CONTACTO'], ENT_QUOTES); ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Verificar Facturas</button>
        </form>

        <?php if ($resultado !== null) : ?>
            <br>
            <p class="text-center"><?php echo htmlentities($resultado, ENT_QUOTES); ?></p>
        <?php elseif ($id_contacto === null) : ?>
            <p class="text-center">No se ha seleccionado ningún contacto.</p>
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
// Liberar los recursos del statement y cerrar la conexión
oci_free_statement($stid);
oci_close($conn);
?>
