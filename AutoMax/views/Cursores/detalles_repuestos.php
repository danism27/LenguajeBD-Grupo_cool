<?php
include '../DAL/conexion.php';

try {
    // Establecer la conexión
    $conexion = Conecta();
} catch (PDOException $e) {
    echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
    exit();
}

try {
    // Preparar la consulta que simula el cursor
    $sql_repuestos_detalle = "
        SELECT r.ID_REPUESTO, r.NOMBRE_REPUESTO, d.CANTIDAD
        FROM REPUESTOS r
        JOIN DETALLE_FACTURA d ON r.ID_REPUESTO = d.COD_REPUESTO";
    
    $stmt = $conexion->prepare($sql_repuestos_detalle);

    // Ejecutar la consulta
    $stmt->execute();

    // Recorrer los resultados como lo haría un cursor en PL/SQL
    echo "<div class='container'>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<div class='repuesto'>
            Repuesto ID: " . $row['ID_REPUESTO'] . " - Nombre: " . $row['NOMBRE_REPUESTO'] . " - Cantidad: " . $row['CANTIDAD'] . "
        </div>";
    }
    echo "</div>";

    echo "<div class='success'>Datos de repuestos obtenidos exitosamente.</div>";
    
} catch (PDOException $e) {
    echo "<div class='error'>Error al procesar los datos: " . $e->getMessage() . "</div>";
}

// Desconectar
Desconectar($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de Repuestos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b); /* Fondo degradado */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Fondo semi-transparente */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra más suave */
            width: 400px;
            text-align: center;
        }
        h1 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333; /* Color del título */
        }
        .repuesto {
            background-color: #f8f9fa; /* Fondo gris claro */
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            text-align: left;
        }
        .success, .error {
            padding: 15px;
            margin-top: 20px;
            border-radius: 8px;
            font-size: 1.1em;
        }
        .success {
            background-color: #28a745; /* Verde para éxito */
            color: white;
        }
        .error {
            background-color: #dc3545; /* Rojo para error */
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Detalles de Repuestos</h1>
    </div>
</body>
</html>