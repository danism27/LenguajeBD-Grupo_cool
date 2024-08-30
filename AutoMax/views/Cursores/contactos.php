<?php
include '../DAL/conexion.php';

$contactos = [];  // Array para almacenar los contactos

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
        $sql_contactos = "SELECT * FROM CONTACTOS";
        $stmt = $conexion->prepare($sql_contactos);

        // Ejecutar la consulta
        $stmt->execute();

        // Recorrer los resultados y almacenarlos en el array
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $contactos[] = $row;
        }

    } catch (PDOException $e) {
        echo "<div class='error'>Error al procesar los contactos: " . $e->getMessage() . "</div>";
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
    <title>Procesar Contactos</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #ffffff; /* Fondo blanco */
        color: #333; /* Color de texto más oscuro para mejor legibilidad */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: #f9f9f9; /* Fondo ligeramente gris para contraste */
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Sombra más suave */
        width: 350px;
        text-align: center;
    }
    h1 {
        font-size: 1.8em;
        margin-bottom: 20px;
        color: #333; /* Título en gris oscuro */
    }
    .contacto {
        background-color: #e0e0e0; /* Fondo gris claro para los contactos */
        padding: 10px;
        margin: 10px 0;
        border-radius: 8px;
        text-align: left;
    }
    .button {
        background-color: #007bff; /* Azul clásico para el botón */
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
        <h1>Procesar Contactos</h1>
        <form method="POST" action="">
            <button type="submit" class="button">Procesar Información</button>
        </form>

        <?php if (!empty($contactos)): ?>
            <div class="success">Contactos procesados exitosamente.</div>
            <?php foreach ($contactos as $contacto): ?>
                <div class="contacto">
                    ID: <?= htmlspecialchars($contacto['ID_CONTACTO']) ?><br>
                    Nombre: <?= htmlspecialchars($contacto['NOMBRE_CONTACTO']) ?>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</body>
</html>