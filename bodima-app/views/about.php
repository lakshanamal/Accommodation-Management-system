<?php session_start();?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resource/css/nav.css">
    <link rel="stylesheet" href="../resource/css/footer.css">
    <link rel="stylesheet" href="../resource/css/all.css">
    <link rel="stylesheet" href="../resource/css/about_us.css">
  
    <title>Document</title>
</head>
<body onload="document.getElementById('about').style.backgroundColor='#07113d'">
<div class="back-img">
   <div class="back-image"> <img src="../resource/img/about-us1.jpg" alt=""></div>
<?php include 'nav.php' ?>

<div class="containe">
    <div class="nav-contact">
        <h1>About Me</h1>
    </div> 
    <div class="details">
        <h1>Project Name</h1>
        <p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis laborum quae non nisi, incidunt est veniam amet facere reprehenderit dolore cumque, aliquam hic corrupti officiis quibusdam quam cum beatae sit!
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta deserunt adipisci expedita quas! Rerum animi non quia officiis vero libero minima eos. Quis reprehenderit dolor autem nesciunt? Magni, tempore perspiciatis. </p>
         <div class="profile-pic">
             <img src="../resource/img/ishan.jpg" alt="">
             <img src="../resource/img/nimasha.jpg" alt="">
             <img src="../resource/img/pp.jpg" alt="">
             
         </div>
    </div>
    <div class="pic">
        <!-- <div class="picture">
            <img src="../resource/img/about.jpg" alt="">
        </div> -->
      
    </div>
</div>
<?php include 'footer.php' ?>
</div>
</body>
<script src="../resource/js/home1.js"></script>
<script src="../resource/js/jquery.js"></script>
</html>