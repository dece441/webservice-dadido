<?php
    $username = $_POST["username"];
    $result = array();

    $sql = "SELECT u.username, c.collection_name, c.image_banner_url, c.description, p.profile_url
            FROM tbl_user u, tbl_profile p, tbl_collection c
            WHERE u.id = p.id
            AND p.id_collection = c.id
            AND u.username = '$username'";
    
    $query = mysqli_query($my_conn, $sql);
    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }
        echo json_encode($result);
    } else {
        echo json_encode("Data not found!");
    }
?>