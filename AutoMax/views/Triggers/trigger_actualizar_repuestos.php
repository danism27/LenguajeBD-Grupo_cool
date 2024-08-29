<?php
include '../DAL/conexion.php';

// Verificar que se hayan enviado los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cod_repuesto = $_POST['cod_repuesto'];
    $nuevo_precio = $_POST['nuevo_precio'];

    // Establecer la conexión
    try {
        $conexion = Conecta();
    } catch (PDOException $e) {
        echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
        exit();
    }

    // Obtener el precio actual del repuesto
    $sql_get_precio_actual = "
    SELECT PRECIO_REPUESTO 
    FROM REPUESTOS 
    WHERE COD_REPUESTO = :cod_repuesto";
    
    $stmt_get_precio_actual = $conexion->prepare($sql_get_precio_actual);
    $stmt_get_precio_actual->bindParam(':cod_repuesto', $cod_repuesto);

    try {
        $stmt_get_precio_actual->execute();
        $precio_actual = $stmt_get_precio_actual->fetchColumn();
        
        if ($precio_actual === false) {
            echo "<div class='error'>Repuesto no encontrado.</div>";
        } else {
            // Verificar si el precio ha cambiado
            if ($precio_actual != $nuevo_precio) {
                // Definir la sentencia SQL para actualizar el precio del repuesto
                $sql_update_precio = "
                UPDATE REPUESTOS 
                SET PRECIO_REPUESTO = :nuevo_precio 
                WHERE COD_REPUESTO = :cod_repuesto";
                
                // Preparar la consulta
                $stmt_update_precio = $conexion->prepare($sql_update_precio);
                $stmt_update_precio->bindParam(':nuevo_precio', $nuevo_precio);
                $stmt_update_precio->bindParam(':cod_repuesto', $cod_repuesto);

                try {
                    // Ejecutar la consulta
                    $stmt_update_precio->execute();
                    echo "<div class='success'>Precio del repuesto actualizado exitosamente.</div>";
                    echo "<div class='info'>Precio cambiado: Código Repuesto=" . htmlspecialchars($cod_repuesto) . 
                        ", Antiguo Precio=" . htmlspecialchars($precio_actual) . 
                        ", Nuevo Precio=" . htmlspecialchars($nuevo_precio) . ".</div>";
                } catch (PDOException $e) {
                    // Capturar y mostrar el error
                    echo "<div class='error'>Error al actualizar el precio del repuesto: " . $e->getMessage() . "</div>";
                }
            } else {
                echo "<div class='info'>El precio del repuesto no ha cambiado. No se realizó ninguna actualización.</div>";
            }
        }
    } catch (PDOException $e) {
        echo "<div class='error'>Error al obtener el precio actual: " . $e->getMessage() . "</div>";
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
    <title>Actualizar Precio del Repuesto</title>
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

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
        <h1>Actualizar Precio del Repuesto</h1>
        <form method="POST" action="">
            <label for="cod_repuesto">Código del Repuesto:</label>
            <input type="text" id="cod_repuesto" name="cod_repuesto" required>

            <label for="nuevo_precio">Nuevo Precio:</label>
            <input type="number" id="nuevo_precio" name="nuevo_precio" min="1" required>

            <input type="submit" value="Actualizar Precio">
        </form>
    </div>
</body>
</html>