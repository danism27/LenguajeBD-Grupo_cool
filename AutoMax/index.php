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
			<a class="logo navbar-brand pl-4" href="index.php">Auto Max</a>
			<button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
				data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
				aria-label="Toggle navigation"></button>
			<div class="collapse navbar-collapse" id="collapsibleNavId">
				<ul class="navbar-nav me-auto mt-2 mt-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="index.php">Inicio</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="views/tablas.php">Ver tablas</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="views/tablas.php">Vistas</a>
					</li>
				</ul>
			</div>
		</nav>
		<main>

			<div class="">
				<?php
				require_once('views/home.php');
				;
				?>
			</div>

		</main>

		<footer>
			<?php
			require_once('views/Layouts/footer.php');
			?>
		</footer>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
			integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
			</script>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
			integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
			</script>
</body>

</html>