<?php
  session_start();

  require_once "util.php";

  if(isset($_POST['email_id']) && isset($_POST['password'])) {

  if ( strlen($_POST['email_id']) < 1 || strlen($_POST['password']) < 1 )
    {
      $_SESSION['message'] = "Username and Password are required";
      header("Location: sign.php");
      return;
    }
  else
    {
      $check = hash('md5', $_POST['password']);
      $stmt = $pdo->prepare('SELECT user_id,full_name FROM user_master WHERE email_id = :email_id AND password = :password AND effective_end_dt IS NULL');
      $stmt->execute(array(':email_id'=>$_POST['email_id'], ':password'=>$check));
      $row = $stmt->fetch(PDO::FETCH_ASSOC);

          if($row !== false)
          {
            $_SESSION['email_id'] = $_POST['email_id'];
            $_SESSION['user_id'] = $row['user_id'];
            $_SESSION['full_name'] = $row['full_name'];
            $_SESSION['role_id'] = $role['role_id'];

            header('Location: search.php');
            return;
          }
          else
          {
            $_SESSION['Message'] = "Incorrect Username or Password";
            header("Location: sign.php");
            return;
          }
    }
  }
?>
