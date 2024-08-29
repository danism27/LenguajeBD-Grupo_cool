<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $id_servicio = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la consulta para eliminar el servicio
    $stid = oci_parse($conn, 'BEGIN delete_servicio(:id_servicio); END;');
    oci_bind_by_name($stid, ':id_servicio', $id_servicio);

    // Ejecutar la consulta
    if (oci_execute($stid)) {
        echo "<p>Servicio eliminado exitosamente.</p>";
    } else {
        $e = oci_error($stid);
        echo "<p>Error al eliminar el servicio: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid);
    oci_close($conn);

    // Redireccionar de vuelta a la tabla de servicios
    header("Location: Tabla_Servicio.php");
    exit;
} else {
    echo "<p>Método no permitido</p>";
}
?>
