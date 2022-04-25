<?php 

    $id = $_POST['id'];

    $sql = "SELECT tbl_collection.*, tbl_transaction.* FROM tbl_collection 
            INNER JOIN tbl_transaction ON tbl_transaction.id_item = '$id'";

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