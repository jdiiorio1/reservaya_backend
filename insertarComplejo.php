<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require_once("ConectarBD.php");

       
    $nombre = $_POST['nombre'];
    $horario_inicio = $_POST['horario_inicio'];
    $horario_fin = $_POST['horario_fin'];
    $propietario_id = $_POST['propietario_id']; 
    $latitud= $_POST['latitud'];
    $longitud= $_POST['longitud'];
    $calle = $_POST['calle']; 
    $numero = $_POST['numero']; 
    $nombreLocalidad = $_POST['nombreLocalidad'];
    $codigoPostal = $_POST['codigoPostal'];
    $provincia = $_POST['provincia'];

    $sql_select_localidad = "SELECT id FROM localidad WHERE nombre = '$nombreLocalidad' AND codigoPostal = $codigoPostal";
    $result = $mysql->query($sql_select_localidad);
    if ($result->num_rows > 0) {
        // La localidad ya existe, obtenemos su ID
        $row = $result->fetch_assoc();
        $localidad_id = $row['id'];
    } else {
        // La localidad no existe, la insertamos
        $sql_insertar_localidad = "INSERT INTO localidad (nombre, codigoPostal, provincia) VALUES ('$nombreLocalidad', $codigoPostal, '$provincia')";
        if ($mysql->query($sql_insertar_localidad) === TRUE) {
            // Obtenemos el ID de la localidad insertada
            $localidad_id = $mysql->insert_id;
        } else {
            echo "Error al insertar la localidad: " . $mysql->error;
            exit(); // Salir del script si hay un error al insertar la localidad
        }
    }

    $sql_select_direccion = "SELECT id FROM direccion WHERE calle = '$calle' AND numero = '$numero' AND localidad_id = '$localidad_id'";
    $result = $mysql->query($sql_select_direccion);
    if ($result->num_rows > 0) {
        // La dirección ya existe, eliminar el registro insertado y mostrar un mensaje de error
        $sql_delete_direccion = "DELETE FROM direccion WHERE calle = '$calle' AND numero = '$numero' AND localidad_id = '$localidad_id'";
        if ($mysql->query($sql_delete_direccion) === TRUE) {
            echo "La dirección ya está registrada en la base de datos.";
        } else {
            echo "Error al eliminar la dirección duplicada: " . $mysql->error;
        }
        exit();
    } else {
        // La dirección no existe, la insertamos en la tabla de direcciones
        $sql_insertar_direccion = "INSERT INTO direccion (calle, numero, localidad_id) VALUES ('$calle', '$numero', '$localidad_id')";
        if ($mysql->query($sql_insertar_direccion) === TRUE) {
            // Obtenemos el ID de la dirección insertada
            $direccion_id = $mysql->insert_id;

        } else {
            echo "Error al insertar la dirección: " . $mysql->error;
        }
    }

    $query = "INSERT INTO complejo (nombre, dirrecion_id, propietario_id, latitud, longitud, horario_inicio, horario_fin) VALUES ('$nombre', '$dirrecion_id', '$propietario_id', '$latitud', '$longitud', '$horario_inicio', '$horario_fin')";
    $result = $mysql->query($query);

    if ($result === true) {
        echo "Se inserto correctamente la tabla ";
    } else {
        echo "Error al insertar en la tabla 'usuarios'";
    }
}
// Cerrar la conexión
$mysql->close();
?>
feature/crearComplejo
