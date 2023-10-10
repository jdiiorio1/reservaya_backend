<?php

$mysql = new mysqli(
    "localhost",
    "root",
    "",
    "reserva_ya"
);
if($mysql->connect_error){
    die("La coneccion fallo".$mysql->connect_error);
}
else{
   
}