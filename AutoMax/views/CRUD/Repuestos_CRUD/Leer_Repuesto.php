<?php
// Leer_Repuesto.php

// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

$id = isset($_GET['id_repuesto']) ? intval($_GET['id_repuesto']) : 0;

// Inicializar variables
$cod_repuesto = '';
$nombre_repuesto = '';
$fecha_registro = '';
$nombre_usuario = '';
$precio_repuesto = 0;

// Verificar si se ha proporcionado un ID válido
if ($id > 0) {
    $stid = oci_parse($conn, 'BEGIN get_repuesto(:id, :cod, :nombre, :fecha, :usuario, :precio); END;');
    oci_bind_by_name($stid, ':id', $id);
    oci_bind_by_name($stid, ':cod', $cod_repuesto, 20); // Tamaño adecuado para COD_REPUESTO
    oci_bind_by_name($stid, ':nombre', $nombre_repuesto, 100); // Tamaño adecuado para NOMBRE_REPUESTO
    oci_bind_by_name($stid, ':fecha', $fecha_registro, 20); // Tamaño adecuado para FECHA_REGISTRO
    oci_bind_by_name($stid, ':usuario', $nombre_usuario, 100); // Tamaño adecuado para NOMBRE_USUARIO
    oci_bind_by_name($stid, ':precio', $precio_repuesto, -1, SQLT_NUM); // Sin límite para PRECIO_REPUESTO

    // Ejecutar el procedimiento almacenado
    if (oci_execute($stid)) {
        // Procedimiento ejecutado correctamente
    } else {
        $e = oci_error($stid);
        echo "<p>Error al ejecutar la consulta: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        oci_free_statement($stid);
        oci_close($conn);
        exit;
    }

    // Liberar recursos
    oci_free_statement($stid);
} else {
    echo "<p>ID de repuesto no válido</p>";
    oci_close($conn);
    exit;
}

// Cerrar conexión
oci_close($conn);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leer Repuesto</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
        </nav>
        <br><br>
    </header>
    <div class="container">
        <h1 class="text-center">Detalles del Repuesto</h1>
        <table class="table table-bordered">
            <tr>
                <th>ID Repuesto</th>
                <td><?php echo htmlspecialchars($id); ?></td>
            </tr>
            <tr>
                <th>Código Repuesto</th>
                <td><?php echo htmlspecialchars($cod_repuesto); ?></td>
            </tr>
            <tr>
                <th>Nombre Repuesto</th>
                <td><?php echo htmlspecialchars($nombre_repuesto); ?></td>
            </tr>
            <tr>
                <th>Fecha Registro</th>
                <td><?php echo htmlspecialchars($fecha_registro); ?></td>
            </tr>
            <tr>
                <th>Nombre Usuario</th>
                <td><?php echo htmlspecialchars($nombre_usuario); ?></td>
            </tr>
            <tr>
                <th>Precio Repuesto</th>
                <td><?php echo htmlspecialchars($precio_repuesto); ?></td>
            </tr>
        </table>
        <a href="Tabla_Repuesto.php" class="btn btn-secondary">Volver</a>
    </div>
</body>
</html>
