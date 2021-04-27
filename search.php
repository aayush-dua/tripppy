<?php
session_start();

require_once "util.php";

$stmt = $pdo->query("SELECT location_id,location_name,location_image_path
                     FROM location_master");
$locations = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Tripppy</title>
</head>
<body>
    <div class="main">
        <div class="gradient">
            <section>
                <div class="left_image_slide">
                </div>
                <div class="search_box">
                    <div class="nav">
                        <div class="logo">
                            <img src = "images/travel_logo.svg">
                        </div>
                        <div class="username">
                            <?= $_SESSION['full_name'];?>
                            <div class="logout">
                               <a href="logout.php"> Logout</a>
                            </div>
                        </div>
                    </div>
                    <div class="header">Where are you planning to go?</div>
                    <form action="searchLoc.php" method="post">
                    <div class="search">
                    <input type="text" class="searchTerm" placeholder="Kodaikanal" name="locName">
                    <input type="hidden" name="locId">
                    <!--<select name="location_id" class="">
                      <?php foreach($locations as $location): ?>
                        <option class="searchItem" value="display.php"><?= $location['location_name']?></option>
                      <?php endforeach; ?>
                    </select>-->
                        <button type="submit" class="searchButton">
                          <i class="fa fa-search"></i>
                    </button>
                    </div>
                  </form>


                     <div class="header header2">Or visit one of the most popular destinations</div>
                     <div class="row">
                       <?php foreach($locations as $location): ?>
                         <a href="display.php?location_id=<?= $location['location_id']?>">
                        <div class="column c1" style="background-image:url('<?= $location['location_image_path']?>')">
                            <?= $location['location_name'] ?>
                        </div>
                        </a>
                      <?php endforeach; ?>

                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
<link href="searchstyle.css" rel="stylesheet">
<?php display_message();?>
</html>
