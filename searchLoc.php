<?php
session_start();
require_once "pdo.php";

    $locName = $_REQUEST['locName'];
    echo($locName);
    $stmt = $pdo->query("SELECT location_id
            FROM location_master
            WHERE location_name = '$locName'");
    $location = $stmt->fetch(PDO::FETCH_ASSOC);
    if(empty($location)){
      $_SESSION['message'] = "No data found for : ".$locName;
      header('Location: search.php');
      return;
    }
    header('Location: display.php?location_id='.$location['location_id']);
?>
