<?php
    $val = isset($_POST["username"])&& isset($_POST["password"]);
    
    if($val){
        $username = $_POST["username"];
        $password = $_POST["password"];
        
        $result = array();
        $sql_user = "SELECT id FROM tbl_user WHERE username = '$username' AND password='$password'";
        $query = mysqli_query($my_conn,$sql_user);
        if($query){
            while($row = mysqli_fetch_assoc($query)){
                $user_id = $row["id"];
            }

            $sql = "SELECT p.id_user, p.id_collection
                    FROM tbl_profile p
                    WHERE p.id_user = $user_id
                    AND p.id_collection = 0";
            $query2 = mysqli_query($my_conn,$sql);
            if($query2){
                while($row = mysqli_fetch_assoc($query2)) {
                    $result = $row["id_collection"];
                }
                if($result == 0){
                    echo json_encode("no_collection");
                }else{
                    echo json_encode("has_collection");
                }
                
            }else{
                echo json_encode("username not found");
            }
        }
        


    }

?>