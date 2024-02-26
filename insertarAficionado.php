<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

    $nombre = $_POST['nombre'];
    $correo_electronico = $_POST['correo_electronico'];
    $contrasena = $_POST['contrasena'];
    $propietario = $_POST['propietario'];
    $cuil= $_POST['cuil'];

    $query = "INSERT INTO usuario (nombre, correo_electronico, contrasena, propietario, cuil) VALUES ('$nombre', '$correo_electronico', '$contrasena', '$propietario', '$cuil')";
    $result = $mysql->query($query);

    if ($result === true) {
        // Obtener el ID del usuario recién insertado
        $usuario_aficionado_id = $mysql->insert_id;

        // Insertar en la tabla "aficionado" utilizando el ID del usuario
        $query2 = "INSERT INTO aficionado (usuario_id) VALUES ('$usuario_aficionado_id')";
        $result2 = $mysql->query($query2);

        if ($result2 === true) {
            echo "El cliente fue registrado";
        } else {
            echo "Error al insertar en la tabla 'aficionado'";
        }
    } else {
        echo "Error al insertar en la tabla 'usuarios'";
    }

    $mysql->close();
}
