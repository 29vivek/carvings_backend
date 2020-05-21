<?php

require_once('connect.php');

$valueToBeSet = $_POST['value'];
$foodId = $_POST['id'];

if($foodId) {
	$sql = "UPDATE Food SET Availability=? WHERE FoodID=?";
	$stmt = $db->prepare($sql);
	$stmt->execute([$valueToBeSet, $foodId]);
} else {
	$sql = "UPDATE Food SET Availability=?";
	$stmt = $db->prepare($sql);
	$stmt->execute([$valueToBeSet]);
}

$result = array();

$result['code'] = '1';
$result['message'] = 'Toggled successfully.';

echo json_encode($result);
