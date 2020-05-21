<?php

require_once('connect.php');

$userId = $_POST['userId'];
$filter = $_POST['filter'];
$which = $_POST['which'];

$result = array();

if(!empty($which)) {
    if($filter == 'Today') {
        $date = date("Y-m-d");
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE OrderStatus = ? AND OrderTime = ? ORDER BY OrderID Asc");
        $sql->execute([$which, $date]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    } else if($filter == 'This Month') {
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE OrderStatus = ? AND OrderTime BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE() ORDER BY OrderID Asc");
        $sql->execute([$which]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE OrderStatus = ? ORDER BY OrderID Asc");
        $sql->execute([$which]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }
}
else if(!empty($userId)) {
    if($filter == 'Today') {
        $date = date("Y-m-d");
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE UserID = ? AND OrderTime = ? ORDER BY OrderID Desc");
        $sql->execute([$userId, $date]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    } else if($filter == 'This Month') {
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE UserID = ? AND OrderTime BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE() ORDER BY OrderID Desc");
        $sql->execute([$userId]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $sql = $db->prepare("SELECT OrderID, OrderTotal, OrderTime, OrderStatus FROM Orders WHERE UserID = ? ORDER BY OrderID Desc");
        $sql->execute([$userId]);
        $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    }
}

foreach($result as &$order) {
    $query = $db->prepare("SELECT o.OrderItemID, f.FoodID, f.Name, f.Price, o.Quantity, c.CanteenName, o.DidRateFood FROM OrderItem o INNER JOIN Food f ON (o.FoodID = f.FoodID) INNER JOIN Categories cat ON (f.CategoryID = cat.CategoryID) INNER JOIN Canteen c ON (cat.CanteenID = c.CanteenID) AND o.OrderID = ?");
    $query->execute([$order['OrderID']]);
    $items = $query->fetchAll(PDO::FETCH_ASSOC);
    $order['Items'] = $items; 

}

echo json_encode($result);
