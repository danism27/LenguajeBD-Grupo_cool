<?php
include '../DAL/conexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        // Establecer la conexión
        $conexion = Conecta();
    } catch (PDOException $e) {
        echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
        exit();
    }

    try {
        // Preparar la consulta que simula el cursor
        $sql_facturas_detalle = "
            SELECT f.ID_FACTURA, f.FECHA_FACTURA, f.TOTAL_FACTURA, d.COD_REPUESTO, d.CANTIDAD
            FROM FACTURAS f
            JOIN DETALLE_FACTURA d ON f.ID_FACTURA = d.COD_FACTURA";
        
        $stmt = $conexion->prepare($sql_facturas_detalle);

        // Ejecutar la consulta
        $stmt->execute();

        // Recorrer los resultados como lo haría un cursor en PL/SQL
        echo "<div class='container'>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<div class='factura-detalle'>
                Factura ID: " . $row['ID_FACTURA'] . " - Fecha: " . $row['FECHA_FACTURA'] . " - Total: " . $row['TOTAL_FACTURA'] . " - Repuesto: " . $row['COD_REPUESTO'] . " - Cantidad: " . $row['CANTIDAD'] . "
            </div>";
        }
        echo "</div>";

        echo "<div class='success'>Datos de facturas y detalles procesados exitosamente.</div>";
        
    } catch (PDOException $e) {
        echo "<div class='error'>Error al procesar los datos: " . $e->getMessage() . "</div>";
    }

    // Desconectar
    Desconectar($conexion);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Facturas y Detalles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Fondo degradado */
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.1); /* Fondo semi-transparente */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra más suave */
            width: 350px;
            text-align: center;
        }
        h1 {
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #fff; /* Color del título */
        }
        .factura-detalle {
            background-color: rgba(255, 255, 255, 0.2); /* Fondo gris claro */
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            text-align: left;
        }
        .button {
            background-color: #007bff; /* Azul para el botón */
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2em;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #0056b3; /* Azul más oscuro al pasar el ratón */
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
        <h1>Procesar Facturas y Detalles</h1>
        <form method="POST" action="">
            <input type="submit" class="button" value="Procesar Información">
        </form>
    </div>
</body>
</html>