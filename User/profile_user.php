<?php 
    $result = array();
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT tbl_user.*, tbl_profile.profile_url FROM tbl_user
        INNER JOIN tbl_profile ON tbl_user.id = tbl_profile.id_user
        WHERE username = '$username' AND password = '$password'
    ";
    $query = mysqli_query($my_conn,$sql);
    
    if($query){
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }

        echo json_encode($result);
    } else {
        echo json_encode($query);
    }
?>