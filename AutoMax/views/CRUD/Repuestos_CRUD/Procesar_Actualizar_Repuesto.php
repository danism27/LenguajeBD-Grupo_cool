<?php
// Procesar_Actualizar_Repuesto.php

// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

// Obtener datos del formulario
$id_repuesto = isset($_POST['id_repuesto']) ? intval($_POST['id_repuesto']) : 0;
$cod_repuesto = isset($_POST['cod_repuesto']) ? $_POST['cod_repuesto'] : '';
$nombre_repuesto = isset($_POST['nombre_repuesto']) ? $_POST['nombre_repuesto'] : '';
$fecha_registro = isset($_POST['fecha_registro']) ? $_POST['fecha_registro'] : '';
$nombre_usuario = isset($_POST['nombre_usuario']) ? $_POST['nombre_usuario'] : '';
$precio_repuesto = isset($_POST['precio_repuesto']) ? $_POST['precio_repuesto'] : 0;

// Verificar si el ID es válido y proceder con la actualización
if ($id_repuesto > 0) {
    // Preparar la llamada al procedimiento almacenado
    $stid = oci_parse($conn, 'BEGIN update_repuesto(:id, :cod, :nombre, TO_DATE(:fecha, \'YYYY-MM-DD\'), :usuario, :precio); END;');
    
    // Enlazar los parámetros
    oci_bind_by_name($stid, ':id', $id_repuesto);
    oci_bind_by_name($stid, ':cod', $cod_repuesto);
    oci_bind_by_name($stid, ':nombre', $nombre_repuesto);
    oci_bind_by_name($stid, ':fecha', $fecha_registro);
    oci_bind_by_name($stid, ':usuario', $nombre_usuario);
    oci_bind_by_name($stid, ':precio', $precio_repuesto);

    // Ejecutar el procedimiento almacenado
    if (oci_execute($stid)) {
        // Redirigir a la tabla de repuestos en caso de éxito
        header('Location: Tabla_Repuesto.php');
        exit;
    } else {
        // Mostrar el error en caso de fallo
        $e = oci_error($stid);
        echo "<p>Error al actualizar el repuesto: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar recursos
    oci_free_statement($stid);
} else {
    echo "<p>ID de repuesto no válido</p>";
}

// Cerrar conexión
oci_close($conn);
?>
