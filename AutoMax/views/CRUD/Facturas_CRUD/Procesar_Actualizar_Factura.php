<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_factura = $_POST['id_factura'];
    $cod_factura = $_POST['cod_factura'];
    $cod_cliente = $_POST['cod_cliente'];
    $fecha_factura = $_POST['fecha_factura'];
    $total_factura = $_POST['total_factura'];

    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    $stid = oci_parse($conn, 'BEGIN update_factura(:id_factura, :cod_factura, :cod_cliente, TO_DATE(:fecha_factura, \'YYYY-MM-DD\'), :total_factura); END;');
    oci_bind_by_name($stid, ':id_factura', $id_factura);
    oci_bind_by_name($stid, ':cod_factura', $cod_factura);
    oci_bind_by_name($stid, ':cod_cliente', $cod_cliente);
    oci_bind_by_name($stid, ':fecha_factura', $fecha_factura);
    oci_bind_by_name($stid, ':total_factura', $total_factura);

    if (oci_execute($stid)) {
        echo "<p>Factura actualizada exitosamente</p>";
    } else {
        $e = oci_error($stid);
        echo "<p>Error al actualizar la factura: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid);
    oci_close($conn);
    header("Location: Tabla_Facturas.php");
    exit;
} else {
    echo "<p>Método no permitido</p>";
}
?>
