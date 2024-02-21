<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

    $id_cancha = $_POST['id_cancha'];
    $id_usuario = $_POST['id_usuario'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];


    $query = "INSERT INTO reserva (id_cancha, fecha, hora, id_usuario) VALUES  ('$id_cancha', '$fecha', '$hora', '$id_usuario')";
    $result = $mysql->query($query);


    $mysql->close();
} 
