<?php 
 require_once ('../config/database.php');
 require_once ('../models/studentRequestModel.php');
 session_start();

function pendingRequest($connection) {
 $student_email=$_SESSION['email'];
 //echo $student_email;
$data=array();

$pending_req=StudentRequestModel::selectPendingRequest($student_email,$connection);

 // if(mysqli_num_rows($pending_req)>0)
    // {
        while($row=mysqli_fetch_assoc($pending_req))
        {
            $data[]=$row;
           // echo '<br/><br/>';
            // print_r($row);
        }
       // $pending_request=serialize($data);

	return $data;
    
}

function AcceptRequest($connection){

       $data=array();

        $student_email=$_SESSION['email'];
        $accept_req=StudentRequestModel::AcceptRequest($student_email,$connection);

        while ($row=mysqli_fetch_assoc($accept_req)) {
           $data[]=$row;
        }

        return $data;
}

function rentedPay($connection){

        $data=array();
        $student_email=$_SESSION['email'];
        $result=StudentRequestModel::selectRPayD($connection,$student_email);

        while ($row=mysqli_fetch_assoc($result)) {
            $data[]=$row;
        }

        return $data;
}

function rentedPayNot($connection){

        $data=array();
          $student_email=$_SESSION['email'];
            $result=StudentRequestModel::selectRPayNotD($connection,$student_email);

        while ($row=mysqli_fetch_assoc($result)) {
            $data[]=$row;
        }

        return $data;
}
 ?>