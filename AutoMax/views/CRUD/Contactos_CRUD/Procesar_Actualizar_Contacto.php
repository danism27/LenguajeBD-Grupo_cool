<?php
// Verificar si los datos fueron enviados desde el formulario
if (isset($_GET['id_contacto']) && isset($_GET['tipo_contacto']) && isset($_GET['cod_contacto']) &&
    isset($_GET['nombre_contacto']) && isset($_GET['direccion_contacto']) &&
    isset($_GET['telefono_contacto']) && isset($_GET['email_contacto'])) {

    $id_contacto = $_GET['id_contacto'];
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
        exit();
    }

    // Preparar la llamada al procedimiento almacenado de actualización
    $sql_update = 'BEGIN update_contacto(:id_contacto, :tipo_contacto, :cod_contacto, :nombre_contacto, :direccion_contacto, :telefono_contacto, :email_contacto); END;';
    $stid_update = oci_parse($conn, $sql_update);

    // Vincular las variables con los parámetros del procedimiento
    oci_bind_by_name($stid_update, ':id_contacto', $id_contacto);
    oci_bind_by_name($stid_update, ':tipo_contacto', $tipo_contacto);
    oci_bind_by_name($stid_update, ':cod_contacto', $cod_contacto);
    oci_bind_by_name($stid_update, ':nombre_contacto', $nombre_contacto);
    oci_bind_by_name($stid_update, ':direccion_contacto', $direccion_contacto);
    oci_bind_by_name($stid_update, ':telefono_contacto', $telefono_contacto);
    oci_bind_by_name($stid_update, ':email_contacto', $email_contacto);

    // Ejecutar el procedimiento
    $r_update = oci_execute($stid_update);

    if ($r_update) {
        echo "<p>Contacto actualizado correctamente.</p>";
        // Redirigir de nuevo a la tabla de contactos
        header('Location: Tabla_Contactos.php');
        exit();
    } else {
        $e = oci_error($stid_update);
        echo "<p>Error al actualizar el contacto: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    }

    oci_free_statement($stid_update);
    oci_close($conn);
} else {
    echo "<p>No se enviaron datos válidos para actualizar.</p>";
    exit();
}
?>