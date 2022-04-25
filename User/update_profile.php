<?php 
    $username = $_POST['username'];
    $oldPass = $_POST['old_password'];
    $newPass = $_POST['new_password'];
    $email = $_POST['email'];
    $fullname = $_POST['fullname'];
    $homeAddr = $_POST['home_address'];

    $namaFile = $_FILES['choosefile']['name'];
    $namaSementara = $_FILES['choosefile']['tmp_name'];

    $url = "/";

    // tentukan lokasi file akan dipindahkan
    $dirUpload = "Image/".$username."/";
    if (!file_exists($dirUpload)) {
        mkdir($dirUpload, 0777, true);
    }

    $terupload = move_uploaded_file($namaSementara , $dirUpload.$namaFile);

    $url = $url.$dirUpload.$namaFile;

    $sql = "UPDATE tbl_user u, tbl_profile p 
            SET u.username='$username',u.email='$email', u.fullname='$fullname',u.home_address='$homeAddr', u.password='$newPass', p.profile_url='$url'
            WHERE u.id = p.id_user
            AND u.username='$username' AND u.password='$oldPass'";
    
    mysqli_query($my_conn, $sql);

    if(mysqli_affected_rows($my_conn) > 0) {
        echo json_encode("success");
    } else {
        echo json_encode("failed");
    }

?>