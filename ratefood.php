<?php

require_once('connect.php');

$orderItemId = $_POST['orderItemId'];
$rating = $_POST['rating'];

$sql = $db->prepare("UPDATE OrderItem SET DidRateFood=? WHERE OrderItemID=?");
$sql->execute([$rating, $orderItemId]);

$sqltoo = $db->prepare("SELECT FoodID FROM OrderItem WHERE OrderItemID = ?");
$sqltoo->execute([$orderItemId]);
$restoo = $sqltoo->fetch(PDO::FETCH_ASSOC);

$foodId = $restoo['FoodID'];

$sqlthree = $db->prepare("SELECT Rating, NumberRatings FROM Food WHERE FoodID = ?");
$sqlthree->execute([$foodId]);

$resthree = $sqlthree->fetch(PDO::FETCH_ASSOC);

$currating = $resthree['Rating'];
$number = $resthree['NumberRatings'];

$newrating = (($currating * $number) + $rating) / ($number + 1.0);
$newnumber = $number + 1;

$sqlfour = $db->prepare("UPDATE Food SET Rating = ?, NumberRatings = ? WHERE FoodID = ?");
$sqlfour->execute([$newrating, $newnumber, $foodId]);

$result = array();

$result['code'] = '1';
$result['message'] = 'Rated food successfully.';

echo json_encode($result);
