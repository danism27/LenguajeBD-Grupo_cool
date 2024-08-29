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

    // Preparar y ejecutar el bloque PL/SQL
    $sql = 'BEGIN :resultado := total_facturas_cliente(:cod_cliente); END;';
    $stid = oci_parse($conn, $sql);

    // Bind variables
    $resultado = null;
    oci_bind_by_name($stid, ':cod_cliente', $cod_cliente);
    oci_bind_by_name($stid, ':resultado', $resultado, 100); // Ajustar tamaño del resultado según sea necesario

    // Ejecutar el bloque PL/SQL
    if (!oci_execute($stid)) {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    } else {
        // Mostrar el resultado obtenido
        echo "<p>Total de facturas para el cliente con ID " . htmlentities($cod_cliente, ENT_QUOTES) . ": " . htmlentities($resultado, ENT_QUOTES) . "</p>";
    }

    // Liberar recursos
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de cliente en la URL.</p>";
    exit();
}
?>