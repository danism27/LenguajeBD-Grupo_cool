<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['id_empleado']) && isset($_GET['nombre_empleado']) && isset($_GET['apellido_empleado']) &&
    isset($_GET['cargo_empleado']) && isset($_GET['fecha_contratacion']) &&
    isset($_GET['salario'])) {

    $id_empleado = $_GET['id_empleado'];
    $nombre_empleado = $_GET['nombre_empleado'];
    $apellido_empleado = $_GET['apellido_empleado'];
    $cargo_empleado = $_GET['cargo_empleado'];
    $fecha_contratacion = $_GET['fecha_contratacion'];
    $salario = $_GET['salario'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit();
    }

    // Preparar la llamada al procedimiento almacenado de actualización
    $sql_update = 'BEGIN update_empleado(:id_empleado, :nombre_empleado, :apellido_empleado, :cargo_empleado, TO_DATE(:fecha_contratacion, \'YYYY-MM-DD\'), :salario); END;';
    $stid_update = oci_parse($conn, $sql_update);

    // Vincular las variables con los parámetros del procedimiento
    oci_bind_by_name($stid_update, ':id_empleado', $id_empleado);
    oci_bind_by_name($stid_update, ':nombre_empleado', $nombre_empleado);
    oci_bind_by_name($stid_update, ':apellido_empleado', $apellido_empleado);
    oci_bind_by_name($stid_update, ':cargo_empleado', $cargo_empleado);
    oci_bind_by_name($stid_update, ':fecha_contratacion', $fecha_contratacion);
    oci_bind_by_name($stid_update, ':salario', $salario);

    // Ejecutar el procedimiento
    $r_update = oci_execute($stid_update);

    if ($r_update) {
        echo "<p>Empleado actualizado correctamente.</p>";
        // Redirigir de nuevo a la tabla de empleados
        header('Location: Tabla_Empleados.php');
        exit();
    } else {
        $e = oci_error($stid_update);
        echo "<p>Error al actualizar el empleado: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid_update);
    oci_close($conn);
} else {
    echo "<p>No se enviaron datos válidos para actualizar.</p>";
    exit();
}
?>