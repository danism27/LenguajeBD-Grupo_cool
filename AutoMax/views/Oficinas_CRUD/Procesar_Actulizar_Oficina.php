<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['id_oficina']) && isset($_GET['nombre_oficina']) && isset($_GET['fecha_registro'])) {
    $id_oficina = $_GET['id_oficina'];
    $nombre_oficina = $_GET['nombre_oficina'];
    $fecha_registro = $_GET['fecha_registro'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit();
    }

    // Preparar la llamada al procedimiento almacenado de actualización
    $sql_update = 'BEGIN update_oficina(:id_oficina, :nombre_oficina, :fecha_registro); END;';
    $stid_update = oci_parse($conn, $sql_update);
    oci_bind_by_name($stid_update, ':id_oficina', $id_oficina);
    oci_bind_by_name($stid_update, ':nombre_oficina', $nombre_oficina);
    oci_bind_by_name($stid_update, ':fecha_registro', $fecha_registro);
    $r_update = oci_execute($stid_update);

    if ($r_update) {
        echo "<p>Oficina actualizada correctamente.</p>";
        // Redirigir de nuevo a la tabla de oficinas
        header('Location: Tabla_Oficinas.php');
        exit();
    } else {
        $e = oci_error($stid_update);
        echo "<p>Error al actualizar la oficina: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid_update);
    oci_close($conn);
} else {
    echo "<p>No se enviaron datos válidos para actualizar.</p>";
    exit();
}
?>
