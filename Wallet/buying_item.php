<?php
    $item_id = $_POST["item_id"];
    $username_buyer = $_POST["username_buyer"];
    $username_seller = $_POST["username_seller"];
    $purchase_price = $_POST["purchase_price"];
    $balance = $_POST["balance"];

    $balance_now_buyer = $balance - $purchase_price;
    

    $sql = "SELECT w.id
            FROM tbl_user u, tbl_profile p, tbl_wallet w
            WHERE p.id_user = u.id
            AND p.id_wallet = w.id
            AND u.username = '$username_buyer'";
    $query = mysqli_query($my_conn, $sql);
    if($query){
        while($row = mysqli_fetch_assoc($query)){
            $id_wallet_buyer = $row["id"];
        }
        $sql2 = "UPDATE tbl_wallet
                SET total_fund = $balance_now_buyer
                WHERE id = $id_wallet_buyer";
        
        $query2 = mysqli_query($my_conn, $sql2);
        if($query2){
            $sql3 = "SELECT w.id,w.total_fund
                    FROM tbl_user u, tbl_profile p, tbl_wallet w
                    WHERE p.id_user = u.id
                    AND p.id_wallet = w.id
                    AND u.username = '$username_seller'";
            $query3 = mysqli_query($my_conn, $sql3);
            if($query3){
                while($row = mysqli_fetch_assoc($query3)){
                    $id_wallet_seller = $row["id"];
                }
                while($row = mysqli_fetch_assoc($query3)){
                    $balance_seller = $row["total_fund"];
                }
                $balance_now_seller = ($balance_seller + $purchase_price);//error disini

                $sql4 = "UPDATE tbl_wallet
                        SET total_fund = $balance_now_seller
                        WHERE id = $id_wallet_seller";
        
                $query4 = mysqli_query($my_conn, $sql4);
                if($query4){
                    
                    $sql5 = "SELECT p.id
                    FROM tbl_user u, tbl_profile p
                    WHERE p.id_user = u.id
                    AND u.username = '$username_buyer'";

                    $query5 = mysqli_query($my_conn, $sql5);

                    if($query5){
                        while($row = mysqli_fetch_assoc($query5)){
                            $id_profil_buyer = $row["id"];
                        }

                        $sql6 = "SELECT p.id
                                FROM tbl_user u, tbl_profile p
                                WHERE p.id_user = u.id
                                AND u.username = '$username_seller'";

                        $query6 = mysqli_query($my_conn, $sql6);

                        if($query6){
                            while($row = mysqli_fetch_assoc($query6)){
                                $id_profil_seller = $row["id"];
                            }

                            $date_time = date("Y-m-d H:i:s");
                            $sql7 = "INSERT INTO tbl_transaction (id_item, id_profile_buyer, id_profile_seller, event, transaction_time)
                                    VALUES ($item_id, $id_profil_buyer, $id_profil_seller, 'minted', $date_time)";
                            $query7 = mysqli_query($my_conn, $sql7);
                            if($query7){
                                echo json_encode("Success");
                            }else{
                                echo json_encode("Failed");
                            }
                            
                        }

                    }
                }

            }
        }
    }

    
?>