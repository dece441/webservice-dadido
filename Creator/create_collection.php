<?php

    $collection_name = $_POST["collection_name"];
    $description = $_POST["description"];
    $username = $_POST["username"];
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
        $sql ="SELECT p.id AS 'id_profile'
        FROM tbl_user u, tbl_profile p
        WHERE u.id = p.id_user
        AND u.username = '$username'";

        $query = mysqli_query($my_conn, $sql);
        if ($query) {
            while($row = mysqli_fetch_assoc($query)){
                $id_profile = $row["id_profile"];
            }

            $sql2 = "INSERT INTO tbl_collection (collection_name, description, id_profile, image_banner_url)
                    VALUES ('$collection_name', '$description', $id_profile, '$url')";
            $query2 = mysqli_query($my_conn, $sql2);
            if ($query2) {
                $last_collection_id = mysqli_insert_id($my_conn);

                $sql3 = "UPDATE tbl_profile 
                SET id_collection = $last_collection_id
                WHERE id = $id_profile";

                $query3 = mysqli_query($my_conn, $sql3);
                if ($query3) {
                    echo json_encode('Success');
                } else {
                    echo json_encode('Failed');
                }
            }

        }
    }

   

   
?>