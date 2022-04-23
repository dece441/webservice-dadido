<?php
    $username = $_POST["username"];
    
    $item= array();
    $sql = "SELECT i.id, i.file_name, i.image_url, i.description, i.price
            FROM tbl_item i, tbl_user u, tbl_profile p
            WHERE i.id_collection = p.id_collection
            AND i.id_profile = p.id
            AND i.id_profile = u.id
            AND u.username = '$username'";
    $query = mysqli_query($my_conn, $sql);
    if($query){
        while($row = mysqli_fetch_assoc($query)) {
            $item[] = $row;
        }
        echo json_encode($item);
    }
?>