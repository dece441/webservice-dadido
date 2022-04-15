<?php 

    $result = array();
    $sql = "SELECT * FROM tbl_item";
    $query = mysqli_query($my_conn, $sql);
    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }
        return json_encode($result);
    } else {
        return json_encode("Data not found!");
    }

?>