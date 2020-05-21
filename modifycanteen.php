<?php

require_once('connect.php');

$name = $_POST['name'];
$desc = $_POST['description'];
$id = $_POST['canteenId'];

if($name != '')
	$db->prepare("UPDATE Canteen SET CanteenName=? WHERE CanteenID=?")->execute([$name, $id]);
if($desc != '')
	$db->prepare("UPDATE Canteen SET CanteenDescription=? WHERE CanteenID=?")->execute([$desc, $id]);

$result = array();
$result['code'] = '1';
$result['message'] = 'Updated details successfully.';

echo json_encode($result);
