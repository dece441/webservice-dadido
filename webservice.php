<?php

header('Content-Type:multipart/form-data');
header('Access-Control-Allow-Methods: GET,POST,DELETE.PUT');
header('Access-Control-Allow-Origin: *');
    
    if (isset($_POST['CMD'])){
        require_once('config/MyConn.php');
		switch($_POST['CMD']) {
		
			case 'Test':
				$response['error'] = false;
				$response['message'] = 'Berhasil test';
				echo json_encode($response);
			
			break;
			
			case 'tbl_user':
				$result = array();
				$sql = "SELECT * FROM tbl_user";
				$query = mysqli_query($my_conn,$sql);
				
				if($query){
					while($row = mysqli_fetch_assoc($query)){
						$result[] = $row;
					}
					echo json_encode($result);
				}else{
					$return["error"] = true;
					$return["message"] = "Database error".$sql;
				
					// tell browser that its a json data
					echo json_encode($return);
				}
				break;

			case 'login_user':
				require_once 'User/login_user.php';
				break;
			case 'register_user' :
				require_once 'User/register_user.php';
				break;
			case 'new_item' :
				require_once 'Item/all_item.php';
				break;
			case 'get_item_base_by_item_id':
				$val = isset($_POST["item_id"]);
				if ($val){
					$item_id = $_POST["item_id"];

					$sql = "SELECT i.id, i.file_name, i.image_url, i.description, i.sell_status, i.price, p.id_user, u.username, c.collection_name, t.transaction_time
							FROM tbl_item i, tbl_profile p, tbl_user u, tbl_collection c, tbl_transaction t
							WHERE i.id_profile = p.id
							AND i.id_collection = c.id
							AND p.id = u.id
							AND t.id_item = i.id
							AND i.id_profile = $item_id";
					
					$query = mysqli_query($my_conn,$sql);

					if($query){
						while($row = mysqli_fetch_assoc($query)){
							$result[] = $row;
						}
						echo json_encode($result);
					}else{
						$return["error"] = true;
						$return["message"] = "Database error".$sql;
					
						// tell browser that its a json data
						echo json_encode($return);
					}
				}
				break;
			default:
				$response['error'] = true;
				$response['message'] = '505';
				echo json_encode($response);
		}
	}
?>