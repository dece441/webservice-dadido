<?php
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM tbl_item WHERE
            id IN (SELECT id_item AS id FROM tbl_favorit WHERE 
            id_profile_following IN (SELECT id AS id_profile_following FROM tbl_user 
            WHERE username = '$username' AND password = '$password') AND status_favorit = 1)";
    
    $query = mysqli_query($my_conn, $sql);
    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }

        echo json_encode($result);
    } else {
        echo json_encode("Error");
    }
?>