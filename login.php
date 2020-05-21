<?php

require_once('connect.php');

$email = $_POST['email'];
$password = $_POST['password'];

$statement = $db->prepare("SELECT * FROM Users WHERE Email = :email");
$statement->execute(['email' => $email]);

$result = $statement->fetch(PDO::FETCH_ASSOC);

$response = array();

if($statement->rowCount() > 0) {
	if(password_verify($password, $result['Password'])) {
		$response['code'] = '1';
		$response['message'] = 'Logged in successfully.';
		echo json_encode(array_merge($result, $response));
	} else {
		$response['code'] = '0';
		$response['message'] = 'Incorrect password.';
		echo json_encode($response);		
	}
} else {
	$response['code'] = '0';
	$response['message'] = 'No user found.';
	echo json_encode($response);
}
