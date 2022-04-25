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
			case 'update_profile' :
				require_once 'User/update_profile.php';
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
			case 'get_more_item' :
				require_once 'Item/get_more_item.php';
				break;
			case 'get_detail_item' :
				require_once 'Item/get_detail_item.php';
				break;
			case 'data_creator' :
				require_once 'Creator/data_creator.php';
				break;
			case 'on_search' :
				require_once 'Item/on_search.php';
				break;
			case 'has_collection':
				require_once 'Creator/has_collection.php';
				break;
			case 'get_funds':
				require_once 'Wallet/get_funds.php';
				break;
			case 'add_funds':
				require_once 'Wallet/add_funds.php';
				break;
			case 'user_fav' :
				require_once 'Favorite/user_fav.php';
				break;
			case 'collection_by_username':
				require_once 'Creator/collection_by_username.php';
				break;
			case 'min_price':
				require_once 'Creator/min_price.php';
				break;
			case 'item_by_username':
				require_once 'Creator/item_by_username.php';
				break;
			case 'create_item':
				require_once 'Item/create_item.php';
				break;
			case 'create_collection':
				require_once 'Creator/create_collection.php';
				break;
			default:
				$response['error'] = true;
				$response['message'] = '505';
				echo json_encode($response);
		}
	}
?>