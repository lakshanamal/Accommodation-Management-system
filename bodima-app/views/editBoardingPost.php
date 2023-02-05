<?php
require_once('../config/database.php');
require_once('../models/post_boarding.php');

session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>postboarding</title>
    <link rel="stylesheet" href="../resource/css/new_home.css">
    <link rel="stylesheet" href="../resource/css/all.css">
    <link rel="stylesheet" href="../resource/css/extra.css">
    <link rel="stylesheet" href="../resource/css/popboarding.css">
    <link href="../resource/css/boarding.css" rel="stylesheet">
    <style>
        #myMap {
            height: 350px;
            width: 50vw;
        }
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>


    <script>
        $(document).ready(function() {
            $("#downbefore").click(function() {
                $("#downbefore").hide();
                $("#photo-wrapper").show("slow");
                $("#upafter").show();
            });

            $("#upafter").click(function() {
                $("#downbefore").show();
                $("#photo-wrapper").hide("slow");
                $("#upafter").hide();
            });

        });
    </script>

    <?php
    $seri = $_GET['data'];
    $data = unserialize($seri);
    ?>

    <?php require("maps.php") ?>
</head>

<body>
    <?php require "header1.php" ?>

    <div class="con-1" id="blur">
        <div class="con-2">
            <?php
            if (isset($_GET['param'])) {
                $errors = $_GET['param'];
            }
            ?>
            <form action="../controller/adertisementController.php?edit" method="post" enctype="multipart/form-data" class="form">
                <h1>Boarding Advertisement edit Form</p><!-- postBoarding -->
                    <hr />

                    <div class="section">
                        <p>*Title</p>
                        <input type="text" value="<?php echo $data['title'] ?>" name="title" id="title"><br>
                        <?php if (isset($errors['err17'])) echo "<div class='error_msg'>" . $errors['err17'] . "</div>"; ?>

                        <p>Description </p>
                        <!--<input type="text" name="description" id="description" placeholder="Enter Description" ><br><br>-->
                        <textarea name="description" value="<?php echo $data['description'] ?>" id="description" rows="3" cols="26"><?php echo $data['description'] ?></textarea><br>
                    </div>

                    <hr />
                    <div class="section">
                        <!--<label for="">Address  </label><br>-->
                        <p>*Address </p>

                        <input class="hnumber" type="text" value="<?php echo $data['house_num'] ?>" name="house_num" id="Hnumber" placeholder="House Number / Name">
                        <!-- <label class="hLable"> House Number / Name  </label><br> -->
                        <?php if (isset($errors['err1'])) echo "<div class='error_msg'>" . $errors['err1'] . "</div>"; ?>


                        <input class="lane" type="text" value="<?php echo $data['lane'] ?>" name="lane" id="lane" placeholder="Lane">
                        <!-- <label class="lLable" > Lane </label><br> -->
                        <?php if (isset($errors['err2'])) echo "<div class='error_msg'>" . $errors['err2'] . "</div>"; ?>



                        <input class="city" type="text" value="<?php echo $data['city'] ?>" name="city" id="city" placeholder="City">
                        <!-- <label class="cityLable" > City  </label><br> -->
                        <?php if (isset($errors['err3'])) echo "<div class='error_msg'>" . $errors['err3'] . "</div>"; ?>



                        <input class="district" type="text" value="<?php echo $data['district'] ?>" name="district" id="district" placeholder="District">
                        <!-- <label class="lDis" >District  </label><br> -->
                        <?php if (isset($errors['err4'])) echo "<div class='error_msg'>" . $errors['err4'] . "</div>"; ?>
                    </div>

                    <hr />
                    <div class="section">
                        <div class="clickable">
                            <p style="padding-left:20px;">Location</p>
                            <i class="fas fa-map-marker-alt" style="padding-left:20px;"></i>
                            <span> drag the red marker to add your boarding location</span>
                        </div>
                    </div>
                    <div class="section" style="margin:20px;">

                        <div class="outerboxmap" style="margin:10px;">

                            <div class="innerboxmap" style="display:flex; justify-content:space-around;">
                                <!-- map -->

                                <div id="myMap"></div>
                                <input type="hidden" id="address" name="map_address" style="width:600px;" /><br />
                                <input type="hidden" id="latitude" name="latitude" placeholder="Latitude" value="" />
                                <input type="hidden" id="longitude" name="longitude" placeholder="Longitude" value="" />
                                <!-- <input type="submit" name="submitmap" value="submit"> -->
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="section">

                        <h4>Boarding Photos</h4>
                        <p class="opt"> (Optional)</p>
                        <p class="cover">Boarding Cover Image</p>


                        <div id="photo1" class="images" style="position: relative;">
                            <label for="inputFile"><img src="<?php echo $data['image'] ?>" class="cam" id="blah1" alt="Img" width="100px" height="100px"><br><br></label>
                            <button type="button" class="btn1" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                            <input type="file" id="inputFile" value="<?php echo $data['image'] ?>" name="image1"> <br>
                        </div>
                        <div id="photo-wrapper" class="wrapper" style="display: none;">
                            <!-- clone photo div using js and append to photo-wrapper-->
                            <!-- one -->
                            <div class="photo" style="position: relative;">
                                <label for="inputFile1"><img src="https://img.icons8.com/carbon-copy/100/000000/compact-camera.png" class="cam" id="blah" alt="Img" width="100px" height="100px"><br><br></label>
                                <button type="button" class="btn" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                                <input type="file" id="inputFile1" name="image[]" hidden> <br>
                            </div>
                            <!-- two -->
                            <div class="photo" style="position: relative;">
                                <label for="inputFile2"><img src="https://img.icons8.com/carbon-copy/100/000000/compact-camera.png" class="cam" id="blah" alt="Img" width="100px" height="100px"><br><br></label>
                                <button type="button" class="btn" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                                <input type="file" id="inputFile2" name="image[]" hidden> <br>
                            </div>
                            <!-- three -->
                            <div class="photo" style="position: relative;">
                                <label for="inputFile3"><img src="https://img.icons8.com/carbon-copy/100/000000/compact-camera.png" class="cam" id="blah" alt="Img" width="100px" height="100px"><br><br></label>
                                <button type="button" class="btn" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                                <input type="file" id="inputFile3" name="image[]" hidden> <br>
                            </div>
                            <!-- four -->
                            <div class="photo" style="position: relative;">
                                <label for="inputFile4"><img src="https://img.icons8.com/carbon-copy/100/000000/compact-camera.png" class="cam" id="blah" alt="Img" width="100px" height="100px"><br><br></label>
                                <button type="button" class="btn" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                                <input type="file" id="inputFile4" name="image[]" hidden> <br>
                            </div>
                            <!-- five -->
                            <div class="photo" style="position: relative;">
                                <label for="inputFile5"><img src="https://img.icons8.com/carbon-copy/100/000000/compact-camera.png" class="cam" id="blah" alt="Img" width="100px" height="100px"><br><br></label>
                                <button type="button" class="btn" data-img-Name=""><i class="far fa-window-close fa-2x"></i></button>
                                <input type="file" id="inputFile5" name="image[]" hidden> <br>
                            </div>
                        </div>
                    </div>
        </div>
        <hr />
        <div class="section">
            <h4>Boarding Information</h4>

            <p>*Renting For (Girls / Boys / Any One) : </p>

            <div class="radio-1">

                <input type="radio" <?php if ($data['girlsBoys'] == 'Boys') echo 'checked' ?> name="gender" value="Boys"> <span>Boys</span>
                <input type="radio" <?php if ($data['girlsBoys'] == 'Girls') echo 'checked' ?> name="gender" value="Girls"> <span>Girls</span>
                <input type="radio" <?php if ($data['girlsBoys'] == 'AnyOne') echo 'checked' ?> name="gender" value="AnyOne"> <span>Any One</span>

            </div>
            <?php if (isset($errors['err6'])) echo "<div class='error'>" . $errors['err6'] . "</div>"; ?>
            <p>*Renting Options : </p>
            <div class="radio-2">
                <input type="radio" name="category" id="individual" value="Individual" onclick="text('0')" <?php if ($data['category'] == 'Individual') echo 'checked' ?>><span id="individual">&nbsp; <span>Individual</span></span>&nbsp;&nbsp;
                <input type="radio" name="category" id="RoomOrHome" value="RoomOrHome" onclick="text('1')" <?php if ($data['category'] == 'RoomOrHome') echo 'checked' ?>><span id="RomeOrHome">&nbsp; <span>Rome Or Home</span></span>&nbsp;&nbsp;
            </div>
            <?php if (isset($errors['err5'])) echo "<div class='error'>" . $errors['err5'] . "</div>"; ?>
            <p>Total Person Count : </p>
            <input type="number" name="Pcount" id="pcount" value="<?php echo $data['person_count'] ?>" min=1 max=30>
            <?php if (isset($errors['err7'])) {
                echo "<div class='error2'>" . $errors['err7'] . "</div>";
            } elseif (isset($errors['err8'])) {
                echo "<div class='error2'>" . $errors['err8'] . "</div>";
            } elseif (isset($errors['err9'])) {
                echo "<div class='error2'>" . $errors['err9'] . "</div>";
            }
            ?>

        </div>


        <hr />
        <div class="section">
            <h4>Boarding Renting fee details</h4>

            <p id="indivi">*Cost Per Person For Month</p>
            <p id="ROrH">*Cost Renting For Month</p>
            <input type="text" value="<?php echo $data['cost_per_person'] ?>" name="cost_per_person" id="cpperson">
            <?php if (isset($errors['err10'])) {
                echo "<div class='error2'>" . $errors['err10'] . "</div>";
            } elseif (isset($errors['err11'])) {
                echo "<div class='error2'>" . $errors['err11'] . "</div>";
            } elseif (isset($errors['err16'])) {
                echo "<div class='error2'>" . $errors['err16'] . "</div>";
            }
            ?>


            <p>*KeyMoney</p>
            <input type="text" value="<?php echo $data['keymoney'] ?>" name="keymoney" id="Keymoney">
            <?php if (isset($errors['err12'])) {
                echo "<div class='error2'>" . $errors['err12'] . "</div>";
            } elseif (isset($errors['err13'])) {
                echo "<div class='error2'>" . $errors['err13'] . "</div>";
            } elseif (isset($errors['err16'])) {
                echo "<div class='error2'>" . $errors['err16'] . "</div>";
            }
            ?>
        </div>
        <hr />
        <div class="submitdiv">
            <input type="text" name="B_post_id" hidden value="<?php echo $data['B_post_id'] ?>">
            <input type="submit" class="save" name="submit" id="submit" value="edit advertisement">
        </div>
        <script type="text/javascript">
            function toggle() {
                var popup = document.getElementById('popup');
                popup.classList.toggle('nima')
            }
        </script>
        <script>
            $('.group').on('input', '.prc', function() {
                var totalsum = 0;
                $('.group .prc').each(function() {
                    var inputVal = $(this).val();
                    if ($.isNumeric(inputVal)) {
                        totalsum = parseFloat(inputVal) * 100;
                    }
                });
                $('#Aamount').val(totalsum);
            });

            $('form').submit(function(e) {
                $(':disabled').each(function(e) {
                    $(this).removeAttr('disabled');
                })

            });
        </script>
        <script src="../resource/js/jquery-3.5.1.min.js"></script>
        <script src="../resource/js/custom.js"></script>
        <script src="../resource/js/boarding.js"></script>
        </form>
    </div>
    </div>
</body>

</html>