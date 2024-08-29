<?php
include '../DAL/conexion.php';

// Verificar que se hayan enviado los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_empleado = $_POST['id_empleado'];
    $nuevo_salario = $_POST['nuevo_salario'];

    // Establecer la conexión
    try {
        $conexion = Conecta();
    } catch (PDOException $e) {
        echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
        exit();
    }

    // Definir la sentencia SQL para actualizar el salario del empleado
    $sql_update_salario = "
    UPDATE EMPLEADOS 
    SET SALARIO = :nuevo_salario 
    WHERE ID_EMPLEADO = :id_empleado";
    
    // Preparar la consulta
    $stmt_update_salario = $conexion->prepare($sql_update_salario);
    $stmt_update_salario->bindParam(':nuevo_salario', $nuevo_salario);
    $stmt_update_salario->bindParam(':id_empleado', $id_empleado);

    try {
        // Ejecutar la consulta
        $stmt_update_salario->execute();
        //echo "<div class='success'>Salario actualizado exitosamente.</div>";
    } catch (PDOException $e) {
        // Capturar y mostrar el error del TRIGGER
        echo "<div class='error'>Error al actualizar el salario: " . $e->getMessage() . "</div>";
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
    <title>Actualizar Salario del Empleado</title>
    <style>
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

        .success {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            text-align: center;
        }

        .error {
            background-color: #f44336;
            color: white;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Actualizar Salario</h1>
        <form method="POST" action="">
            <label for="id_empleado">ID del Empleado:</label>
            <input type="text" id="id_empleado" name="id_empleado" required>

            <label for="nuevo_salario">Nuevo Salario:</label>
            <input type="number" id="nuevo_salario" name="nuevo_salario" min="2000" required>

            <input type="submit" value="Actualizar Salario">
        </form>
    </div>
</body>
</html>