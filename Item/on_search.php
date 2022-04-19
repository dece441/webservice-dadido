<?php 

    $result = array();
    $sql = "SELECT * FROM tbl_item";
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