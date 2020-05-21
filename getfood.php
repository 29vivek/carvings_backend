<?php

require_once('connect.php');

$canteenId = $_POST['canteenId'];

$sql = "SELECT f.FoodID, f.Name, f.Price, f.Availability, f.Rating, f.NumberRatings, cat.CategoryName, c.CanteenName FROM Food f INNER JOIN Categories cat ON (cat.CategoryID = f.CategoryID) AND (cat.CanteenID = ?) INNER JOIN Canteen c ON (cat.CanteenID = c.CanteenID) ORDER BY cat.CategoryName";

$stmt = $db->prepare($sql);
$stmt->execute([$canteenId]);

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$query = "SELECT DISTINCT CategoryName FROM Categories WHERE CanteenID=?";

$anotherstmt = $db->prepare($query);
$anotherstmt->execute([$canteenId]);
$anotherresult = $anotherstmt->fetchAll(PDO::FETCH_COLUMN);

$return = [
	'categories' => $anotherresult,
	'items' => $result
];

echo json_encode($return);
