<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

    $nombre = $_POST['nombre'];
    $correo_electronico = $_POST['correo_electronico'];
    $contrasena = $_POST['contrasena'];
    $propietario = $_POST['propietario'];
    $cuil = $_POST['cuil'];
    $alias = $_POST['alias'];

    $query = "INSERT INTO usuario (nombre, correo_electronico, contrasena, propietario, cuil) VALUES ('$nombre', '$correo_electronico', '$contrasena', '$propietario', '$cuil')";
    $result = $mysql->query($query);

    if ($result === true) {
        // Obtener el ID del usuario recién insertado
        $usuario_propietario_id = $mysql->insert_id;

        // Insertar en la tabla "propietario" utilizando el ID del usuario
        $query2 = "INSERT INTO propietario (usuario_id, alias) VALUES ('$usuario_propietario_id', '$alias')";
        $result2 = $mysql->query($query2);

        if ($result2 === true) {
            echo "El cliente fue registrado";
        } else {
            echo "Error al insertar en la tabla 'propietario'";
        }
    } else {
        echo "Error al insertar en la tabla 'usuarios'";
    }

    $mysql->close();
}
