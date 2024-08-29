<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id'])) {
    $id_vehiculo = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Obtener los datos actuales del vehículo
    $sql = 'BEGIN get_vehiculo(:id_vehiculo, :num_placa, :tipo_vehiculo, :estado_vehiculo, :marca, :modelo, :fecha_registro, :nombre_usuario); END;';
    $stid = oci_parse($conn, $sql);
    oci_bind_by_name($stid, ':id_vehiculo', $id_vehiculo);
    oci_bind_by_name($stid, ':num_placa', $num_placa, 100);
    oci_bind_by_name($stid, ':tipo_vehiculo', $tipo_vehiculo, 100);
    oci_bind_by_name($stid, ':estado_vehiculo', $estado_vehiculo, 100);
    oci_bind_by_name($stid, ':marca', $marca, 100);
    oci_bind_by_name($stid, ':modelo', $modelo, 100);
    oci_bind_by_name($stid, ':fecha_registro', $fecha_registro, 50);
    oci_bind_by_name($stid, ':nombre_usuario', $nombre_usuario, 100);
    oci_execute($stid);
    oci_free_statement($stid);

    // Llamar al procedimiento contar_repuestos
    $sql_contar = 'BEGIN contar_repuestos; END;';
    $stid_contar = oci_parse($conn, $sql_contar);
    oci_execute($stid_contar);
    oci_free_statement($stid_contar);

    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de vehículo en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Actualizar Vehículo - Paso 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
    <link rel="icon" href="logo2.png" type="image/x-icon" />
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
