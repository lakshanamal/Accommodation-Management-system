<?php 
 require_once ('../config/database.php');
 require_once ('../models/reg_userIshan.php');
 require_once('../config/temReqBOIshanEmail.php');

?>

<?php
if(isset($_GET['click']))
{
  header('Location:../views/TBOReqIshan.php.php');
}


if(isset($_POST['accept']))
{
   $B_post_id=$_POST['B_post_id'];
   $student_email=$_POST['student_email'];
   $city=$_POST['city'];

   $result=reg_userIshan::temAccBORequest($B_post_id,$student_email,$connection);
   header('Location:../views/TBOReqIshan.php');
}


if(isset($_POST['remove']))
{
   $B_post_id=$_POST['B_post_id'];
   $student_email=$_POST['student_email'];
   $result=reg_userIshan::temRejectBORequest($B_post_id,$student_email,$connection);
}

?>


