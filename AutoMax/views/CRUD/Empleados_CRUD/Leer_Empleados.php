<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id_empleado'])) {
    $id_empleado = $_GET['id_empleado'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la consulta
    $sql = 'BEGIN get_empleado(:id_empleado, :nombre_empleado, :apellido_empleado, :cargo_empleado, :fecha_contratacion, :salario); END;';
    $stid = oci_parse($conn, $sql);

    // Variables para capturar los resultados
    oci_bind_by_name($stid, ':id_empleado', $id_empleado);
    oci_bind_by_name($stid, ':nombre_empleado', $nombre_empleado, 100);
    oci_bind_by_name($stid, ':apellido_empleado', $apellido_empleado, 100);
    oci_bind_by_name($stid, ':cargo_empleado', $cargo_empleado, 100);
    oci_bind_by_name($stid, ':fecha_contratacion', $fecha_contratacion);
    oci_bind_by_name($stid, ':salario', $salario, 10);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al consultar el empleado: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    } else {
        // Mostrar resultados (opcional)
        echo "<p>Nombre del Empleado: " . htmlentities($nombre_empleado, ENT_QUOTES) . "</p>";
        echo "<p>Apellido del Empleado: " . htmlentities($apellido_empleado, ENT_QUOTES) . "</p>";
        echo "<p>Cargo del Empleado: " . htmlentities($cargo_empleado, ENT_QUOTES) . "</p>";
        echo "<p>Fecha de Contratación: " . htmlentities(date('Y-m-d', strtotime($fecha_contratacion)), ENT_QUOTES) . "</p>";
        echo "<p>Salario: " . htmlentities($salario, ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de empleado en la URL.</p>";
}
?>