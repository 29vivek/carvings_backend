<?php

require_once('connect.php');

$email = $_POST['email'];
$name = $_POST['name'];
$number = $_POST['number'];

if(!empty($name)) {
	$query = "UPDATE Users SET Name=? WHERE Email=?";
	$db->prepare($query)->execute([$name, $email]);
}
if(!empty($number)) {
	$query = "UPDATE Users SET Number=? WHERE Email=?";
	$db->prepare($query)->execute([$number, $email]);
}

$sql = "SELECT * FROM Users WHERE Email=:email";
$data = ['email' => $email];
$stmt = $db->prepare($sql);
$stmt->execute($data);

$result = $stmt->fetch(PDO::FETCH_ASSOC);
$response = array();
$response['code'] = '1';
$response['messaged'] = 'Details updated successfully.';
echo json_encode(array_merge($result, $response));
