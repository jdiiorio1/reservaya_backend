<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    $fecha = $_GET['fecha'];
    $hora = $_GET['hora'];
    //$query = "SELECT nombre, latitud, longitud FROM complejo";

        $array = array();
        foreach($mysql->query("select com.id, com.nombre, com.latitud, com.longitud, count(*) as cant_canchas 
            from complejo as com, cancha as can
            where
                can.complejo_id = com.id and
                can.id not in (select id_cancha from agenda
                                where 
                                fecha = '$fecha' and
                                hora = '$hora')
            group by com.id") as $row) {
            $array[] =$row;
           // echo "<li>" . $row['nombre'] . $row['latitud'] .$row['longitud'] ."</li>";
        }
       // echo "</ol>";
        echo json_encode($array);


        if ($array < 0) {
            echo "No hay disponibilidad en esa fecha y horario";
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
