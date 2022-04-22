<?php 

    $username = $_POST['username'];
    $password = $_POST['password'];
    $total_funds = floatval($_POST['total_funds']);

    $sql = "UPDATE tbl_wallet SET total_fund = total_fund+'$total_funds' WHERE
            id = (SELECT id FROM tbl_user WHERE username = '$username' AND password = '$password')";

    mysqli_query($my_conn, $sql);
    if(mysqli_affected_rows($my_conn) > 0) {
        echo json_encode("success");
    } else {
        echo json_encode("failed");
    }
?>