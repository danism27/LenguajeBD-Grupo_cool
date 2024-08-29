<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['tipo_contacto']) && isset($_GET['cod_contacto']) && isset($_GET['nombre_contacto']) &&
    isset($_GET['direccion_contacto']) && isset($_GET['telefono_contacto']) && isset($_GET['email_contacto'])) {

    $tipo_contacto = $_GET['tipo_contacto'];
    $cod_contacto = $_GET['cod_contacto'];
    $nombre_contacto = $_GET['nombre_contacto'];
    $direccion_contacto = $_GET['direccion_contacto'];
    $telefono_contacto = $_GET['telefono_contacto'];
    $email_contacto = $_GET['email_contacto'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = 'BEGIN insert_contacto(:tipo_contacto, :cod_contacto, :nombre_contacto, :direccion_contacto, :telefono_contacto, :email_contacto); END;';
    $stid = oci_parse($conn, $sql);

    // Bind de los parámetros
    oci_bind_by_name($stid, ':tipo_contacto', $tipo_contacto);
    oci_bind_by_name($stid, ':cod_contacto', $cod_contacto);
    oci_bind_by_name($stid, ':nombre_contacto', $nombre_contacto);
    oci_bind_by_name($stid, ':direccion_contacto', $direccion_contacto);
    oci_bind_by_name($stid, ':telefono_contacto', $telefono_contacto);
    oci_bind_by_name($stid, ':email_contacto', $email_contacto);

    // Ejecutar el procedimiento
    $r = oci_execute($stid);

    if ($r) {
        // Redirigir a la página de contactos después de la inserción exitosa
        header('Location: Tabla_Contactos.php');
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        $e = oci_error($stid);
        echo "<p>Error al crear el contacto: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    // Liberar el recurso y cerrar la conexión
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionaron datos válidos para crear el contacto.</p>";
}
?>