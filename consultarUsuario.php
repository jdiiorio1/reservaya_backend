<?php
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once('ConectarBD.php');
    $correo_electronico = $_GET['correo_electronico'];
    $query = "SELECT id, nombre, correo_electronico, contrasena, propietario FROM usuario WHERE correo_electronico = '$correo_electronico'";
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
