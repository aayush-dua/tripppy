<?php
$pdo = new PDO('mysql:host=localhost;port=3306;dbname=trip_booking',
   'leno', 'admin');
// See the "errors" folder for details...
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
