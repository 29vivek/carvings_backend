<?php

require_once('connect.php');

$foodIds = $_POST['ids'];
$format = implode(',' , $foodIds);

$sql = "SELECT f.FoodID, f.Name, f.Price, f.Availability, f.Rating, f.NumberRatings, cat.CategoryName, c.CanteenName FROM Food f INNER JOIN Categories cat ON (cat.CategoryID = f.CategoryID) AND FoodID IN ($format) INNER JOIN Canteen c ON (cat.CanteenID = c.CanteenID)";

$stmt = $db->prepare($sql);
$stmt->execute();

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
