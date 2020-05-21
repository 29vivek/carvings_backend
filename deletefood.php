<?php

require_once('connect.php');

$deleteId = $_POST['id'];

$stmt = $db->prepare("DELETE FROM Food WHERE FoodID=?");
$stmt->execute([$deleteId]);

$count = $stmt->rowCount();
$result = array();

if(!$count) {
	$result['code'] = '0';
	$result['message'] = 'Foreign key constraints failed as food item exists in some orders or the item simply does not exist.';
} else {
	$result['code'] = '1';
	$result['message'] = 'Deleted food item successfully.';
}

echo json_encode($result);
