<!DOCTYPE html>
<html lang="en">
<head>
    <link href="signstyle.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,700;1,400&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="main">
        <div class="gradient">
            <section>
                <div class="vertical"></div>


            <nav>
                <div class="logo">
                    <img src="images/travel_logo.svg">
                </div>
            </nav>
            <div class="sub_signin">
                <div class="signin">
                    <form method="post" action="login.php">
                    <div class="sign_sections header ">
                        <a class="link">Sign In</a>
                    </div>
                    <div class="sign_sections">
                        <input name="email_id" type="email" placeholder="Enter email..." onfocus="this.value=''" class="text">
                    </div>
                    <div class="sign_sections">
                        <input name="password" type="password" placeholder="Password" onfocus="this.value=''" class="text">
                    </div>
                    <div class="sign_sections">
                        <input type="submit" class="text submit">

                    </div>
                </form>
                </div>
                <div class="signup">
                    <form method="post" action="sign_up.php">
                        <div class="sign_sections header">
                            Sign Up
                        </div>

                        <div class="sign_sections">
                            <input name="full_name" type="text" placeholder="Full Name"  class="text">
                        </div>
                        <div class="sign_sections">
                            <input name="email_id" type="email" placeholder="Enter email..."  class="text">
                        </div>
                        <div class="sign_sections">
                            <input name="password" type="password" placeholder="Password"  class="text">
                        </div>
                        <div class="sign_sections">
                            <input type="submit" class="text submit">
                        </div>
                    </form>
                </div>
            </div>
            </section>
        </div>
    </div>
    <!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="/__/firebase/8.3.1/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="/__/firebase/8.3.1/firebase-analytics.js"></script>

<!-- Initialize Firebase -->
<script src="/__/firebase/init.js"></script>
<?php display_message(); ?>
</body>
</html>
