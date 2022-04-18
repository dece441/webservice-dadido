<?php

header('Content-Type:multipart/form-data');
header('Access-Control-Allow-Methods: GET,POST,DELETE.PUT');
header('Access-Control-Allow-Origin: *');
    
    if (isset($_POST['CMD'])){
        require_once('config/MyConn.php');
		switch($_POST['CMD']) {
			case 'tbl_user':
				require_once 'User/all_data_user.php';
				break;
			case 'login_user':
				require_once 'User/login_user.php';
				break;
			case 'profile_user' :
				require_once 'User/profile_user.php';
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
			case 'get_item_base_by_item_id':
				require_once 'Item/get_item_by_id.php';
				break;
			case 'data_creator' :
				require_once 'Creator/data_creator.php';
				break;
			default:
				$response['error'] = true;
				$response['message'] = '505';
				echo json_encode($response);
		}
	}
?>