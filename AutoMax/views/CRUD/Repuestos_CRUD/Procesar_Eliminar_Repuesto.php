<?php
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id_repuesto = intval($_GET['id']);

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar y ejecutar el procedimiento almacenado para eliminar un repuesto
    $stid = oci_parse($conn, 'BEGIN delete_repuesto(:id_repuesto); END;');
    oci_bind_by_name($stid, ':id_repuesto', $id_repuesto);

    // Ejecutar el procedimiento
    if (oci_execute($stid)) {
        echo "<p>Repuesto eliminado exitosamente</p>";
    } else {
        $e = oci_error($stid);
        echo "<p>Error al eliminar el repuesto: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar recursos y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);

    // Redirigir a la página de tabla de repuestos
    header("Location: Tabla_Repuesto.php");
    exit;
} else {
    echo "<p>ID no válido</p>";
}
?>
