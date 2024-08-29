<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Factura</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <h1 class="text-center">Actualizar Factura</h1>
        <?php
        if (isset($_GET['id'])) {
            $id_factura = $_GET['id'];

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
                ?>
                <form action="Procesar_Actualizar_Factura.php" method="POST">
                    <input type="hidden" name="id_factura" value="<?php echo $id_factura; ?>">
                    <div class="form-group">
                        <label for="cod_factura">Código Factura:</label>
                        <input type="text" class="form-control" id="cod_factura" name="cod_factura"
                            value="<?php echo htmlentities($row['COD_FACTURA'], ENT_QUOTES); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="cod_cliente">Código Cliente:</label>
                        <input type="text" class="form-control" id="cod_cliente" name="cod_cliente"
                            value="<?php echo htmlentities($row['COD_CLIENTE'], ENT_QUOTES); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="fecha_factura">Fecha Factura:</label>
                        <input type="date" class="form-control" id="fecha_factura" name="fecha_factura"
                            value="<?php echo htmlentities($row['FECHA_FACTURA'], ENT_QUOTES); ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="total_factura">Total Factura:</label>
                        <input type="number" class="form-control" id="total_factura" name="total_factura"
                            value="<?php echo htmlentities($row['TOTAL_FACTURA'], ENT_QUOTES); ?>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Actualizar Factura</button>
                </form>
                <?php
            } else {
                echo "<p>No se encontró la factura con ID: " . htmlentities($id_factura, ENT_QUOTES) . "</p>";
            }

            oci_free_statement($stid);
            oci_close($conn);
        } else {
            echo "<p>ID de factura no especificado.</p>";
        }
        ?>
    </div>
</body>

</html>
