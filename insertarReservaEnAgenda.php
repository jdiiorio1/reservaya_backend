<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

    $id_cancha = $_POST['id_cancha'];
    $id_complejo = $_POST['id_complejo'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];


    $query = "INSERT INTO agenda (id_complejo, id_cancha, fecha, hora) VALUES  ('$id_complejo', '$id_cancha', '$fecha', '$hora')";
    $result = $mysql->query($query);


    $mysql->close();
} 
