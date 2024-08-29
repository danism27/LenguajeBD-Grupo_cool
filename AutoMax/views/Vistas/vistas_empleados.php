<?php
// Establecer la conexión a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Preparar la consulta para la vista V_EMPLEADOS_SALARIOS
$query_select_empleados_salarios = 'SELECT * FROM V_EMPLEADOS_SALARIOS';
$stmt_select_empleados_salarios = oci_parse($conn, $query_select_empleados_salarios);

if (!oci_execute($stmt_select_empleados_salarios)) {
    $e = oci_error($stmt_select_empleados_salarios);
    echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    oci_free_statement($stmt_select_empleados_salarios);
    oci_close($conn);
    exit;
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestión de Empleados</title>
<link rel="stylesheet" href="/CSS/promo.css">
<style>
/* Estilos CSS */
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

<!-- Tabla para mostrar los salarios de los empleados -->
<center><h2>Salarios de los Empleados</h2></center>
<?php
// Mostrar los datos de la vista V_EMPLEADOS_SALARIOS
echo '<table border="1">';
echo '<tr><th>NOMBRE_EMPLEADO</th><th>APELLIDO_EMPLEADO</th><th>CARGO_EMPLEADO</th><th>FECHA_CONTRATACION</th><th>SALARIO</th></tr>';

while ($row = oci_fetch_assoc($stmt_select_empleados_salarios)) {
    echo '<tr>';
    foreach ($row as $value) {
        echo '<td>' . htmlspecialchars($value) . '</td>';
    }
    echo '</tr>';
}
echo '</table>';

// Liberar los recursos y cerrar la conexión
oci_free_statement($stmt_select_empleados_salarios);
oci_close($conn);
?>
</body>
</html>
