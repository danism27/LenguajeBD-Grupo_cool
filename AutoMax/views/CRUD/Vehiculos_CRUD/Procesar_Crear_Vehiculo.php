<?php
// Verificar si los datos necesarios están presentes en la URL
if (isset($_GET['num_placa'], $_GET['tipo_vehiculo'], $_GET['estado_vehiculo'], $_GET['marca'], $_GET['modelo'], $_GET['fecha_registro'], $_GET['nombre_usuario'])) {
    $num_placa = $_GET['num_placa'];
    $tipo_vehiculo = $_GET['tipo_vehiculo'];
    $estado_vehiculo = $_GET['estado_vehiculo'];
    $marca = $_GET['marca'];
    $modelo = $_GET['modelo'];
    $fecha_registro = $_GET['fecha_registro'];
    $nombre_usuario = $_GET['nombre_usuario'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN insert_vehiculo(:num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, TO_DATE(:fecha_registro, \'YYYY-MM-DD\'), :nombre_usuario); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stid, ':num_placa', $num_placa);
    oci_bind_by_name($stid, ':tipo_vehiculo', $tipo_vehiculo);
    oci_bind_by_name($stid, ':estado_vehiculo', $estado_vehiculo);
    oci_bind_by_name($stid, ':marca', $marca);
    oci_bind_by_name($stid, ':modelo', $modelo);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro);
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de vehículos después de la inserción exitosa
        header('Location: Tabla_Vehiculo.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear el vehículo: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "No se proporcionaron todos los datos necesarios en la URL.";
}
?>
