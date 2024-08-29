<?php
include '../DAL/conexion.php';

// Verificar que se hayan enviado los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $num_placa = $_POST['num_placa'];
    $tipo_vehiculo = $_POST['tipo_vehiculo'];
    $estado_vehiculo = $_POST['estado_vehiculo'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $fecha_registro = date('Y-m-d'); // Fecha actual
    $nombre_usuario = $_POST['nombre_usuario'];

    // Validación básica de los datos
    if (empty($num_placa) || empty($tipo_vehiculo) || empty($estado_vehiculo) || empty($marca) || empty($modelo) || empty($nombre_usuario)) {
        $message = "<div class='error'>Por favor, complete todos los campos.</div>";
    } else {
        // Establecer la conexión
        try {
            $conexion = Conecta();
        } catch (PDOException $e) {
            echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
            exit();
        }

        // Definir la sentencia SQL para insertar un nuevo vehículo
        $sql_insert_vehiculo = "
        INSERT INTO VEHICULOS (NUM_PLACA, TIPO_VEHICULO, ESTADO_VEHICULO, MARCA, MODELO, FECHA_REGISTRO, NOMBRE_USUARIO) 
        VALUES (:num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, TO_DATE(:fecha_registro, 'YYYY-MM-DD'), :nombre_usuario)";
        
        // Preparar la consulta
        $stmt_insert_vehiculo = $conexion->prepare($sql_insert_vehiculo);
        $stmt_insert_vehiculo->bindParam(':num_placa', $num_placa);
        $stmt_insert_vehiculo->bindParam(':tipo_vehiculo', $tipo_vehiculo);
        $stmt_insert_vehiculo->bindParam(':estado_vehiculo', $estado_vehiculo);
        $stmt_insert_vehiculo->bindParam(':marca', $marca);
        $stmt_insert_vehiculo->bindParam(':modelo', $modelo);
        $stmt_insert_vehiculo->bindParam(':fecha_registro', $fecha_registro);
        $stmt_insert_vehiculo->bindParam(':nombre_usuario', $nombre_usuario);

        try {
            // Ejecutar la consulta
            $stmt_insert_vehiculo->execute();
            $message = "<div class='success'>Vehículo insertado exitosamente.</div>";
            $message .= "<div class='info'>Detalles del vehículo insertado: Placa=" . htmlspecialchars($num_placa) . 
                ", Tipo=" . htmlspecialchars($tipo_vehiculo) . 
                ", Estado=" . htmlspecialchars($estado_vehiculo) . 
                ", Marca=" . htmlspecialchars($marca) . 
                ", Modelo=" . htmlspecialchars($modelo) . 
                ", Fecha de Registro=" . htmlspecialchars($fecha_registro) . 
                ", Usuario=" . htmlspecialchars($nombre_usuario) . ".</div>";
        } catch (PDOException $e) {
            // Capturar y mostrar el error
            $message = "<div class='error'>Error al insertar el vehículo: " . $e->getMessage() . "</div>";
        }

        // Desconectar
        Desconectar($conexion);
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar Vehículo</title>
    <style>
        /* Estilos CSS */
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
        <h1>Insertar Vehículo</h1>
        <form method="POST" action="">
            <label for="num_placa">Número de Placa:</label>
            <input type="text" id="num_placa" name="num_placa" required>

            <label for="tipo_vehiculo">Tipo de Vehículo:</label>
            <input type="text" id="tipo_vehiculo" name="tipo_vehiculo" required>

            <label for="estado_vehiculo">Estado del Vehículo:</label>
            <input type="text" id="estado_vehiculo" name="estado_vehiculo" required>

            <label for="marca">Marca:</label>
            <input type="text" id="marca" name="marca" required>

            <label for="modelo">Modelo:</label>
            <input type="text" id="modelo" name="modelo" required>

            <label for="nombre_usuario">Nombre de Usuario:</label>
            <input type="text" id="nombre_usuario" name="nombre_usuario" required>

            <input type="submit" value="Insertar Vehículo">
        </form>
        <?php
        if (isset($message)) {
            echo $message;
        }
        ?>
    </div>
</body>
</html>