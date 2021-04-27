<?php
session_start();

// $company_id = $_SESSION['company_id'];
$user_id = $_SESSION['user_id'];
require_once "util.php";

if($user_id != 1 || $user_id == NULL){
  die("You do not have permission to access this page");
  return;
}

$stmt = $pdo->query("SELECT country_id,country_name
                     FROM country_master");
$countries = $stmt->fetchAll(PDO::FETCH_ASSOC);


  //echo "<script>alert($_SESSION['message'])</script>";
//allowed_or_not(check_location_permission($pdo,get_location_id($pdo,basename($_SERVER['PHP_SELF']),$_SESSION['role_id']),$_SESSION['role_id']) );

//Loads the inactive address if the inactive_records_selection is set, else loads only the active records
if(isset($_SESSION['inactive_records_selection'])){
  $stmt = $pdo->query("SELECT location_id,location_name,narration,effective_from_dt,effective_end_dt
                       FROM location_master
                       ORDER BY effective_end_dt DESC");
  $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
  unset($_SESSION['inactive_records_selection']);
}
else{
  $stmt = $pdo->query("SELECT location_id,location_name,narration,effective_from_dt,effective_end_dt
                       FROM location_master
                       WHERE effective_end_dt IS NULL
                       ORDER BY location_name ASC");
  $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//IF THE SHOW INACTIVE RECORDS BUTTON IS CLICKED
if(isset($_POST['inactive_records_selection'])){
  $_SESSION['inactive_records_selection'] = "yes";
  header('Location: location_master.php');
  return;
}

//If make the selected locations inactive button is clicked
if(isset($_POST['set_inactive'])){
  if(isset($_POST['delete'])){
    $date = date("yy-m-d");
    foreach($_POST['delete'] as $deleteid){
      $sql = "UPDATE location_master
              SET effective_end_dt = :effective_end_dt
              WHERE location_id = ".$deleteid;
      $stmt = $pdo->prepare($sql);
      $stmt->execute(array(
        ':effective_end_dt' =>$date ));
      }
        $_SESSION['message']='Selected locations Set Inactive';
        //$_SESSION['inactive_records_selection'] = "yes";
        header('Location: location_master.php');
        return;
    } else{
      $_SESSION['message']='No locations are Chosen to Set Inactive';
      header('Location: location_master.php');
      return;
    }
}
//IF THE MAKE CHANGES BUTTON IS CLICKED
if(isset($_POST['edit'])) {
  if(isset($_POST['delete'])) {
    foreach($_POST['delete'] as $deleteid){
      $location_name = $_POST['location_name'.$deleteid.''];
      $narration = $_POST['narration'.$deleteid.''];
      $sql = "UPDATE location_master
              SET location_name = :location_name,
                  narration = :narration
              WHERE location_id = ".$deleteid;
      $stmt = $pdo->prepare($sql);
      $stmt->execute(array(
        ':location_name' => $location_name,
      ':narration' => $narration));
    }
    $_SESSION['message'] = "Changes are saved";
    header('Location: location_master.php');
    return;
  }
  else {
    $_SESSION['message']='No locations are Chosen to make changes';
    header('Location: location_master.php');
    return;
  }
}

?>
<html>
<head>
  <title>location Master</title>
</head>
<body class="fourth_color">

  <div id="navbar"></div>
  <div class="bg-dark text-light" style="padding:10px">
  <h3>Location Master</h3>
</div>

<!--<form id="new_location_div" class="fourth_color" name="add_location_form" method="post">

    <div id="add_location_heading" class="text-center first_color">
      <h5>Add locations</h5>
   </div>
   <div id="add_new_location_div">

   </div>

   <input type="hidden" name="location_count" id="location_count" value=""></input>

   <div id="make_changes_button" class="text-center fourth_color">
     <button class="btn btn-warning" name="add_locations_button"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save Changes</button>
   </div>

</form>-->
<form method="post" action="add_location.php" enctype="multipart/form-data">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">Add Location</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
       <div class="form-group">
         <label for="location_name" class="col-form-label">Location Name:</label>
         <input type="text" class="form-control" id="location_name" name="location_name">
       </div>
       <div class="form-group">
         <label for="image_file" class="col-form-label">Upload Image:</label>
         <input type="file" class="form-control" id="image_file" name="image_path">
       </div>
       <div class="form-group">
         <label for="country_name" class="col-form-label">Country:</label>
         <!-- <input type="" class="form-control" id="country_name" name="country_name"> -->
         <select name="country_id" class="form-control">
           <?php foreach($countries as $country): ?>
           <option value="<?= $country['country_id']?>"><?= $country['country_name']?></option>
         <?php endforeach; ?>
          </select>
       </div>
       <div class="form-group">
         <label for="narration" class="col-form-label">Description:</label>
         <textarea class="form-control" id="narration" name="narration"></textarea>
       </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div>
      <button type="submit" class="btn btn-primary">Add Location</button>
    </div>
  </div>
</div>
</div>
</form>

<div class="bg-light" style="padding:10px;">
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
</div>

<form name="location_master_view" method="post">
  <div id="screen_table">
  <table class="table table-bordered table-striped table-hover">
    <thead class="thead-dark">
    <tr>
      <th scope="col" class="text-center"><i class="fa fa-check" aria-hidden="true"></i></th>
      <th scope="col"><b>location ID</b></th>
      <th scope="col"><b>location Name</b></th>
      <th scope="col"><b>Description</b></th>
      <th scope="col"><b>Effective From Date</b></th>
      <th scope="col"><b>Effective End Date</b></th>
    </tr>
  </thead>

  <tbody id="myTable" class="fourth_color">
  <?php foreach ( $rows as $row ): ?>

    <?php
      if(isset($row['effective_end_dt'])){
        $active = "disabled";
      } else{
        $active = "";
      }
    ?>
      <tr>
        <th scope="row"><input type="checkbox" <?= $active ?> class="form-control-xs" name='delete[]' id="location_id<?= $row['location_id'] ?>" value='<?= $row['location_id'] ?>' ></td>

      <td>
        <?= htmlentities($row['location_id']) ?>
      </td>

        <td hidden><?= htmlentities($row['location_name']) ?></td>
        <td><input type="text" maxlength="50" <?= $active ?> required onchange="check('location_id<?= $row['location_id'] ?>')" class="form-control-sm" id="location_name<?= $row['location_id'] ?>" name="location_name<?= $row['location_id'] ?>" value="<?= htmlentities($row['location_name']) ?>"></input></td>

          <td><input type="text" maxlength="256" <?= $active ?> required onchange="check('location_id<?= $row['location_id'] ?>')" class="form-control-sm"  name="narration<?= $row['location_id'] ?>" value="<?= htmlentities($row['narration']) ?>"></input></td>

        <td><?= htmlentities($row['effective_from_dt']) ?></td>
        <td><?= htmlentities($row['effective_end_dt']) ?></td>
      </tr>
  <?php endforeach;  ?>
</tbody>
  </table>

  <script>
  $(document).ready(function(){
    $("#myInput").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#myTable tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
  });
</script>
</div>

<div id="button_field" class="text-center text-white a fourth_color clear">
  <button type="submit button" class="btn btn-success" name="edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Make Changes To Selected Records</button>
  <button id="inactive_records_selection" name="inactive_records_selection" type="submit" class="btn btn-warning"><i class="fa fa-eye" aria-hidden="true"></i> Show inactive records</button>
  <!-- <button type="button" id="new_location" class="btn btn-info"><i class="fa fa-plus" aria-hidden="true"></i> Add new locations </button> -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Add New Locations
</button>
  <button type="submit button" class="btn btn-danger" name="set_inactive"><i class="fa fa-trash fa-lg" aria-hidden="true"></i> Make Selected Records Inactive</button>
  <button type="button" class="btn btn-primary"><a href="field_master.php" class="text-white"><i class="fa fa-arrow-right" aria-hidden="true"></i> Next</a></button>
</div>
</form>

<script>
/*var location_count = 1;
var temp_location_count = 1;

  $('#new_location').click(function(event){
    event.preventDefault();
    document.getElementById("new_location_div").style.display = "block";
    document.getElementById("add_location_heading").style.display = "block";
    document.getElementById("make_changes_button").style.display = "block";
    document.getElementById("location_count").value = location_count;
    //document.getElementById("address_count").value=location_count;
    console.log("location block "+location_count);
    var source=$("#add_location_template").html();
    $('#add_new_location_div').append(source.replace(/@COUNT@/g,location_count));
    location_count++;
    temp_location_count++;

  });*/
</script>

<!--<script id="add_location_template" type="text">
<div class="form-group row add_location_row" id="@COUNT@">
   <label for="location_name@COUNT@" class="col-sm-4 col-form-label"><i class="fa fa-angle-right" aria-hidden="true"></i> location Name</label>
   <div class="col-sm-7">
     <input type="text" class="form-control" name="location_name@COUNT@" id="location_name@COUNT@" required placeholder="location Name">
   </div>
   <div class="col-sm-1">
   <i class="fa fa-trash fa-lg" onclick="remove_element(@COUNT@)" style="margin-top:13px;" aria-hidden="true"></i>
   </div>
 </div>
</script>-->
</body>
<?php display_message();?>
</html>
