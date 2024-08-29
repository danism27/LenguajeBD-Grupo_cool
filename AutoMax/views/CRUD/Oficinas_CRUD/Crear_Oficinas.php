<style>
    .carousel-inner {
        max-block-size: 35rem;
    }

    .indexh1 {
        font-size: 5rem;
        color: rgb(17, 17, 150);
    }

    .main {
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        font-size: 20px;
    }

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


<!DOCTYPE html>
<html lang="es">

<head>

    <title> Auto Max</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">

    <!-- LIBRERIAS BOOTSTRAP-->

    <!-- Latest compiled and minified CSS -->
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
                        <a class="nav-link" href="/Automax/views/tablas.php">Ver talbas</a>
                    </li>
                </ul>
            </div>
        </nav>
        </header>
        <br><br><br><br><br>
        <div class="container">
            <h1 class="text-center">Crear Nueva Oficina</h1>

            <!-- Formulario para crear una nueva oficina -->
            <form action="procesar_crear_oficina.php" method="GET">
                <div class="form-group">
                    <label for="nombre_oficina">Nombre de la Oficina:</label>
                    <input type="text" class="form-control" id="nombre_oficina" name="nombre_oficina" required>
                </div>
                <div class="form-group">
                    <label for="fecha_registro">Fecha de Registro:</label>
                    <input type="date" class="form-control" id="fecha_registro" name="fecha_registro" required>
                </div>
                <br><br>
                <button type="submit" class="btn btn-success">Crear Oficina</button>
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
                    <h3 class="display-5">Contactanos</h3>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> Telefono: 809-555-5555</p>
                    <p> <i class="fa fa-exclamation-circle" aria-hidden="true"></i> Correo: AutosMax@Ufide.ac.cr</p>
                </div>
            </div>
        </div>
</footer>