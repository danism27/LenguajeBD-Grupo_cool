<!DOCTYPE html>
<html lang="es">

<head>
    <title>Auto Max - Crear Vehículo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .logo {
            font-family: 'Fredoka One', cursive;
            font-family: 'Qwitcher Grypen', cursive;
            font-size: 60px;
            margin-right: 400px;
        }

        .nav-link {
            font-size: 20px;
            color: whitesmoke;
        }
    </style>
</head>

<body>
    <link rel="icon" href="logo2.png" type="image/x-icon" />
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
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
        <h1 class="text-center">Crear Nuevo Vehículo</h1>

        <!-- Formulario para crear un nuevo vehículo -->
        <form action="procesar_crear_vehiculo.php" method="GET">
            <div class="form-group">
                <label for="num_placa">Número de Placa:</label>
                <input type="text" class="form-control" id="num_placa" name="num_placa" required>
            </div>
            <div class="form-group">
                <label for="tipo_vehiculo">Tipo de Vehículo:</label>
                <input type="text" class="form-control" id="tipo_vehiculo" name="tipo_vehiculo" required>
            </div>
            <div class="form-group">
                <label for="estado_vehiculo">Estado del Vehículo:</label>
                <input type="text" class="form-control" id="estado_vehiculo" name="estado_vehiculo" required>
            </div>
            <div class="form-group">
                <label for="marca">Marca:</label>
                <input type="text" class="form-control" id="marca" name="marca" required>
            </div>
            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input type="text" class="form-control" id="modelo" name="modelo" required>
            </div>
            <div class="form-group">
                <label for="fecha_registro">Fecha de Registro:</label>
                <input type="date" class="form-control" id="fecha_registro" name="fecha_registro" required>
            </div>
            <div class="form-group">
                <label for="nombre_usuario">Nombre del Usuario:</label>
                <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-success">Crear Vehículo</button>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark " style="color: white; background-color: #000000 ">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados,
                        alquiler de autos y
                        venta de repuestos.</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Redes Sociales</h3>
                    <p> <i class="fa fa-facebook" aria-hidden="true"></i> Autos Max</p>
                    <p> <i class="fa fa-instagram" aria-hidden="true"></i> Autos Max</p>
                    <p> <i class="fa fa-twitter" aria-hidden="true"></i> Autos Max</p>
                </div>
                <div class="col-md-4">
                    <h3 class="display-5">Contáctanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Teléfono: 809-555-5555</p>
                    <p> <i class="fa fa-exclamation-circle" aria-hidden="true"></i> Correo: AutosMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
</footer>

</html>
