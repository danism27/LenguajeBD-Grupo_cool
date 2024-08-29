<?php
// Verificar si se ha proporcionado un valor en la URL
if (isset($_GET['precio'])) {
    $valor_precio = $_GET['precio'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Llamar al procedimiento mostrar_servicios_precio_mayor
    $sql = 'BEGIN mostrar_servicios_precio_mayor(:valor_precio); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':valor_precio', $valor_precio);
    oci_execute($stid);
    oci_free_statement($stid);

    // Obtener la salida de DBMS_OUTPUT
    $output = "";
    $sql_output = "DECLARE
                      line VARCHAR2(255);
                      status INTEGER;
                   BEGIN
                      LOOP
                          DBMS_OUTPUT.GET_LINE(line, status);
                          EXIT WHEN status = 1;
                          :output := :output || line || CHR(10);
                      END LOOP;
                   END;";
    $stid_output = oci_parse($conn, $sql_output);
    oci_bind_by_name($stid_output, ':output', $output, 4000);
    oci_execute($stid_output);
    oci_free_statement($stid_output);

    echo "<pre>$output</pre>";

    oci_close($conn);
} else {
    echo "<p>No se proporcionó un valor de precio en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Servicios con Precio Mayor - Resultado</title>
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
        <h1 class="text-center">Servicios con Precio Mayor</h1>
        <form action="Servicios_Con_Precio.php" method="GET">
            <div class="form-group">
                <label for="precio">Precio Mínimo:</label>
                <input type="number" class="form-control" id="precio" name="precio" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary">Buscar</button>
            <a class="btn btn-secondary" href="Tabla_Servicios.php">Volver</a>
        </form>
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
