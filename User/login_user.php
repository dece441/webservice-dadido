<?php
    $result = array();
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM tbl_user WHERE username = '$username' AND password = '$password'";
    $query = mysqli_query($my_conn,$sql);
    
    if(mysqli_num_rows($query) == 0){
        echo json_encode('failed');
    } else {
        echo json_encode('success');
    }
?>