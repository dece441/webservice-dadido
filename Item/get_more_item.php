<?php 
    $id = $_POST['id'];

    $sql = "SELECT * FROM tbl_item WHERE 
            id_profile = (SELECT id_profile FROM tbl_item WHERE id = '$id')";

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
?>