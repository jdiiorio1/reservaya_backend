<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    $usuario_id = $_GET['usuario_id'];
    $query = "SELECT id, usuario_id, alias FROM propietario WHERE usuario_id = '$usuario_id'";
    $result = $mysql->query($query);
    
    if ($result->num_rows > 0) {
        $array = array(); // Inicializa el array
        while ($row = $result->fetch_assoc()) {
            $array = $row; // Agrega cada fila al array
        }
        echo json_encode($array);
    } else {
        echo "No hay datos";
    }

    $result->close();
    $mysql->close();
}
