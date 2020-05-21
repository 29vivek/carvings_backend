<?php

function in_array_all($value, $array)
{
    return (reset($array) == $value && count(array_unique($array)) == 1);
}

require_once('connect.php');

$items = $_POST['items'];

$itemsAsInts = array_map('intval', $items);
$userId = intval($_POST['user']);
$number = intval($_POST['number']);
$total = intval($_POST['total']);

$foodIds = array_keys($itemsAsInts);
$format = implode(',' , $foodIds);

$sqltoo = "SELECT Availability FROM Food WHERE FoodID IN ( $format )";

$stmt = $db->prepare($sqltoo);
$stmt->execute();

$result = $stmt->fetchAll(PDO::FETCH_COLUMN);

$canProceed = in_array_all(1, $result) && count($result) == count($foodIds);

$return = array();

if($canProceed) {

    $queryone = $db->prepare("INSERT INTO Orders (OrderID, UserID, NumberOfOrderItems, OrderTotal) VALUES (NULL, ?, ?, ?)");
    $queryone->execute([$userId, $number, $total]);
    
    $orderId = $db->lastInsertId();
    
    $querytwo = $db->prepare("INSERT INTO OrderItem (OrderItemID, OrderID, FoodID, Quantity) VALUES (NULL, ?, ?, ?)");
    foreach($itemsAsInts as $foodId => $qty) {
        $querytwo->execute([$orderId, $foodId, $qty]);
    }

    $return['code'] = '1';
    $return['message'] = "Order placed successfully for a total of ₹{$total}";
    echo json_encode($return);

} else {
    $return['code'] = '0';
    $return['message'] = "One or more of your cart items is currently unavailable or permanently deleted. We can't tell you which ones though.";
    echo json_encode($return);
}
