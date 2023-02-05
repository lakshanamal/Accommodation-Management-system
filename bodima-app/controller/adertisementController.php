<!-- an -->
<?php require_once('../config/database.php');
require_once('../models/adertisement_model.php');
require_once('../models/post_boarding.php');
session_start();
?>

<?php

if (isset($_GET['id'])) {
    if (isset($_SESSION['email'])) {
        header('Location:../views/boardingpage_detailed.php?id=' . $_GET['id']);
    } else {
        header('Location:../views/boardings_live.php');
    }
}


if (isset($_GET["editId"])) {
    $postDetails = advertisement_model::get_B_post_details_byId($_GET["editId"], $connection);
    $data = mysqli_fetch_assoc($postDetails);
    $seri = serialize($data);
    header('Location:../views/editBoardingPost.php?data=' . $seri);
};

if (isset($_POST['submit'])) {
    $errors = array(); //create empty array
    $value = array();
    $value['description'] = $_POST['description'];
    $value['house_num'] = $_POST['house_num'];
    $value['girlsBoys'] = $_POST['gender'];
    $value['category'] = $_POST['category'];
    $value['B_post_id'] = $_POST['B_post_id'];
    $id =  $_POST['B_post_id'];
    

    $title = $_POST['title'];
    if (empty($_POST['title']) || strlen(trim($_POST['title'])) < 1) {
        $errors['err17'] = '*Title is required';  //erros 17
    } else {
        $value['title'] = $title;
    }

    $Hnumber = $_POST['house_num'];
    if (empty($_POST['house_num']) || strlen(trim($_POST['house_num'])) < 1) {
        $errors['err1'] = '*Home Number is required';
    } else {
        $value['house_num'] = $Hnumber;
    }

    $lane = $_POST['lane'];
    if (empty($_POST['lane']) || strlen(trim($_POST['lane'])) < 1) {
        $errors['err2'] = '*Lane is required';
    } else {
        $value['lane'] = $lane;
    }

    $city = $_POST['city'];
    if (empty($_POST['city']) || strlen(trim($_POST['city'])) < 1) {
        $errors['err3'] = '*City is required';
    } else {
        $value['city'] = $city;
    }


    $district = $_POST['district'];
    if (empty($_POST['district']) || strlen(trim($_POST['district'])) < 1) {
        $errors['err4'] = '*District is required';
    } else {
        $value['district'] = $district;
    }

    if (!isset($_POST['category'])) {
        $errors['err5'] = '*Select one option';
    }

    if (!isset($_POST['gender'])) {
        $errors['err6'] = '*Select one option';
    }

    $Pcount = $_POST['Pcount'];
    //print_r($_POST['Pcount']);

    if (empty($Pcount) || strlen(trim($Pcount)) < 0) {
        $errors['err7'] = '*Person Count is required';
    } else if ($Pcount <= 0) {
        $errors['err8'] = '*Should be greater than or equal 1';
    } else if ($Pcount >= 30) {
        $errors['err9'] = '*Should be less than 30';
    }

    $CPperson = $_POST['cost_per_person'];
    if (empty($_POST['cost_per_person']) || strlen(trim($_POST['cost_per_person'])) < 1) {
        $errors['err10'] = '*Cost Per Person For Month is required';
    } else if (!is_numeric($CPperson)) {
        $errors['err11'] = '*Should be an integer';
    } else if ($CPperson < -1) {
        $errors['err16'] = '*Should be Posivite';
    } else {
        $value['cost_per_person'] = $CPperson;
    }

    $Keymoney = $_POST['keymoney'];
    if (empty($_POST['keymoney']) || strlen(trim($_POST['keymoney'])) < 1) {
        $errors['err12'] = '*Keymoney is required';
    } else if (!is_numeric($Keymoney)) {
        $errors['err13'] = '*Should be an integer';
    } else if ($Keymoney < -1) {
        $errors['err16'] = '*Should be Posivite';
    } else {
        $value['keymoney'] = $Keymoney;
    }

    if (empty($errors)) {

        $title = $_POST['title'];
        $Hnumber = $_POST['house_num'];
        $lane = $_POST['lane'];
        $city = $_POST['city'];
        $district = $_POST['district'];
        $description = $_POST['description'];

        $category = $_POST['category'];
        $gender = $_POST['gender'];
        $Pcount = $_POST['Pcount'];
        $Keymoney = $_POST['keymoney'];

        $latitude = $_POST['latitude'];
        $longitude = $_POST['longitude'];
        $location = $_POST['map_address'];



        $image_name1 = $_FILES['image1']['name'];
        if (null == trim($image_name1)) {
            //    echo "null";
            $image_name1 = "defaultbp1.jpg";
        } else {
            // echo " have value";
        }

        $image_type1 = $_FILES['image1']['type'];
        $image_size1 = $_FILES['image1']['size'];
        $temp_name1 = $_FILES['image1']['tmp_name'];
        $upload_to = "../resource/Images/uploaded_boarding/";
        move_uploaded_file($temp_name1, $upload_to . $image_name1);
        date_default_timezone_set("Asia/Colombo");
        $creattime = date('Y-m-d h:i:s');
        boarding::updatePost($title,$description,$Hnumber,$lane,$city,$district,$Keymoney,$upload_to,$image_name1,$Pcount,$CPperson,$category,$gender, $id, $connection);

        // $result_set = boarding::getPostId($connection);
        // $result_post = mysqli_fetch_assoc($result_set);
        // $postid = $result_post['B_post_id'];
        // echo $postid;

        // foreach ($_FILES['image']['tmp_name'] as $key => $value) {

        //     $image_name = $_FILES['image']['name'][$key];
        //     $temp_name = $_FILES['image']['tmp_name'][$key];
        //     $image_type = $_FILES['image']['type'][$key];
        //     $image_size = $_FILES['image']['size'][$key];
        //     $upload_to = "../resource/Images/uploaded_boarding/";
        //     if (null != trim($image_name)) {
        //         echo "null";
        //         $image_name_edit = 'post' . $postid . 'img' . $image_name;
        //         move_uploaded_file($temp_name, $upload_to . $image_name_edit);
        //         boarding::image_save($id, $postid, $image_name_edit, $upload_to, $connection);
        //     }
        // }
        //header('Location:../views/postBoarding.php?success&pop=1&amount='.$Aamount.'&lifespan='.$Lifespan);
        header('Location:../views/myBoardingPostVIew.php');
        //header('Location:../views/postBoarding.php?success'); //meka balanna
    } else {
        $data = serialize($value);
        header('Location:../views/editBoardingPost.php?' . http_build_query(array('param' => $errors)).'&data='.$data);
    }
}
?>