<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['id_vehiculo'], $_GET['num_placa'], $_GET['tipo_vehiculo'], $_GET['estado_vehiculo'], $_GET['marca'], $_GET['modelo'], $_GET['fecha_registro'], $_GET['nombre_usuario'])) {
    $id_vehiculo = $_GET['id_vehiculo'];
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
        exit();
    }

    // Preparar la llamada al procedimiento almacenado de actualización
    $sql_update = 'BEGIN update_vehiculo(:id_vehiculo, :num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, :fecha_registro, :nombre_usuario); END;';
    $stid_update = oci_parse($conn, $sql_update);
    oci_bind_by_name($stid_update, ':id_vehiculo', $id_vehiculo);
    oci_bind_by_name($stid_update, ':num_placa', $num_placa);
    oci_bind_by_name($stid_update, ':tipo_vehiculo', $tipo_vehiculo);
    oci_bind_by_name($stid_update, ':estado_vehiculo', $estado_vehiculo);
    oci_bind_by_name($stid_update, ':marca', $marca);
    oci_bind_by_name($stid_update, ':modelo', $modelo);
    oci_bind_by_name($stid_update, ':fecha_registro', $fecha_registro);
    oci_bind_by_name($stid_update, ':nombre_usuario', $nombre_usuario);
    $r_update = oci_execute($stid_update);

    if ($r_update) {
        echo "<p>Vehículo actualizado correctamente.</p>";
        // Redirigir de nuevo a la tabla de vehículos
        header('Location: Tabla_Vehiculo.php');
        exit();
    } else {
        $e = oci_error($stid_update);
        echo "<p>Error al actualizar el vehículo: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid_update);
    oci_close($conn);
} else {
    echo "<p>No se enviaron datos válidos para actualizar.</p>";
    exit();
}
?>
