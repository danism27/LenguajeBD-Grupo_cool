<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Servicios</title>
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

// Llamar a una función del paquete servicios_empleados_pkg para obtener los servicios
$sql = 'BEGIN :cursor := servicios_empleados_pkg.obtener_servicios; END;';
$stid = oci_parse($conn, $sql);

// Crear un cursor para obtener los resultados
$cursor = oci_new_cursor($conn);
oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);
oci_execute($stid);
oci_execute($cursor, OCI_DEFAULT);

// Mostrar resultados en una tabla
echo '<div class="container mt-5">';
echo '<h2 class="text-center">Lista de Servicios</h2>';
echo '<table class="table table-striped table-bordered">';
echo '<thead class="thead-dark">';
echo '<tr>';
echo '<th scope="col">ID Servicio</th>';
echo '<th scope="col">Nombre Servicio</th>';
echo '<th scope="col">Precio Servicio</th>';
echo '</tr>';
echo '</thead>';
echo '<tbody>';
while (($row = oci_fetch_assoc($cursor)) != false) {
    echo "<tr>";
    echo "<td>" . htmlentities($row['COD_SERVICIO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['NOMBRE_SERVICIO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['PRECIO_SERVICIO'], ENT_QUOTES) . "</td>";
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
