<?php
require_once "../pdo.php";
require_once "style.php";
function flashMessages() {
  if(isset($_SESSION['error']))
  {
    echo '<p style="color:red">'.$_SESSION['error']."</p>\n";
    unset($_SESSION['error']);
  }
  if(isset($_SESSION['success']))
  {
    echo '<p style="color:green">'.$_SESSION['success']."</p>\n";
    unset($_SESSION['success']);
  }
}

function display_message() {
  if(isset($_SESSION['message'])) {
    $msg = $_SESSION['message'];
    echo "<script type='text/javascript'>alert('$msg');</script>";
    unset($_SESSION['message']);
  }
}

function check_logged_in() {
  if(!isset($_SESSION['user_id'])) {
    die('ACCESS DENIED PLEASE LOG IN FIRST');
    return;
  }
}
function load_role($pdo,$user_id) {
  $stmt = $pdo->prepare(
    "SELECT role_id
     FROM user_role_assign
     WHERE user_id = :user_id");

  $stmt->execute(array(":user_id" => $user_id));
  $role = $stmt->fetch(PDO::FETCH_ASSOC);
  return $role;
}
function get_screen_id($pdo,$screen_name) {
  $stmt = $pdo->prepare(
    "SELECT screen_id
     FROM screen_master
     WHERE screen_name = '".$screen_name."'");

  $stmt->execute(array());
  $row = $stmt->fetch(PDO::FETCH_ASSOC);
  $screen_id = $row['screen_id'];

  return $screen_id;
}
function load_screens($pdo,$role_id) {
  $stmt = $pdo->prepare(
    "SELECT screen_id
     FROM screen_permissions
     WHERE role_id = :role_id");

  $stmt->execute(array(':role_id'=>$role_id));
  $screens = $stmt->fetchAll(PDO::FETCH_ASSOC);

  return $screens;
}
function check_screen_permission($pdo,$screen_id,$role_id) {
  $screens = load_screens($pdo,$role_id);
  $flag = 0;
  foreach($screens as $screen){
    if($screen['screen_id'] == $screen_id){
      $flag = 1;
      break;
    }
  }
  return $flag;
}
function allowed_or_not($check){
  if($check == 0){
    //die("Access Denied");
    $_SESSION['error'] = "Access to this page is denied";
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    return;
  }
}
