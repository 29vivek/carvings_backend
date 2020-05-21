<?php

require_once('connect.php');

$ids = $_POST['ids'];
$format = implode(',' , $ids);

$sql = "SELECT Availability FROM Food WHERE FoodID IN ( $format )";

$stmt = $db->prepare($sql);
$stmt->execute();

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
