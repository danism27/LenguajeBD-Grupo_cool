<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leer Factura</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <h1 class="text-center">Detalles de la Factura</h1>
        <div class="row">
            <div class="col">
                <?php
                if (isset($_GET['id_factura'])) {
                    $id_factura = $_GET['id_factura'];

                    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
                    if (!$conn) {
                        $e = oci_error();
                        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
                        exit;
                    }

                    $stid = oci_parse($conn, 'SELECT * FROM FACTURAS WHERE ID_FACTURA = :id_factura');
                    oci_bind_by_name($stid, ':id_factura', $id_factura);
                    oci_execute($stid);

                    if ($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS)) {
                        echo "<table class='table table-bordered'>\n";
                        echo "<tr><th>ID FACTURA</th><td>" . htmlentities($row['ID_FACTURA'], ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>CÓDIGO FACTURA</th><td>" . htmlentities($row['COD_FACTURA'], ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>CÓDIGO CLIENTE</th><td>" . htmlentities($row['COD_CLIENTE'], ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>FECHA FACTURA</th><td>" . htmlentities($row['FECHA_FACTURA'], ENT_QUOTES) . "</td></tr>\n";
                        echo "<tr><th>TOTAL FACTURA</th><td>" . htmlentities($row['TOTAL_FACTURA'], ENT_QUOTES) . "</td></tr>\n";
                        echo "</table>\n";
                    } else {
                        echo "<p>No se encontró la factura con ID: " . htmlentities($id_factura, ENT_QUOTES) . "</p>";
                    }

                    oci_free_statement($stid);
                    oci_close($conn);
                } else {
                    echo "<p>ID de factura no especificado.</p>";
                }
                ?>
                <button type="button" class="btn btn-secondary mt-3" onclick="window.location.href='Tabla_Facturas.php'">Volver a Facturas</button>
            </div>
        </div>
    </div>
</body>

</html>
