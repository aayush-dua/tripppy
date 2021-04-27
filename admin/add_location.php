<?php
//ADD NEW locationS TO THE location MASTER
session_start();
require_once "../pdo.php";

    $date = date("yy-m-d");
    $target_dir = "/tripppy/images/";
    $target_file = $target_dir . basename($_FILES["image_path"]["name"]);
    $file_name = $_FILES["image_path"]['name'];
      $file_size =$_FILES["image_path"]['size'];
      $file_type=$_FILES["image_path"]['type'];
      $file_tmp =$_FILES["image_path"]['tmp_name'];

      $file_ext = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
      // $tmp = strtolower(explode('.',$_FILES["image_path"]['name']));
      // $file_ext = end($tmp);
      $ext = "png";
      $ext2 = "jpg";
      $ext3 = "jpeg";
      if(strcmp($file_ext,$ext) != 0 && strcmp($file_ext,$ext2) != 0 && strcmp($file_ext,$ext3) != 0){
         $_SESSION['message'] = "Extension not allowed, please choose an image file.";
         header('Location: location_master.php');
         return;
      }

      // if(!move_uploaded_file($file_tmp,__DIR__.'\images'. $_FILES["image_path"]['name']) ){
        // echo("Problem in uploading file");
        // return;
      // }
      move_uploaded_file($file_tmp,$target_dir.$file_name);
      // move_uploaded_file($file_tmp,__DIR__.'/images/'. $_FILES["image_path"]['name']);

    /*$stmt = $pdo->prepare('SELECT country_id FROM country_master WHERE country_name=:name');
        $stmt->execute(array(':name'=>$_POST['country_id']));
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if( $row !== false ) {
            $country_id = $row['country_id'];
          } else {
            $_SESSION['error'] = "Choose an appropriate Country from the list given";
            header('Location: location_master.php');
            return;
          }*/

    $duplicate_link = "images/bg.jpg";
    $sql = "INSERT INTO location_master
             (location_name,location_image_path,country_id,narration,effective_from_dt)
             VALUES
             (:location_name,:location_image_path,:country_id,:narration,:effective_from_dt)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(
      ':location_name' =>$_POST['location_name'],
      ':location_image_path' =>$duplicate_link,
      ':country_id' =>$_POST['country_id'],
      ':narration' =>$_POST['narration'],
      ':effective_from_dt' =>$date
      ));

  $_SESSION['message']='locations Added';
  header('Location: location_master.php');
  return;
?>
