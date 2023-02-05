<?php session_start();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>myborders</title>
    <link rel="stylesheet" href="../resource/css/new_home.css">
    <link rel="stylesheet" href="../resource/css/all.css">
    <link rel="stylesheet" href="../resource/css/sidebar2.css">
    <link rel="stylesheet" href="../resource/css/boardings_live.css">


    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->
    <!-- <link rel="stylesheet" href="../resource/css/myboarders1.css"> -->
    <link rel="stylesheet" href="../resource/css/myBoardingPost.css">
    <link rel="stylesheet" href="../resource/css/extra.css">
</head>

<body>
    <?php require "header1.php" ?>
    <div class="container1">

        <div class="container2">
            <div class="sidebar_b">
                <?php require "sidebar1.php" ?>
            </div>
            <div class="middle_b">
                <h1>MY BOARDING POST LISTS</h1>
                <div class="mid_C">
                    <div style="display:flex; justify-content:space-between;">
                        <h3>List view</h3>
                    </div>
                    <hr />
                    <div class="list_view">
                        <div>
                            <div class="outer_result_block">
                                <div id="result"></div>

                            </div>
                            <div class="right_bar">
                                <!-- right bar -->
                            </div>
                            <div class="popup_signin">
                                <a href="../views/register.php">
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- ********************sidebar ************************************************ -->
    <script>
        // $('.btn').click(function(){
        //   $(this).toggleClass("click");
        $('.sidebar').toggleClass("show");
        // });
        $('.profile-btn').click(function() {
            $('nav ul .profile-show').toggleClass("show");
            $('nav ul .first').toggleClass("rotate");
        });
        $('.serv-btn').click(function() {
            $('nav ul .serv-show').toggleClass("show1");
            $('nav ul .second').toggleClass("rotate");
        });

        $('nav ul .open-show').toggleClass("show1");

        $('nav ul li').click(function() {
            $(this).addClass("active").siblings().removeClass("active");
        });
    </script>

    <!-- ******************** search boarders -live ********************************** -->
    <script>
        $(document).ready(function() {
            load_data();

            function load_data() {
                $.ajax({
                    url: "../controller/boarderListController.php?myPost",
                    method: "post",
                    data: {},
                    success: function(data) {
                        $('#result').html(data);
                    },
                    error: function(error) {}
                });
            }
        });
    </script>


</body>

</html>