<?php 
    if (isset($_POST["item_id"])){
        $item_id = $_POST["item_id"];

        $sql = "SELECT i.id, i.file_name, i.image_url, i.description, i.sell_status, i.price, p.id_user, u.username, c.collection_name, t.transaction_time
                FROM tbl_item i, tbl_profile p, tbl_user u, tbl_collection c, tbl_transaction t
                WHERE i.id_profile = p.id
                AND i.id_collection = c.id
                AND p.id = u.id
                AND t.id_item = i.id
                AND i.id_profile = $item_id";
        
        $query = mysqli_query($my_conn,$sql);

        if($query){
            while($row = mysqli_fetch_assoc($query)){
                $result[] = $row;
            }
            echo json_encode($result);
        }else{
            $return["error"] = true;
            $return["message"] = "Database error".$sql;
        
            // tell browser that its a json data
            echo json_encode($return);
        }
    }
?>