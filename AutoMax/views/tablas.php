<div class="container">
    <h1 class="text-center">OFICINAS</h1>
    <div class="row">
        <div class="col">
            <?php
            $conn = oci_connect('AutoMax', '123', 'localhost/ORCL');
            if (!$conn) {
                $e = oci_error();
                trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
            }

            $stid = oci_parse($conn, 'SELECT * FROM OFICINAS');
            oci_execute($stid);

            echo "<table class='table table-striped table-bordered'>\n"; // Agrega clases de Bootstrap para la tabla
            echo "<thead class='thead-dark'>\n";
            echo "<tr>\n";
            echo "<th>ID OFINIA</th>\n"; // Reemplaza con los nombres reales de las columnas
            echo "<th>NOMBRE</th>\n"; // Reemplaza con los nombres reales de las columnas
            echo "<th>FECHA REGISTRO</th>\n"; // Reemplaza con los nombres reales de las columnas
            // Añade más <th> según la cantidad de columnas en tu tabla
            echo "</tr>\n";
            echo "</thead>\n";
            echo "<tbody>\n";
            while ($row = oci_fetch_array($stid, OCI_ASSOC + OCI_RETURN_NULLS)) {
                echo "<tr>\n";
                foreach ($row as $item) {
                    echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
                }
                echo "</tr>\n";
            }
            echo "</tbody>\n";
            echo "</table>\n";
            ?>
        </div>
    </div>
</div>
