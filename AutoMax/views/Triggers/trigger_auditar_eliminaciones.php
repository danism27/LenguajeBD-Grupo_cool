<?php
include '../DAL/conexion.php';

// Verificar que se haya enviado el ID de la factura
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_factura = $_POST['id_factura'];

    // Establecer la conexión
    try {
        $conexion = Conecta();
    } catch (PDOException $e) {
        echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
        exit();
    }

    // Obtener los detalles de la factura antes de eliminarla
    $sql_get_factura = "
    SELECT ID_FACTURA, COD_FACTURA 
    FROM FACTURAS 
    WHERE ID_FACTURA = :id_factura";
    
    $stmt_get_factura = $conexion->prepare($sql_get_factura);
    $stmt_get_factura->bindParam(':id_factura', $id_factura);

    try {
        $stmt_get_factura->execute();
        $factura = $stmt_get_factura->fetch(PDO::FETCH_ASSOC);
        
        if ($factura === false) {
            echo "<div class='error'>Factura no encontrada.</div>";
        } else {
            // Definir la sentencia SQL para eliminar la factura
            $sql_delete_factura = "
            DELETE FROM FACTURAS 
            WHERE ID_FACTURA = :id_factura";
            
            // Preparar la consulta
            $stmt_delete_factura = $conexion->prepare($sql_delete_factura);
            $stmt_delete_factura->bindParam(':id_factura', $id_factura);

            try {
                // Ejecutar la eliminación
                $stmt_delete_factura->execute();
                echo "<div class='success'>Factura eliminada exitosamente.</div>";
                echo "<div class='info'>Detalles de la factura eliminada: ID=" . htmlspecialchars($factura['ID_FACTURA']) . 
                    ", Código=" . htmlspecialchars($factura['COD_FACTURA']) . ".</div>";
            } catch (PDOException $e) {
                // Capturar y mostrar el error
                echo "<div class='error'>Error al eliminar la factura: " . $e->getMessage() . "</div>";
            }
        }
    } catch (PDOException $e) {
        echo "<div class='error'>Error al obtener los detalles de la factura: " . $e->getMessage() . "</div>";
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
    <title>Eliminar Factura</title>
    <style>
        /* Aquí se mantendrán los estilos CSS proporcionados */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h1 {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #f44336;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #d32f2f;
        }

        .success, .info, .error {
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            text-align: center;
        }

        .success {
            background-color: #4CAF50;
            color: white;
        }

        .info {
            background-color: #2196F3;
            color: white;
        }

        .error {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Eliminar Factura</h1>
        <form method="POST" action="">
            <label for="id_factura">ID de la Factura:</label>
            <input type="text" id="id_factura" name="id_factura" required>

            <input type="submit" value="Eliminar Factura">
        </form>
    </div>
</body>
</html>