<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['id_detalle_factura']) && isset($_GET['cod_factura']) && isset($_GET['cod_repuesto']) &&
    isset($_GET['cantidad'])) {

    $id_detalle_factura = $_GET['id_detalle_factura'];
    $cod_factura = $_GET['cod_factura'];
    $cod_repuesto = $_GET['cod_repuesto'];
    $cantidad = $_GET['cantidad'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit();
    }

    // Preparar la llamada al procedimiento almacenado de actualización
    $sql_update = 'BEGIN update_detalle_factura(:id_detalle_factura, :cod_factura, :cod_repuesto, :cantidad); END;';
    $stid_update = oci_parse($conn, $sql_update);

    // Vincular las variables con los parámetros del procedimiento
    oci_bind_by_name($stid_update, ':id_detalle_factura', $id_detalle_factura);
    oci_bind_by_name($stid_update, ':cod_factura', $cod_factura);
    oci_bind_by_name($stid_update, ':cod_repuesto', $cod_repuesto);
    oci_bind_by_name($stid_update, ':cantidad', $cantidad);

    // Ejecutar el procedimiento
    $r_update = oci_execute($stid_update);

    if ($r_update) {
        echo "<p>Detalle de factura actualizado correctamente.</p>";
        // Redirigir de nuevo a la tabla de detalles de factura
        header('Location: Tabla_Detalle_Factura.php');
        exit();
    } else {
        $e = oci_error($stid_update);
        echo "<p>Error al actualizar el detalle de la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid_update);
    oci_close($conn);
} else {
    echo "<p>No se enviaron datos válidos para actualizar.</p>";
    exit();
}
?>