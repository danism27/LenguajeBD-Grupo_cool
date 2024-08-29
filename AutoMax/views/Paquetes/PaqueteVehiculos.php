<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vehículos</title>
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

// Llamar a una función del paquete vehiculos_pkg para obtener los vehículos activos
$sql = 'BEGIN :cursor := vehiculos_pkg.obtener_vehiculos_activos; END;';
$stid = oci_parse($conn, $sql);

// Crear un cursor para obtener los resultados
$cursor = oci_new_cursor($conn);
oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);
oci_execute($stid);
oci_execute($cursor, OCI_DEFAULT);

// Mostrar resultados en una tabla
echo '<div class="container mt-5">';
echo '<h2 class="text-center">Lista de Vehículos Activos</h2>';
echo '<table class="table table-striped table-bordered">';
echo '<thead class="thead-dark">';
echo '<tr>';
echo '<th scope="col">ID Vehículo</th>';
echo '<th scope="col">Número de Placa</th>';
echo '<th scope="col">Tipo de Vehículo</th>';
echo '<th scope="col">Estado del Vehículo</th>';
echo '</tr>';
echo '</thead>';
echo '<tbody>';
while (($row = oci_fetch_assoc($cursor)) != false) {
    echo "<tr>";
    echo "<td>" . htmlentities($row['ID_VEHICULO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['NUM_PLACA'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['TIPO_VEHICULO'], ENT_QUOTES) . "</td>";
    echo "<td>" . htmlentities($row['ESTADO_VEHICULO'], ENT_QUOTES) . "</td>";
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
