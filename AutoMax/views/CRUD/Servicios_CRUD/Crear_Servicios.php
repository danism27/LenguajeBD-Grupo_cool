<!DOCTYPE html>
<html lang="es">
<head>
    <title>Crear Servicio - Auto Max</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <header style="margin-bottom: 2%">
        <nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #000000;">
            <a class="logo navbar-brand pl-4" href="/Automax/index.php">Auto Max</a>
            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation"></button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav me-auto mt-2 mt-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/Automax/index.php">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Automax/views/tablas.php">Ver tablas</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="container">
        <h1 class="text-center">Crear Nuevo Servicio</h1>
        <form action="procesar_crear_servicio.php" method="GET">
            <div class="form-group">
                <label for="cod_servicio">Código del Servicio:</label>
                <input type="number" class="form-control" id="cod_servicio" name="cod_servicio" required>
            </div>
            <div class="form-group">
                <label for="nombre_servicio">Nombre del Servicio:</label>
                <input type="text" class="form-control" id="nombre_servicio" name="nombre_servicio" required>
            </div>
            <div class="form-group">
                <label for="descripcion_servicio">Descripción:</label>
                <input type="text" class="form-control" id="descripcion_servicio" name="descripcion_servicio" required>
            </div>
            <div class="form-group">
                <label for="precio_servicio">Precio:</label>
                <input type="number" step="0.01" class="form-control" id="precio_servicio" name="precio_servicio" required>
            </div>
            <br><br>
            <button type="submit" class="btn btn-success">Crear Servicio</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<footer>
    <div class="footer bg-dark mt-5 p-5 text-center navbar-dark" style="color: white; background-color: #000000">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3 class="display-5">Autos Max</h3>
                    <p class="mt-3">Autos Fidelitas es una empresa dedicada a la venta de autos nuevos y usados, alquiler de autos y venta de repuestos.</p>
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
