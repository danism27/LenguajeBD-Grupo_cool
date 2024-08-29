<?php
// Crear_Repuesto.php
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Repuesto</title>
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
        <h1 class="text-center">Crear Repuesto</h1>
        <form action="Procesar_Crear_Repuesto.php" method="POST">
            <div class="form-group">
                <label for="cod_repuesto">Código Repuesto:</label>
                <input type="number" class="form-control" id="cod_repuesto" name="cod_repuesto" required>
            </div>
            <div class="form-group">
                <label for="nombre_repuesto">Nombre Repuesto:</label>
                <input type="text" class="form-control" id="nombre_repuesto" name="nombre_repuesto" required>
            </div>
            <div class="form-group">
                <label for="fecha_registro">Fecha Registro:</label>
                <input type="date" class="form-control" id="fecha_registro" name="fecha_registro" required>
            </div>
            <div class="form-group">
                <label for="nombre_usuario">Nombre Usuario:</label>
                <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario">
            </div>
            <div class="form-group">
                <label for="precio_repuesto">Precio Repuesto:</label>
                <input type="number" class="form-control" id="precio_repuesto" name="precio_repuesto" step="0.01" required>
            </div>
            <button type="submit" class="btn btn-primary">Crear</button>
        </form>
    </div>
</body>
</html>
