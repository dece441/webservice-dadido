<?php 

    $id = $_POST['id'];

    $sql = "SELECT u.username AS 'owner', t.transaction_time AS 'last_activity', t.event, c.collection_name, i.sell_status
            FROM tbl_item i, tbl_transaction t, tbl_user u, tbl_profile p, tbl_collection c
            WHERE p.id_user = u.id
            AND i.id_collection = c.id
            AND t.id_item = i.id
            AND t.id_profile_buyer = p.id_user
            AND i.id = '$id' ORDER BY t.transaction_time ASC";

    $query = mysqli_query($my_conn, $sql);

    if($query) {
        while($row = mysqli_fetch_assoc($query)) {
            $result[] = $row;
        }
        echo json_encode($result);
    } else {
        echo json_encode("Error");
    }

?>