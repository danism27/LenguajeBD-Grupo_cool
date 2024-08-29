<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Factura</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Asumimos que p_id_factura está proporcionado como un parámetro GET
$p_id_factura = isset($_GET['id_factura']) ? intval($_GET['id_factura']) : 0;

// Llamar a una función del paquete detalle_factura_pkg para obtener el detalle de la factura
$sql = 'BEGIN :cursor := detalle_factura_pkg.obtener_detalle_factura(:p_id_factura); END;';
$stid = oci_parse($conn, $sql);

// Crear un cursor para obtener los resultados
$cursor = oci_new_cursor($conn);
oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);
oci_bind_by_name($stid, ':p_id_factura', $p_id_factura);
oci_execute($stid);
oci_execute($cursor, OCI_DEFAULT);

// Mostrar resultados en una tabla
echo '<div class="container mt-5">';
echo '<h2 class="text-center">Detalle de la Factura ' . htmlentities($p_id_factura, ENT_QUOTES) . '</h2>';
echo '<table class="table table-striped table-bordered">';
echo '<thead class="thead-dark">';
echo '<tr>';
echo '<th scope="col">Código Repuesto</th>';
echo '<th scope="col">Nombre Repuesto</th>';
echo '<th scope="col">Cantidad</th>';
echo '<th scope="col">Precio Repuesto</th>';
echo '</tr>';
echo '</thead>';
echo '<tbody>';
while (($row = oci_fetch_assoc($cursor)) != false) {
    echo "<tr>";
    echo "<td>" . htmlentities($row['COD_REPUESTO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['NOMBRE_REPUESTO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['CANTIDAD'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['PRECIO_REPUESTO'], ENT_QUOTES) . "</td>";
    echo "</tr>";
}
echo '</tbody>';
echo '</table>';
echo '</div>';

// Limpiar recursos
oci_free_statement($stid);
oci_free_statement($cursor);

// Cerrar la conexión
oci_close($conn);
?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
