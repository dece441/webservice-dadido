<?PHP
    $username = $_POST["username"];
    $item_name = $_POST["item_name"];
    $description = $_POST["description"];
    $price = $_POST["price"];
    $namaFile = $_FILES['choosefile']['name'];
    $namaSementara = $_FILES['choosefile']['tmp_name'];

    $url = "/";

    // tentukan lokasi file akan dipindahkan
    $dirUpload = "Image/".$username."/";
    if (!file_exists($dirUpload)) {
        mkdir($dirUpload, 0777, true);
    }

    // pindahkan file
    $terupload = move_uploaded_file($namaSementara , $dirUpload.$namaFile);

    $url = $url.$dirUpload.$namaFile;

    if ($terupload) {
        $sql = "SELECT u.id
                FROM tbl_user u
                WHERE u.username = '$username'";
        $query = mysqli_query($my_conn, $sql);
        if($query){
            while($row = mysqli_fetch_assoc($query)){
                $user_id = $row["id"];
            }

            $sql2 = "SELECT p.id_collection
                    FROM tbl_profile p, tbl_user u
                    WHERE p.id_user = u.id
                    AND u.username = '$username'";
            $query2 = mysqli_query($my_conn, $sql2);

            if($query2){
                while($row = mysqli_fetch_assoc($query2)){
                    $collection_id = $row["id_collection"];
                }

                $sql3 = "INSERT INTO tbl_item (id_collection, id_profile, file_name, image_url, description, sell_status, price)
                        VALUES ( $collection_id,$user_id, '$item_name', '$url', '$description', 1, $price)";

                $query3 = mysqli_query($my_conn, $sql3);
                if($query3){
                    $last_user_id = mysqli_insert_id($my_conn);
                    $date_time = date("Y-m-d H:i:s");

                    $sql4 = "INSERT INTO tbl_transaction (id_item, id_profile_buyer, id_profile_seller, event, transaction_time)
                            VALUES ( $last_user_id, $user_id, 0, 'minted', '$date_time')";
                    $query4 = mysqli_query($my_conn, $sql4);
                    if($query4){
                        echo json_encode("Upload berhasil!");
                    }else{
                        echo json_encode("Upload gagal!");
                    }
                }
            }
            
        }
    } else {
        echo "Upload Gagal!";
        echo $terupload;
    }
    
?>