<?php
// Verificar si el ID está presente en la URL
if (isset($_GET['id'])) {
    $id_detalle_factura = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN delete_detalle_factura(:id_detalle_factura); END;';
    $stid = oci_parse($conn, $sql);

    // Bind del parámetro
    oci_bind_by_name($stid, ':id_detalle_factura', $id_detalle_factura);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de detalles de factura después de la eliminación exitosa
        header('Location: Tabla_Detalle_Factura.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al eliminar el detalle de la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID válido para eliminar.</p>";
}
?>