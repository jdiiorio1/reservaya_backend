<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

    $nombre = $_POST['nombre'];
    $correo_electronico = $_POST['correo_electronico'];
    $contrasena = $_POST['contrasena'];
    $propietario = $_POST['propietario'];
    $cuil = $_POST['cuil'];

    $query = "INSERT INTO usuarios (nombre, correo_electronico, contrasena, propietario) VALUES ('$nombre', '$correo_electronico', '$contrasena', '$propietario')";
    $result = $mysql->query($query);

    if ($result === true) {
        // Obtener el ID del usuario recién insertado
        $usuario_propietario_id = $mysql->insert_id;

        // Insertar en la tabla "propietario" utilizando el ID del usuario
        $query2 = "INSERT INTO propietario (cuil, usuario_id) VALUES ('$cuil', '$usuario_propietario_id')";
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
