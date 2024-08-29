<?php
// Verificar si se ha proporcionado un ID de cliente en la URL
if (isset($_GET['id'])) {
    $cod_cliente = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Llamar al procedimiento total_facturas_cliente
    $sql = 'BEGIN total_facturas_cliente(:cod_cliente); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':cod_cliente', $cod_cliente);
    
    // Ejecutar la consulta y capturar la salida
    if (!oci_execute($stid)) {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    } else {
        // Aquí se puede manejar la salida, pero dado que el procedimiento imprime directamente
        // el resultado con DBMS_OUTPUT.PUT_LINE, no es necesario capturar nada más en PHP.
        echo "<p>Consulta ejecutada exitosamente.</p>";
    }

    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de cliente en la URL.</p>";
    exit();
}
?>