<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    $id_usuario = $_GET['id_usuario'];
    
    //$query = "SELECT nombre, latitud, longitud FROM complejo";

        $array = array();
        foreach($mysql->query(" SELECT com.nombre, can.capacidad, can.techado, res.fecha, res.hora, can.costo
                                FROM complejo as com, reserva as res, cancha as can
                                WHERE
                                    res.id_cancha = can.id AND
                                    can.complejo_id = com.id AND
                                    res.id_usuario = '$id_usuario'
                                ORDER BY res.fecha DESC;") as $row) {
            $array[] =$row;
           // echo "<li>" . $row['nombre'] . $row['latitud'] .$row['longitud'] ."</li>";
        }
       // echo "</ol>";
        echo json_encode($array);


        if ($array < 0) {
            echo "No se encontraron reservas realizadas por el usuario";
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
