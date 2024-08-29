<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['cod_factura']) && isset($_GET['cod_repuesto']) && isset($_GET['cantidad'])) {

    $cod_factura = $_GET['cod_factura'];
    $cod_repuesto = $_GET['cod_repuesto'];
    $cantidad = $_GET['cantidad'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN insert_detalle_factura(:cod_factura, :cod_repuesto, :cantidad); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stid, ':cod_factura', $cod_factura);
    oci_bind_by_name($stid, ':cod_repuesto', $cod_repuesto);
    oci_bind_by_name($stid, ':cantidad', $cantidad);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de detalles de factura después de la inserción exitosa
        header('Location: Tabla_Detalle_Factura.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear el detalle de la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionaron datos válidos para crear el detalle de la factura.</p>";
}
?>