<?php 
    $result = array();
    $sql = "SELECT tbl_item.*, tbl_user.username FROM tbl_item
    INNER JOIN tbl_user ON tbl_user.id = tbl_item.id_profile_creator
    ORDER BY price DESC LIMIT 10";
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