<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facturas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
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
        <br><br><br>
        <div class="container">
            <h1 class="text-center">FACTURAS</h1>

            <!-- Botones para Crear y Leer -->
            <div class="mb-3 d-flex justify-content-center align-items-center">
                <!-- Mini Formulario para Leer Factura Específica -->
                <form action="Leer_Factura.php" method="GET" class="form-inline d-flex mr-3">
                    <label for="id_factura" class="mr-2">Buscar Factura por ID:</label>
                    <input type="number" id="id_factura" name="id_factura" class="form-control mr-2" required>
                    <button type="submit" class="btn btn-primary">Leer</button>
                </form>
                <button type="button" class="btn btn-success ml-3"
                    onclick="window.location.href='Crear_Factura.php'">Crear</button>
            </div>

            <div class="row">
                <div class="col">
                    <?php
                    // Conectar a la base de datos
                    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
                    if (!$conn) {
                        $e = oci_error();
                        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
                        exit;
                    }

                    // Consultar las facturas
                    $stid = oci_parse($conn, 'SELECT * FROM FACTURAS ORDER BY ID_FACTURA ASC');
                    oci_execute($stid);

                    // Mostrar la tabla con los datos y los botones de actualizar y eliminar
                    echo "<table class='table table-striped table-bordered table-sm table-fixed'>\n";
                    echo "<thead class='thead-dark'>\n";
                    echo "<tr>\n";
                    echo "<th>ID FACTURA</th>\n";
                    echo "<th>CÓDIGO FACTURA</th>\n";
                    echo "<th>CÓDIGO CLIENTE</th>\n";
                    echo "<th>FECHA FACTURA</th>\n";
                    echo "<th>TOTAL FACTURA</th>\n";
                    echo "<th>Actualizar</th>\n";
                    echo "<th>Eliminar</th>\n";
                    echo "</tr>\n";
                    echo "</thead>\n";
                    echo "<tbody>\n";

                    while ($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS)) {
                        echo "<tr>\n";
                        echo "<td>" . htmlentities($row['ID_FACTURA'], ENT_QUOTES) . "</td>\n";
                        echo "<td>" . htmlentities($row['COD_FACTURA'], ENT_QUOTES) . "</td>\n";
                        echo "<td>" . htmlentities($row['COD_CLIENTE'], ENT_QUOTES) . "</td>\n";
                        echo "<td>" . htmlentities($row['FECHA_FACTURA'], ENT_QUOTES) . "</td>\n";
                        echo "<td>" . htmlentities($row['TOTAL_FACTURA'], ENT_QUOTES) . "</td>\n";
                        echo "<td><a href='Actualizar_Facturas.php?id=" . $row['ID_FACTURA'] . "' class='btn btn-warning btn-sm'>Actualizar</a></td>\n";
                        echo "<td><a href='Procesar_Eliminar_Factura.php?id=" . $row['ID_FACTURA'] . "' class='btn btn-danger btn-sm'>Eliminar</a></td>\n";
                        echo "</tr>\n";
                    }

                    echo "</tbody>\n";
                    echo "</table>\n";

                    // Cerrar la conexión
                    oci_free_statement($stid);
                    oci_close($conn);
                    ?>
                </div>
            </div>
        </div>
</body>

</html>
<footer>

    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark " style="color: white; background-color: #000000 ">
        <div class="container">
            <div class="row">

                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados,
                        alquiler de autos y
                        venta de repuestos.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Redes Sociales</h3>
                    <p> <i class="fa fa-facebook" aria-hidden="true"></i> Autos Max</p>
                    <p> <i class="fa fa-instagram" aria-hidden="true"></i> Autos Max</p>
                    <p> <i class="fa fa-twitter" aria-hidden="true"></i> Autos Max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Teléfono: 809-555-5555</p>
                    <p> <i class="fa fa-exclamation-circle" aria-hidden="true"></i> Correo: AutosMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
</footer>
