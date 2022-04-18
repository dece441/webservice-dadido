<?php 

    $username = $_POST['username'];
    $oldPass = $_POST['old_password'];
    $newPass = $_POST['new_password'];
    $email = $_POST['email'];
    $fullname = $_POST['fullname'];
    $homeAddr = $_POST['home_address'];

    $query = mysqli_query($my_conn, "SELECT id FROM tbl_user WHERE username='$username' AND password='$oldPass'");

    if($query) {
        $id_user = implode(mysqli_fetch_assoc($query));
        
        $sql = "UPDATE tbl_user SET 
        username='$username',email='$email',
        fullname='$fullname',home_address='$homeAddr',
        password='$newPass' WHERE id = '$id_user'";

        echo json_encode("success");
    } else {
        echo json_encode("failed");
    }

    

?>