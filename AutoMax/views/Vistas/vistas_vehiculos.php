<?php
// Establecer la conexión con Oracle usando oci_connect
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Preparar la consulta para la vista de vehículos activos
$query_select_vehiculos_activos = 'SELECT * FROM V_VEHICULOS_ACTIVOS';
$stid_select_vehiculos_activos = oci_parse($conn, $query_select_vehiculos_activos);

try {
    // Ejecutar la consulta
    if (!oci_execute($stid_select_vehiculos_activos)) {
        $e = oci_error($stid_select_vehiculos_activos);
        echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }
} catch (Exception $e) {
    echo "<p>Error al ejecutar la consulta: " . htmlentities($e->getMessage(), ENT_QUOTES) . "</p>";
    exit;
}

// Preparar la consulta para la vista de estado de registro
$query_select_estado_registro = 'SELECT * FROM V_VEHICULOS_ESTADO_REGISTRO';
$stid_select_estado_registro = oci_parse($conn, $query_select_estado_registro);

try {
    // Ejecutar la consulta
    if (!oci_execute($stid_select_estado_registro)) {
        $e = oci_error($stid_select_estado_registro);
        echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }
} catch (Exception $e) {
    echo "<p>Error al ejecutar la consulta: " . htmlentities($e->getMessage(), ENT_QUOTES) . "</p>";
    exit;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Vehículos</title>
<link rel="stylesheet" href="/CSS/promo.css">
<style> 
/* Estilos personalizados */
body {
    font-family: 'Roboto', sans-serif;
    margin: 20px;
    background-color: #f4f4f4;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #2c3e50;
    border-bottom: 2px solid #3498db;
    padding-bottom: 10px;
    margin-bottom: 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

h2 {
    color: #3498db;
    margin-top: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
    font-size: 20px;
}

form {
    margin-bottom: 20px;
    padding: 20px;
    background: #fafafa;
    border-radius: 8px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
}

input[type="text"], input[type="date"], input[type="number"], input[type="submit"] {
    padding: 12px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
    width: calc(100% - 24px);
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #3498db;
    color: #fff;
    border: none;
    cursor: pointer;
    font-weight: bold;
    border-radius: 6px;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #2980b9;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin-top: 20px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    text-align: center;
}

th, td {
    padding: 12px 20px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #3498db;
    color: #fff;
    text-transform: uppercase;
    font-size: 14px;
    letter-spacing: 0.5px;
}

tr {
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    cursor: pointer;
}

</style>
</head>
<body>

<center><h1><a href="../tablas.php" style="text-decoration: none; color: #000000;">Visualización AutoMax</a></h1></center>

<!-- Tabla para mostrar vehículos activos -->
<center><h2>Vehículos Activos</h2></center>

<?php
// Mostrar los datos en la tabla
echo '<table border="1">';
echo '<tr><th>NUM_PLACA</th><th>TIPO_VEHICULO</th><th>MARCA</th><th>MODELO</th><th>FECHA_REGISTRO</th></tr>';

while ($row = oci_fetch_assoc($stid_select_vehiculos_activos)) {
    echo '<tr>';
    foreach ($row as $key => $value) {
        echo '<td>' . htmlspecialchars($value) . '</td>';
    }
    echo '</tr>';
}
echo '</table>';
?>

<!-- Tabla para mostrar el estado de los vehículos -->
<center><h2>Registro del Estado de los Vehículos</h2></center>

<?php
// Mostrar los datos en la tabla
echo '<table border="1">';
echo '<tr><th>NUM_PLACA</th><th>TIPO_VEHICULO</th><th>ESTADO_VEHICULO</th><th>FECHA_REGISTRO</th></tr>';

while ($row = oci_fetch_assoc($stid_select_estado_registro)) {
    echo '<tr>';
    foreach ($row as $key => $value) {
        echo '<td>' . htmlspecialchars($value) . '</td>';
    }
    echo '</tr>';
}
echo '</table>';

// Liberar recursos y cerrar la conexión
oci_free_statement($stid_select_vehiculos_activos);
oci_free_statement($stid_select_estado_registro);
oci_close($conn);
?>

</body>
</html>
