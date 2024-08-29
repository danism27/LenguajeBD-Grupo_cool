<?php
 
function Conecta()
{
    $host = "localhost";  //el hostname de tu servidor Oracle
    $port = "1521";       //puerto de Oracle, por defecto es 1521
    $dbname = "orcl";       //nombre de la base de datos
    $user = "AutoMax";   //usuario de cada quien 
    $password = "123"; //contraseña 

    // Cadena de conexión para Oracles
    $dsn = "oci:dbname=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=$port))(CONNECT_DATA=(SID=$dbname)))";
 
    try {
        $conexion = new PDO($dsn, $user, $password);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //echo "Conexión establecida con éxito."; 
    } catch (PDOException $e) {
        error_log("Ocurrió un problema al establecer la conexión: " . $e->getMessage());
        echo "Ocurrió un problema al establecer la conexión. Por favor, contacte al administrador.";
    }
 
    return $conexion;
}
 
function Desconectar($conexion)
{
    $conexion = null;
}