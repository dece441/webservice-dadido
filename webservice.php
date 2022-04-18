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
				require_once 'Item/new_item.php';
				break;
			case 'most_expensive' :
				require_once 'Item/most_expensive.php';
				break;
			case 'data_creator' :
				require_once 'Item/data_creator.php';
				break;
			case 'get_item_base_by_item_id':
				require_once 'Item/get_item_by_id.php';
				break;
			default:
				$response['error'] = true;
				$response['message'] = '505';
				echo json_encode($response);
		}
	}
?>