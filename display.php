<?php
session_start();

require_once "util.php";
$location_id = $_REQUEST['location_id'];
$stmt = $pdo->query("SELECT location_name,narration
                     FROM location_master
                     WHERE location_id = ".$location_id);
$location = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $pdo->query("SELECT hotel_id,hotel_name,hotel_description,phone_no,hotel_image_path,hotel_rating,hotel_cost
                     FROM hotel_master
                     WHERE location_id = ".$location_id);
$hotels = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="displaystyle.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
</head>
<body>
    <div class="main">
        <div class="gradient">
            <section>
            <div class="nav">
                <div class="back">
                  <a href="search.php">
                    <i class="fa fa-angle-left fa-3x"></i>
                  </a>
                  </div>
                <div class="logo"><img src="images/travel_logo.svg"></div>
                <div class="username">
                    <?= $_SESSION['full_name'] ?>
                            <div class="logout">
                               <a href="sign.html"> Logout</a>
                            </div>
                </div>
            </div>
            <div class="panes">
            <div class="left_pane">
               <div class="spacing">
               </div>
               <div id="left_content">
                   <h1><?= $location['location_name']?></h1>
                   <p><?= $location['narration']?></p>
                   <button  id="exp_btn">
                     Experiences
                   </button>
               </div>
               <div class="exp_cards">
                <div class="row">
                    <div class="column c1">
                        Trekking
                    </div>
                    <div class="column c2">
                        Camping
                    </div>
                    <div class="column c3">
                        Boating
                    </div>
                    <div class="column c4">
                        Rope Walk
                    </div>


               </div>
            </div>
            </div>

            <div class="right_pane">
            <div class="hotel_nav">
               <h1> Hotels</h1>
               <div class="filter"><label>Filter By Price</label>
                <select>
                  <option value="3" name="$$$">$$$</option>
                  <option value="2" name="$$">$$</option>
                  <option value="1" name="$">$</option>
                </select>
            </div>
            </div>

               <div class="hotel_cards">
                 <?php foreach($hotels as $hotel):?>
                   <?php
                   $stmt = $pdo->query("SELECT address
                                        FROM hotel_address
                                        WHERE hotel_address_id = ".$hotel['hotel_id']);
                   $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
                   ?>
                    <div class="cards">
                        <div class="hotel_image"><img src="<?= $hotel['hotel_image_path']?>"></div>
                        <div class="hotel_content">
                        <div class="top">
                          <h1 class="hotel_name"><?= $hotel['hotel_name']?></h1>
                            <div class="star_rating">
                              <?php
                              $rating = $hotel['hotel_rating'];
                              while($rating--):
                              ?>
                                <i class="fa fa-star"></i>
                              <?php endwhile; ?>
                            </div>
                        </div>
                        <p class="hotel_desc"><?= $hotel['hotel_description']?></p>
                        <?php foreach($rows as $row): ?>
                          <h5 class="hotel_add"><i class="fa fa-address-card"></i><?= $row['address'] ?></h5>
                        <?php endforeach; ?>
                          <h5 class="phone"><i class="fa fa-phone"></i><?= $hotel['phone_no']?></h5><br>
                          <div class="hotel_footer">
                              <div class="features">
                                <!--
                                    <div class="feat">Concierge</div>
                                    <div class="feat">Spa</div>
                                    <div class="feat">Bonfire</div>-->
                              </div>
                              <div class="price">
                                  $ <?= $hotel['hotel_cost']?>
                              </div>
                          </div>
                        </div>
                    </div>
                  <?php endforeach;?>
               </div>
            </div>
        </div>
            </section>
        </div>
    </div>


    <script>
        $(document).ready(function(){
        $('#exp_btn').click(function(){
            $('#left_content').css("transform","translate(0,-50px)");
            $('.exp_cards').slideToggle( {duration:800});
        });
        });
    </script>
</body>
</html>
