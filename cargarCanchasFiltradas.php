<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    $id_complejo = $_GET['id_complejo'];
    $fecha = $_GET['fecha'];
    $hora = $_GET['hora'];
    //$query = "SELECT nombre, latitud, longitud FROM complejo";

        $array = array();
        foreach($mysql->query("select can.id, can.capacidad, can.techado, can.costo from cancha as can, complejo as com
                                where
                                    can.complejo_id = com.id and
                                    can.complejo_id = '$id_complejo' and
                                    can.id not in (select id_cancha from reserva
                                where 
                                fecha = '$fecha' and
                                hora = '$hora')") as $row) {
            $array[] =$row;
           // echo "<li>" . $row['nombre'] . $row['latitud'] .$row['longitud'] ."</li>";
        }
       // echo "</ol>";
        echo json_encode($array);


        if ($array < 0) {
            echo "No hay canchas disponibles en esa fecha y horario para ese complejo";
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
