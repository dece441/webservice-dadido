<?php 
    $result = array();
    $sql = "SELECT tbl_collection.*, tbl_user.username, tbl_profile.profile_url FROM tbl_collection
        INNER JOIN tbl_profile ON tbl_collection.id_profile = tbl_profile.id
        INNER JOIN tbl_user ON tbl_profile.id_user = tbl_user.id
    ";
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