<?php 
    $val = isset($_POST['username']) && isset($_POST['old_password']) && isset($_POST['new_password']) && isset($_POST['email']) && isset($_POST['fullname']) && isset($_POST['home_address']);
    $val2 = isset($_POST['username']) && isset($_POST['old_password']) && isset($_POST['new_password']) && isset($_POST['email']) && isset($_POST['fullname']);
    if($val){
       $username = $_POST['username'];
       $oldPass = $_POST['old_password'];
       $newPass = $_POST['new_password'];
       $email = $_POST['email'];
       $fullname = $_POST['fullname'];
       $homeAddr = $_POST['home_address'];

       $sql = "UPDATE tbl_user SET username='$username',email='$email',
               fullname='$fullname',home_address='$homeAddr', password='$newPass' 
               WHERE username='$username' AND password='$oldPass'";
    
       mysqli_query($my_conn, $sql);

       if(mysqli_affected_rows($my_conn) > 0) {
           echo json_encode("success");
       } else {
           echo json_encode("failed");
       }
    }else if($val2){
       $username = $_POST['username'];
       $oldPass = $_POST['old_password'];
       $newPass = $_POST['new_password'];
       $email = $_POST['email'];
       $fullname = $_POST['fullname'];

       $sql = "UPDATE tbl_user SET username='$username',email='$email',
               fullname='$fullname',home_address='$homeAddr', password='$newPass' 
               WHERE username='$username' AND password='$oldPass'";
    
       mysqli_query($my_conn, $sql);

       if(mysqli_affected_rows($my_conn) > 0) {
           echo json_encode("success");
       } else {
           echo json_encode("failed");
       }
    }else{
       echo json_encode("data not enough");
    }
    
    

?>