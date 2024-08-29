<?php
// Verificar si se ha proporcionado un ID en la URL
if (isset($_GET['id'])) {
    $id_contacto = $_GET['id'];

    // Conectar a la base de datos
    $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
    if (!$conn) {
        $e = oci_error();
        echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
        exit;
    }

    // Preparar y ejecutar el bloque PL/SQL para obtener el nombre del contacto
    $sql = 'BEGIN :nombre_contacto := obtener_nombre_contacto(:id_contacto); END;';
    $stid = oci_parse($conn, $sql);
    
    // Bind variables
    $nombre_contacto = null;
    oci_bind_by_name($stid, ':id_contacto', $id_contacto);
    oci_bind_by_name($stid, ':nombre_contacto', $nombre_contacto, 100);  // Adjust size to match function definition
    
    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    
    // Libera los recursos
    oci_free_statement($stid);
    oci_close($conn);
} else {
    echo "<p>No se proporcionó un ID de contacto en la URL.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Detalles del Contacto</title>
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
                data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                aria-label="Toggle navigation"></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="/Automax/index.php">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Automax/views/tablas.php">Ver tablas</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <br><br><br><br><br>

    <div class="container">
        <h1 class="text-center">Detalles del Contacto</h1>
        
        <div class="alert alert-info">
            <h4>Nombre del Contacto:</h4>
            <p><?php echo htmlentities($nombre_contacto, ENT_QUOTES); ?></p>
        </div>
        
        <br>
        <a class="btn btn-secondary" href="index.php">Volver</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
