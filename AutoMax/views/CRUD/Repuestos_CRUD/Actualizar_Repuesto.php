<?php
// Actualizar_Repuesto.php

// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Inicializar variables
$cod_repuesto = '';
$nombre_repuesto = '';
$fecha_registro = '';
$nombre_usuario = '';
$precio_repuesto = 0;

// Verificar si se ha proporcionado un ID válido
if ($id > 0) {
    $stid = oci_parse($conn, 'BEGIN get_repuesto(:id, :cod, :nombre, :fecha, :usuario, :precio); END;');
    
    // Asegurarse de que los parámetros de salida tienen tamaños suficientes
    oci_bind_by_name($stid, ':id', $id);
    oci_bind_by_name($stid, ':cod', $cod_repuesto, 10);  // Tamaño ajustado a 10
    oci_bind_by_name($stid, ':nombre', $nombre_repuesto, 100);
    oci_bind_by_name($stid, ':fecha', $fecha_registro, 20); // Asegurarse de que el tamaño es suficiente para la fecha
    oci_bind_by_name($stid, ':usuario', $nombre_usuario, 100);
    oci_bind_by_name($stid, ':precio', $precio_repuesto, 10); // Tamaño ajustado para el precio

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
    <title>Actualizar Repuesto</title>
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
        <h1 class="text-center">Actualizar Repuesto</h1>
        <form action="Procesar_Actualizar_Repuesto.php" method="POST">
            <input type="hidden" name="id_repuesto" value="<?php echo htmlspecialchars($id); ?>">
            <div class="form-group">
                <label for="cod_repuesto">Código Repuesto:</label>
                <input type="number" class="form-control" id="cod_repuesto" name="cod_repuesto" value="<?php echo htmlspecialchars($cod_repuesto); ?>" required>
            </div>
            <div class="form-group">
                <label for="nombre_repuesto">Nombre Repuesto:</label>
                <input type="text" class="form-control" id="nombre_repuesto" name="nombre_repuesto" value="<?php echo htmlspecialchars($nombre_repuesto); ?>" required>
            </div>
            <div class="form-group">
                <label for="fecha_registro">Fecha Registro:</label>
                <input type="date" class="form-control" id="fecha_registro" name="fecha_registro" value="<?php echo htmlspecialchars($fecha_registro); ?>" required>
            </div>
            <div class="form-group">
                <label for="nombre_usuario">Nombre Usuario:</label>
                <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" value="<?php echo htmlspecialchars($nombre_usuario); ?>">
            </div>
            <div class="form-group">
                <label for="precio_repuesto">Precio Repuesto:</label>
                <input type="number" class="form-control" id="precio_repuesto" name="precio_repuesto" value="<?php echo htmlspecialchars($precio_repuesto); ?>" step="0.01" required>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
    </div>
</body>
</html>
