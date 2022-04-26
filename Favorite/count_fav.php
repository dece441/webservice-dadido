<?php 

    $id = $_POST['id_item'];

    $sql = "SELECT COUNT(*) as total FROM tbl_favorit WHERE 
            id_item = '$id' AND status_favorit = 1";
    $query = mysqli_query($my_conn, $sql);

    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }

        echo json_encode($result);
    } else {
        echo json_encode("error");
    }

?>