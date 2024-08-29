<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Factura</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container">
        <h1 class="text-center">Crear Factura</h1>
        <form action="Procesar_Crear_Factura.php" method="POST">
            <div class="form-group">
                <label for="cod_factura">Código Factura:</label>
                <input type="text" class="form-control" id="cod_factura" name="cod_factura" required>
            </div>
            <div class="form-group">
                <label for="cod_cliente">Código Cliente:</label>
                <input type="text" class="form-control" id="cod_cliente" name="cod_cliente" required>
            </div>
            <div class="form-group">
                <label for="fecha_factura">Fecha Factura:</label>
                <input type="date" class="form-control" id="fecha_factura" name="fecha_factura" required>
            </div>
            <div class="form-group">
                <label for="total_factura">Total Factura:</label>
                <input type="number" class="form-control" id="total_factura" name="total_factura" required>
            </div>
            <button type="submit" class="btn btn-primary">Crear Factura</button>
        </form>
    </div>
</body>

</html>