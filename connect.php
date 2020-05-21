<?php

$dns = 'mysql:host=localhost;dbname=carvings';
$user = 'root';
$pass = 'bravosix';

try {
	$db = new PDO($dns, $user, $pass);
	$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    date_default_timezone_set('Asia/Kolkata');
} catch(PDOException $e) {
	$error = $e->getMessage();
	echo $error;
}
