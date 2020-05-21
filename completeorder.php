<?php

require_once('connect.php');

$orderId = $_POST['id'];

if(!empty($orderId)) {
	$db->prepare("UPDATE Orders SET OrderStatus='Completed' WHERE OrderID=?")->execute([$orderId]);
} else {
	$db->prepare("UPDATE Orders SET OrderStatus='Completed'")->execute();
}

$result = array();
$result['code'] = '1';
$result['message'] = 'Marked completed successsfully.';

echo json_encode($result);
