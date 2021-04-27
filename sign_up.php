<?php
  session_start();

  require_once "util.php";

  if(isset($_POST['full_name']) && $_POST['email_id'] && isset($_POST['password'])) {

  if ( strlen($_POST['full_name']) < 1 || strlen($_POST['email_id']) < 1 || strlen($_POST['password']) < 1 )
    {
      $_SESSION['message'] = "Please Fill in All the Details";
      header("Location: sign.php");
      return;
    }
  else
    {
      $date = date("yy-m-d");
      $password = hash('md5', $_POST['password']);
      $stmt = $pdo->prepare('INSERT INTO user_master (email_id,password,full_name,role_id,effective_from_dt) values (:email_id,:password,:full_name,:role_id,:effective_from_dt)');
      $stmt->execute(array(
      ':email_id'=>$_POST['email_id'],
      ':password'=>$password,
      ':full_name'=>$_POST['full_name'],
      ':role_id'=>2,
      ':effective_from_dt'=>$date));

      $_SESSION['user_id']=$pdo->lastInsertId();
      $_SESSION['email_id'] = $_POST['email_id'];
      $_SESSION['full_name'] = $_POST['full_name'];
      $_SESSION['role_id'] = 2;

      header('Location: search.php');
      return;
    }
    }
?>
