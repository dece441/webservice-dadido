<?PHP
    $collection_name = $_POST["collection_name"];
    $description = $_POST["collection_desc"];
    $username = $_POST["username"];

    $val_img = isset($_FILES['choosefile']['name']) && isset($_FILES['choosefile']['tmp_name']);
        
    if($val_img){
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

        $sql = "UPDATE tbl_collection c, tbl_user u, tbl_profile p 
                SET c.collection_name = '$collection_name', c.description = '$description', c.image_banner_url = '$url'
                WHERE u.id = p.id_user
                AND c.id_profile = p.id
                AND u.username='$username'";
        $query = mysqli_query($my_conn, $sql);

        if($query) {
            echo json_encode("success update Picture and collection");
        } else {
            echo json_encode("failed");
        }
    }else{
        $sql = "SELECT c.image_banner_url
                    FROM tbl_collection c, tbl_user u, tbl_profile p
                    WHERE p.id_user = u.id
                    AND c.id_profile = p.id
                    AND u.username = '$username'";
            
        $query = mysqli_query($my_conn, $sql);
        if($query){
            while($row = mysqli_fetch_assoc($query)){
                $banner_url = $row["image_banner_url"];
            }

            $sql2 = "UPDATE tbl_collection c, tbl_user u, tbl_profile p 
                    SET c.collection_name = '$collection_name', c.description = '$description', c.image_banner_url = '$banner_url'
                    WHERE u.id = p.id_user
                    AND c.id_profile = p.id
                    AND u.username='$username'";
            $query2 = mysqli_query($my_conn, $sql2);

            if($query2) {
                echo json_encode("success update collection");
            } else {
                echo json_encode("failed");
            }
        }
    }
?>