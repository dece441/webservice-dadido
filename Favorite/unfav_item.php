<?php 

    $username = $_POST['username'];
    $password = $_POST['password'];
    $imageURL = $_POST['image_url'];
    $imageTitle = $_POST['image_title'];

    $sql = "UPDATE tbl_favorit SET status_favorit = 0 WHERE
            tbl_favorit.id_item = (SELECT id FROM tbl_item WHERE image_url = '$imageURL' AND file_name = '$imageTitle')
            AND tbl_favorit.id_profile_following = (SELECT id FROM tbl_user WHERE username = '$username' AND password = '$password')";

    $query = mysqli_query($my_conn, $sql);
    if($query) {
        echo json_encode("success");
    } else {
        echo json_encode("error");
    }
?>