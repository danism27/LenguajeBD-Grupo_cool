<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id_oficina'])) {
    $id_oficina = $_GET['id_oficina'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN get_oficina(:id_oficina, :nombre_oficina, :fecha_registro); END;';
    $stid = oci_parse($conn, $sql);

    // Variables para capturar los resultados
    oci_bind_by_name($stid, ':id_oficina', $id_oficina);
    oci_bind_by_name($stid, ':nombre_oficina', $nombre_oficina, 100);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al consultar la oficina: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de oficina en la URL.</p>";
}
?>