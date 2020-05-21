<?php

require_once('connect.php');

$sql = "SELECT * FROM Canteen";

$stmt = $db->prepare($sql);
$stmt->execute();

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach($result as &$canteen) {
    $query = $db->prepare("SELECT CategoryID, CategoryName FROM Categories WHERE CanteenID = ?");
    $query->execute([$canteen['CanteenID']]);
    $restoo = $query->fetchAll(PDO::FETCH_ASSOC);
    $canteen['Categories'] = $restoo;
}

echo json_encode($result);
