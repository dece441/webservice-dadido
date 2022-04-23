<?php
    $username = $_POST["username"];
    
    $min_price= array();
    $sql = "SELECT min(i.price) AS min_price
            FROM tbl_item i, tbl_profile p, tbl_user u
            WHERE i.id_profile = p.id
            AND p.id_user = u.id
            AND u.username = '$username'";
    $query = mysqli_query($my_conn, $sql);
    if($query){
        while($row = mysqli_fetch_assoc($query)) {
            $min_price[] = $row;
        }
        echo json_encode($min_price);
    }
    

    

?>