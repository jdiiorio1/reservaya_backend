<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    //$correo_electronico = $_GET['correo_electronico'];
    //$query = "SELECT nombre, latitud, longitud FROM complejo";

        $array = array();
        foreach($mysql->query("SELECT nombre, latitud, longitud FROM complejo") as $row) {
            $array[] =$row;
           // echo "<li>" . $row['nombre'] . $row['latitud'] .$row['longitud'] ."</li>";
        }
       // echo "</ol>";
        echo json_encode($array);


        if ($array < 0) {
            echo "No hay datos";
        }

    /*$myArray = array();
    $result = $mysqli->query("SELECT nombre, latitud, longitud FROM complejo");
    while($row = $result->fetch_assoc()) {
        $myArray[] = $row;
    }
    echo json_encode($myArray);
*/


    //$result = $mysql->query($query);
 /*   
    if ($result->num_rows > 0) {
        $array = array(); // Inicializa el array
        while ($row = $result->mysqli_fetch_all()) {
            $array = $row; // Agrega cada fila al array
        }
        echo json_encode($array);
    } else {
        echo "No hay datos";
    }
*/
    //$result->close();
    $mysql->close();
} 
