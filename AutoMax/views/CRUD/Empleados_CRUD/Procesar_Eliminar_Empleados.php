<?php
// Verificar si el ID está presente en la URL
if (isset($_GET['id'])) {
    $id_empleado = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado para eliminar un empleado
    $sql = 'BEGIN delete_empleado(:id_empleado); END;';
    $stid = oci_parse($conn, $sql);

    // Bind del parámetro
    oci_bind_by_name($stid, ':id_empleado', $id_empleado);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de empleados después de la eliminación exitosa
        header('Location: Tabla_Empleados.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al eliminar el empleado: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID válido para eliminar.</p>";
}
?>
