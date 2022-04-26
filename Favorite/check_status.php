<?php
    $username_creator = $_POST["username_creator"];
    $username_seeing = $_POST["username_seeing"];
    $id_item = $_POST["id_item"];
    $collection_name = $_POST["collection_name"];

    $sql = "SELECT u.id
            FROM tbl_user u, tbl_profile p
            WHERE p.id_user = u.id 
            AND u.username = '$username_seeing'";//searching user id from username that seeing the item
    
    $query = mysqli_query($my_conn, $sql);
    if($query){
        while($row = mysqli_fetch_assoc($query)){
            $id_seeing = $row["id"];
        }

        $sql2 = "SELECT u.id
            FROM tbl_user u, tbl_profile p
            WHERE p.id_user = u.id 
            AND u.username = '$username_creator'";//searching user id from username that being liked
    
        $query2 = mysqli_query($my_conn, $sql2);
        if($query2){
            while($row = mysqli_fetch_assoc($query2)){
                $id_creator = $row["id"];
            }

            $sql_check_status = "SELECT f.status_favorit
                                FROM tbl_favorit f
                                WHERE f.id_item = $id_item
                                AND f.id_profile_followers = $id_creator
                                AND f.id_profile_following = $id_seeing";
            $query_check_status = mysqli_query($my_conn, $sql_check_status);

            if($query_check_status){
                while($row = mysqli_fetch_assoc($query_check_status)){
                    $status_fav = $row["status_favorit"];
                }
                if(isset($status_fav)){
                    echo json_encode($status_fav);
                }else{
                    $status_fav = "Belum Ada";
                    echo json_encode($status_fav);
                }
                
            }else{
                echo json_encode("failed");
            }
        }
    }

?>