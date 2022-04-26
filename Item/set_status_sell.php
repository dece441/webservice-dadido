<?php
    $item_id = $_POST["id"];
    $price = $_POST["price"];
    
    $sql_check = "SELECT i.sell_status
                FROM tbl_item i
                WHERE i.id = $item_id";
    $query_check = mysqli_query($my_conn, $sql_check);
    if($query_check){
        while($row = mysqli_fetch_assoc($query_check)){
            $sell_status = $row["sell_status"];
        }

        if($sell_status == 0){
            $sql="UPDATE tbl_item i
                SET i.sell_status = 1, i.price = $price
                WHERE i.id = $item_id";
            $query = mysqli_query($my_conn, $sql);

            if($query){
                echo json_encode("Update Successful");
            }else{
                echo json_encode("Update failed");
            }

        }else{
            $sql="UPDATE tbl_item i
            SET i.sell_status = 0, i.price = $price
            WHERE i.id = $item_id";
            $query = mysqli_query($my_conn, $sql);
            if($query){
                echo json_encode("Update Successful");
            }else{
                echo json_encode("Update failed");
            }
        }
    }

    
?>