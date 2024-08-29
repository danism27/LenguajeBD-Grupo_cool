<?php
if (isset($_GET['id_servicio']) && isset($_GET['cod_servicio']) && isset($_GET['nombre_servicio']) && isset($_GET['descripcion_servicio']) && isset($_GET['precio_servicio'])) {
    $id_servicio = $_GET['id_servicio'];
    $cod_servicio = $_GET['cod_servicio'];
    $nombre_servicio = $_GET['nombre_servicio'];
    $descripcion_servicio = $_GET['descripcion_servicio'];
    $precio_servicio = $_GET['precio_servicio'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la consulta para actualizar el servicio
    $sql = 'BEGIN update_servicio(:id_servicio, :cod_servicio, :nombre_servicio, :descripcion_servicio, :precio_servicio); END;';
    $stid = oci_parse($conn, $sql);
    
    // Enlazar las variables a los parámetros de la consulta
    oci_bind_by_name($stid, ':id_servicio', $id_servicio);
    oci_bind_by_name($stid, ':cod_servicio', $cod_servicio);
    oci_bind_by_name($stid, ':nombre_servicio', $nombre_servicio);
    oci_bind_by_name($stid, ':descripcion_servicio', $descripcion_servicio);
    oci_bind_by_name($stid, ':precio_servicio', $precio_servicio);
    
    // Ejecutar la consulta
    $r = oci_execute($stid);
    if (!$r) {
        $e = oci_error($stid);
        echo "<p>Error al actualizar el servicio: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    oci_free_statement($stid);
    oci_close($conn);
    
    // Redirigir a la página Tabla_Servicio.php
    header("Location: Tabla_Servicio.php");
    exit;
} else {
    echo "<p>Datos del servicio no proporcionados.</p>";
}
?>
