<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id_detalle_factura'])) {
    $id_detalle_factura = $_GET['id_detalle_factura'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN get_detalle_factura(:id_detalle_factura, :cod_factura, :cod_repuesto, :cantidad); END;';
    $stid = oci_parse($conn, $sql);

    // Variables para capturar los resultados
    oci_bind_by_name($stid, ':id_detalle_factura', $id_detalle_factura);
    oci_bind_by_name($stid, ':cod_factura', $cod_factura, 20);
    oci_bind_by_name($stid, ':cod_repuesto', $cod_repuesto, 20);
    oci_bind_by_name($stid, ':cantidad', $cantidad, 10);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al consultar el detalle de la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    } else {
        // Mostrar resultados (opcional)
        echo "<p>Código de Factura: " . htmlentities($cod_factura, ENT_QUOTES) . "</p>";
        echo "<p>Código de Repuesto: " . htmlentities($cod_repuesto, ENT_QUOTES) . "</p>";
        echo "<p>Cantidad: " . htmlentities($cantidad, ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de detalle de factura en la URL.</p>";
}
?>