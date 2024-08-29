<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Llamar al procedimiento total_servicios_facturados
$sql = 'BEGIN total_servicios_facturados; END;';
$stid = oci_parse($conn, $sql);

// Ejecutar la consulta y verificar errores
if (!oci_execute($stid)) {
    $e = oci_error($stid);
    echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
} else {
    // Aquí se puede manejar la salida, pero dado que el procedimiento imprime directamente
    // el resultado con DBMS_OUTPUT.PUT_LINE, no es necesario capturar nada más en PHP.
    echo "<p>Consulta ejecutada exitosamente.</p>";
}

oci_free_statement($stid);
oci_close($conn);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Total de Servicios Facturados</title>
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

    <div class="container">
        <h1 class="text-center">Total de Servicios Facturados</h1>
        <p>El total de servicios facturados se ha calculado correctamente.</p>
    </div>

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

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
