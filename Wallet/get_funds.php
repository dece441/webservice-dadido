<?php 
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $sql = "SELECT * FROM tbl_wallet WHERE id = (SELECT id FROM tbl_user WHERE username = '$username' AND password = '$password')";
    $query = mysqli_query($my_conn, $sql);

    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }

        echo json_encode($result);
    } else {
        echo json_encode($result);
    }
?>