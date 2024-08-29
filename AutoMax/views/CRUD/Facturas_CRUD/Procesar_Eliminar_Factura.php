<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_factura = $_POST['id_factura'];

    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    $stid = oci_parse($conn, 'BEGIN delete_factura(:id_factura); END;');
    oci_bind_by_name($stid, ':id_factura', $id_factura);

    if (oci_execute($stid)) {
        echo "<p>Factura eliminada exitosamente</p>";
    } else {
        $e = oci_error($stid);
        echo "<p>Error al eliminar la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid);
    oci_close($conn);
    header("Location: Tabla_Facturas.php");
    exit;
} else {
    echo "<p>Método no permitido</p>";
}
?>
