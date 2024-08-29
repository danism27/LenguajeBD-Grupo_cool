<?php
// Conectar a la base de datos
$conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
if (!$conn) {
    $e = oci_error();
    echo "<p>Error al conectar a la base de datos: " . htmlentities($e['message'], ENT_QUOTES) . "</p>";
    exit;
}

$employees = [];
$jobs = [];

// Obtener la lista de cargos
$job_sql = 'SELECT DISTINCT CARGO_EMPLEADO FROM EMPLEADOS ORDER BY CARGO_EMPLEADO';
$job_stid = oci_parse($conn, $job_sql);
oci_execute($job_stid);
while (($row = oci_fetch_assoc($job_stid)) !== false) {
    $jobs[] = $row['CARGO_EMPLEADO'];
}
oci_free_statement($job_stid);

// Obtener empleados por cargo si se ha enviado el formulario
if (isset($_POST['cargo'])) {
    $cargo = $_POST['cargo'];

    // Preparar y ejecutar el bloque PL/SQL para obtener los empleados por cargo
    $sql = 'BEGIN :cursor := listar_empleados_por_cargo(:cargo); END;';
    $stid = oci_parse($conn, $sql);
    
    // Crear un cursor
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ':cargo', $cargo);
    oci_bind_by_name($stid, ':cursor', $cursor, -1, OCI_B_CURSOR);
    
    // Ejecutar el bloque PL/SQL
    oci_execute($stid);
    
    // Ejecutar el cursor
    oci_execute($cursor);
    
    // Fetch all rows from the cursor
    while (($row = oci_fetch_assoc($cursor)) !== false) {
        $employees[] = $row;
    }

    // Libera los recursos
    oci_free_statement($stid);
    oci_free_statement($cursor);
}

oci_close($conn);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Lista de Empleados por Cargo</title>
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
        <h1 class="text-center">Lista de Empleados por Cargo</h1>

        <!-- Formulario para seleccionar el cargo -->
        <form method="POST" action="listar_empleados_por_cargo.php">
            <div class="mb-3">
                <label for="cargo" class="form-label">Selecciona un Cargo</label>
                <select class="form-control" id="cargo" name="cargo" required>
                    <option value="">Selecciona un cargo</option>
                    <?php foreach ($jobs as $job): ?>
                        <option value="<?php echo htmlentities($job, ENT_QUOTES); ?>">
                            <?php echo htmlentities($job, ENT_QUOTES); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>

        <br>

        <?php if (!empty($employees)): ?>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Salario</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($employees as $employee): ?>
                        <tr>
                            <td><?php echo htmlentities($employee['NOMBRE_EMPLEADO'], ENT_QUOTES); ?></td>
                            <td><?php echo htmlentities($employee['APELLIDO_EMPLEADO'], ENT_QUOTES); ?></td>
                            <td><?php echo htmlentities($employee['SALARIO'], ENT_QUOTES); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php elseif ($_SERVER['REQUEST_METHOD'] == 'POST'): ?>
            <p>No se encontraron empleados con el cargo proporcionado.</p>
        <?php endif; ?>
        
        <br>
        <a class="btn btn-secondary" href="/LenguajeBD-Grupo_cool3/AutoMax/views/tablas.php">Volver</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark" style="color: white; background-color: #000000;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados,
                        alquiler de autos y venta de repuestos.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Redes Sociales</h3>
                    <p><i class="fa fa-facebook" aria-hidden="true"></i> Autos Max</p>
                    <p><i class="fa fa-instagram" aria-hidden="true"></i> Autos Max</p>
                    <p><i class="fa fa-twitter" aria-hidden="true"></i> Autos Max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Teléfono: 809-555-5555</p>
                    <p><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Correo: AutosMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
    </div>
</footer>

</html>
