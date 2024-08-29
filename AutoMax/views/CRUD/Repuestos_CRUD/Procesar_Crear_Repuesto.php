<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $cod_repuesto = $_POST['cod_repuesto'];
    $nombre_repuesto = $_POST['nombre_repuesto'];
    $fecha_registro = $_POST['fecha_registro'];
    $nombre_usuario = $_POST['nombre_usuario'];
    $precio_repuesto = $_POST['precio_repuesto'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar y ejecutar el procedimiento almacenado para crear un repuesto
    $stid = oci_parse($conn, 'BEGIN insert_repuesto(:p_cod_repuesto, :p_nombre_repuesto, TO_DATE(:p_fecha_registro, \'YYYY-MM-DD\'), :p_nombre_usuario, :p_precio_repuesto); END;');
    oci_bind_by_name($stid, ':p_cod_repuesto', $cod_repuesto);
    oci_bind_by_name($stid, ':p_nombre_repuesto', $nombre_repuesto);
    oci_bind_by_name($stid, ':p_fecha_registro', $fecha_registro);
    oci_bind_by_name($stid, ':p_nombre_usuario', $nombre_usuario);
    oci_bind_by_name($stid, ':p_precio_repuesto', $precio_repuesto);

    // Ejecutar el procedimiento
    if (oci_execute($stid)) {
        echo "<p>Repuesto creado exitosamente</p>";
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear el repuesto: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar recursos y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);

    // Redirigir a la página de tabla de repuestos
    header("Location: Tabla_Repuesto.php");
    exit;
} else {
    echo "<p>Método no permitido</p>";
}
?>
