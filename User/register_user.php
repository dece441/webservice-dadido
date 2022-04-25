<?php
    $result = array();
    $username = $_POST['username'];
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $sql = "INSERT INTO tbl_user (fullname, username, email, password) VALUES ('$fullname','$username','$email','$password')";
    $res = mysqli_query($my_conn, $sql);

    if($res) {
        $last_user_id = mysqli_insert_id($my_conn);
        
        $sql2 = "INSERT INTO tbl_wallet (total_fund, wallet_type, contract_address) VALUES (0,'dadido','kDSJhfkjsdhflksajhdkajlsdhflkjahsdfjkhsd')";
        $res2 = mysqli_query($my_conn, $sql2);
        
        if($res2){
            $last_wallet_id = mysqli_insert_id($my_conn);

            $sql3 = "INSERT INTO tbl_profile (id_user, id_collection, id_wallet, profile_url) VALUES ($last_user_id,0,$last_wallet_id,'/empty_user2.png')";
            $res3 = mysqli_query($my_conn, $sql3);

            if($res3){
                echo json_encode("Register Successfull!!");
            }else{
                echo json_encode("Register Failed");
            }
        }
        
    } else {
        echo json_encode("User Already Taken");
    }
?>