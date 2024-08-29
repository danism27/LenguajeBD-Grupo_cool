<?php
include '../DAL/conexion.php';

// Verificar que se hayan enviado los datos del formulario
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $tipo_contacto = $_POST['tipo_contacto'];
    $cod_contacto = $_POST['cod_contacto'];
    $nombre_contacto = $_POST['nombre_contacto'];
    $direccion_contacto = $_POST['direccion_contacto'];
    $telefono_contacto = $_POST['telefono_contacto'];
    $email_contacto = $_POST['email_contacto'];

    // Validación básica de los datos
    if (empty($tipo_contacto) || empty($cod_contacto) || empty($nombre_contacto)) {
        $message = "<div class='error'>Por favor, complete todos los campos obligatorios.</div>";
    } else {
        // Establecer la conexión
        try {
            $conexion = Conecta();
        } catch (PDOException $e) {
            echo "<div class='error'>Error de conexión: " . $e->getMessage() . "</div>";
            exit();
        }

        // Definir la sentencia SQL para insertar un nuevo contacto
        $sql_insert_contacto = "
        INSERT INTO CONTACTOS (TIPO_CONTACTO, COD_CONTACTO, NOMBRE_CONTACTO, DIRECCION_CONTACTO, TELEFONO_CONTACTO, EMAIL_CONTACTO) 
        VALUES (:tipo_contacto, :cod_contacto, :nombre_contacto, :direccion_contacto, :telefono_contacto, :email_contacto)";
        
        // Preparar la consulta
        $stmt_insert_contacto = $conexion->prepare($sql_insert_contacto);
        $stmt_insert_contacto->bindParam(':tipo_contacto', $tipo_contacto);
        $stmt_insert_contacto->bindParam(':cod_contacto', $cod_contacto);
        $stmt_insert_contacto->bindParam(':nombre_contacto', $nombre_contacto);
        $stmt_insert_contacto->bindParam(':direccion_contacto', $direccion_contacto);
        $stmt_insert_contacto->bindParam(':telefono_contacto', $telefono_contacto);
        $stmt_insert_contacto->bindParam(':email_contacto', $email_contacto);

        try {
            // Ejecutar la consulta
            $stmt_insert_contacto->execute();
            $message = "<div class='success'>Contacto insertado exitosamente.</div>";
            $message .= "<div class='info'>Detalles del contacto insertado: Tipo=" . htmlspecialchars($tipo_contacto) . 
                ", Código=" . htmlspecialchars($cod_contacto) . 
                ", Nombre=" . htmlspecialchars($nombre_contacto) . 
                ", Dirección=" . htmlspecialchars($direccion_contacto) . 
                ", Teléfono=" . htmlspecialchars($telefono_contacto) . 
                ", Email=" . htmlspecialchars($email_contacto) . ".</div>";
        } catch (PDOException $e) {
            // Capturar y mostrar el error
            $message = "<div class='error'>Error al insertar el contacto: " . $e->getMessage() . "</div>";
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
    <title>Insertar Contacto</title>
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

        input[type="text"], input[type="email"] {
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
        <h1>Insertar Contacto</h1>
        <form method="POST" action="">
            <label for="tipo_contacto">Tipo de Contacto:</label>
            <input type="text" id="tipo_contacto" name="tipo_contacto" required>

            <label for="cod_contacto">Código del Contacto:</label>
            <input type="text" id="cod_contacto" name="cod_contacto" required>

            <label for="nombre_contacto">Nombre del Contacto:</label>
            <input type="text" id="nombre_contacto" name="nombre_contacto" required>

            <label for="direccion_contacto">Dirección del Contacto:</label>
            <input type="text" id="direccion_contacto" name="direccion_contacto">

            <label for="telefono_contacto">Teléfono del Contacto:</label>
            <input type="text" id="telefono_contacto" name="telefono_contacto">

            <label for="email_contacto">Email del Contacto:</label>
            <input type="email" id="email_contacto" name="email_contacto">

            <input type="submit" value="Insertar Contacto">
        </form>

        <?php if (isset($message)) echo $message; ?>
    </div>
</body>
</html>