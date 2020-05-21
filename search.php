<?php

require_once('connect.php');

$keyword = $_POST['keyword'];

$sql = "SELECT f.FoodID, f.Name, f.Price, f.Availability, f.Rating, f.NumberRatings, cat.CategoryName, c.CanteenName FROM Food f INNER JOIN Categories cat ON (cat.CategoryID = f.CategoryID) AND (f.Name LIKE ?) INNER JOIN Canteen c ON (cat.CanteenID = c.CanteenID)";

$stmt = $db->prepare($sql);
$stmt->execute(["%$keyword%"]);

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
