<?php
// Verificar si el ID está presente en la URL
if (isset($_GET['nombre_oficina'])) {
    $nombre_oficina = $_GET['nombre_oficina'];
    $fecha_registro = $_GET['fecha_registro'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN insert_oficina(:nombre_oficina, TO_DATE(:fecha_registro, \'YYYY-MM-DD\')); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stid, ':nombre_oficina', $nombre_oficina);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de oficinas después de la inserción exitosa
        header('Location: Tabla_Oficinas.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear la oficina: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "No se proporcionó un ID en la URL.";
}
?>

