<?php
// Verificar si se han proporcionado los datos en la URL
if (isset($_GET['nombre_empleado']) && isset($_GET['apellido_empleado']) &&
    isset($_GET['cargo_empleado']) && isset($_GET['fecha_contratacion']) && isset($_GET['salario'])) {

    // Obtener los datos de la URL
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
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN insert_empleado(:nombre_empleado, :apellido_empleado, :cargo_empleado, TO_DATE(:fecha_contratacion, \'YYYY-MM-DD\'), :salario); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stid, ':nombre_empleado', $nombre_empleado);
    oci_bind_by_name($stid, ':apellido_empleado', $apellido_empleado);
    oci_bind_by_name($stid, ':cargo_empleado', $cargo_empleado);
    oci_bind_by_name($stid, ':fecha_contratacion', $fecha_contratacion);
    oci_bind_by_name($stid, ':salario', $salario);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de empleados después de la inserción exitosa
        header('Location: Tabla_Empleados.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear el empleado: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionaron todos los datos necesarios en la URL.</p>";
}
?>