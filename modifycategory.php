<?php

require_once('connect.php');

$id = $_POST['id'];
$canteenId = $_POST['canteenId'];
$name = $_POST['name'];

$result = array();

if(!empty($id)) {
	$stmt = $db->prepare("DELETE FROM Categories WHERE CategoryID=?");
	$stmt->execute([$id]);
	$count = $stmt->rowCount();
	if(!$count) {
		$result['code'] = '0';
		$result['message'] = 'No categories were deleted since food which is was a part of this category are present in an order!';
	}
	else {
		$result['code'] = '1';
		$result['message'] = 'Category deleted successfully!';
	}
} else if(!empty($canteenId)) {
	$db->prepare("INSERT INTO Categories (CategoryID, CategoryName, CanteenID) VALUES (NULL, ?, ?)")->execute([$name, $canteenId]);
	$result['code'] = '1';
	$result['message'] = 'Category added successfully!';
}

echo json_encode($result);
