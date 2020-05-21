<?php

require_once('connect.php');

$foodId = $_POST['id'];

if($foodId) {  
	$name = $_POST['name'];
	if($name != '') {
		$db->prepare("UPDATE Food SET Name=? WHERE FoodID=?")->execute([$name, $foodId]);
	}
	$price = $_POST['price'];
	if($price != '') {
		$db->prepare("UPDATE Food SET Price=? WHERE FoodID=?")->execute([$price, $foodId]);	
	}
	$categoryId = $_POST['categoryId'];
	$db->prepare("UPDATE Food SET CategoryID=? WHERE FoodID=?")->execute([$categoryId, $foodId]);
		
}
else {
	$name = $_POST['name'];
	$price = $_POST['price'];
	$categoryId = $_POST['categoryId'];
	
	$sql = "INSERT INTO Food (FoodID, Name, Price, CategoryID) VALUES (NULL, ?, ?, ?)";
	$stmt = $db->prepare($sql);
	$stmt->execute([$name, $price, $categoryId]);
}

$result = array();
$result['code'] = '1';
$result['message'] = 'Operation completed successfully.';
echo json_encode($result);
