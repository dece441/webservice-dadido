<?php
    $result = array();
    $username = $_POST['username'];
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $sql = "INSERT INTO tbl_user (fullname, username, email, password) VALUES ('$fullname','$username','$email','$password')";

    if(mysqli_query($my_conn, $sql)) {
        echo json_encode("Register Successfull!!");
    } else {
        echo "Error";
    }
?>