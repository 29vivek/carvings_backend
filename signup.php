<?php

require_once('connect.php');

$email = $_POST['email'];
$name = $_POST['name'];
$number = $_POST['number'];
$password = $_POST['password'];


$check = $db->prepare("SELECT * FROM Users WHERE Email = :email");
$check->execute(['email' => $email]);

$response = array();

if($check->rowCount() > 0) {
	$response['code'] = '0';
	$response['message'] = 'Email already exists.';
	echo json_encode($response);
} else {
	$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

	$statement = $db->prepare("INSERT INTO Users (UserID, Email, Name, Number, Password) VALUES (NULL, :email, :name, :number, :password)");
	$data = [
		'email' => $email,
		'name' => $name,
		'number' => $number,
		'password' => $hashedPassword
	]; 
	$statement->execute($data);

	$response['UserID'] = intval($db->lastInsertId());
	$response['code'] = '1';
	$response['message'] = 'Signed up successfully.';
	
	echo json_encode($response);
}
