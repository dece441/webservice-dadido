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

            $sql3 = "SELECT c.id
                FROM tbl_collection c
                WHERE c.collection_name = '$collection_name'";//searching collection id from collection name
            $query3 = mysqli_query($my_conn, $sql3);

            if($query3){
                while($row = mysqli_fetch_assoc($query3)){
                    $id_collection = $row["id"];
                }

                $sql4 = "INSERT INTO tbl_favorit (id_collection, id_item, id_profile_followers, id_profile_following, status_favorit)
                        VALUES ($id_collection,$id_item,$id_creator,$id_seeing,1)";//insert into tbl_favorit

                $query4 = mysqli_query($my_conn, $sql4);
                if($query4){
                    echo json_encode("success"); //return
                }else{
                    echo json_encode("failed");
                }
                
            }
        }
    }
    

    
?>