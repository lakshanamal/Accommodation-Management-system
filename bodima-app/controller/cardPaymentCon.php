<?php
require_once('../config/database.php');
require_once('../models/orderModel.php');
require_once('../models/reg_user.php');
require_once('../models/notificationModel.php');
require_once('../models/ratemodelFood.php');
session_start();
?>

<?php
// validate and save cart item to database
if (isset($_GET['success'])) {
    echo "hello";
    if (isset($_SESSION['cart'])) {
        $method = $_POST['method'];

        $shedule = $_GET['shedule'];
        $email = $_SESSION['email'];
        $F_post_id = $_GET['Pid'];
        $first_name = $_SESSION['first_name'];
        $last_name = $_SESSION['last_name'];
        $address = $_POST['address'];
        $products = $_SESSION['cart'];
        $order_id = $_GET['order_id'];
        $total = $_SESSION['total'];
        $phone = $_GET['phone'];
        date_default_timezone_set("Asia/Colombo");
        $time = date('Y-m-d H:i:s');
        $expireTime = date('Y-m-d H:i:s', strtotime('+20 minutes', strtotime($time)));

        $_SESSION['order_id'] = $order_id;
        //             echo ($order_id);
        $term = $_SESSION['term'];
        foreach ($products as $product) {
            $order_type = $product['order_type'];
            $restaurant = $product['restaurant'];
        }
        orderModel::card_payment_food_request($F_post_id, $email, $address, $first_name, $last_name, $order_id, $order_type, $term, $shedule, $total, $phone, $method, $time, $expireTime, $restaurant, $connection);

        foreach ($products as $product) {
            orderModel::food_item($product['item_name'], $product['item_quantity'], $order_id, $connection);
        }

        $detailsender = mysqli_fetch_assoc(notificationModel::find_levelAndId($connection, $email));
        $FSid = mysqli_fetch_assoc(notificationModel::find_FSid_from_fpost($connection, $F_post_id));
        $type_number = 2; //new order arrived   
        $from_level = $_SESSION['level'];
        $from_id = $detailsender['id'];
        $to_level = 'food_supplier';
        $to_id = $FSid['FSid'];
        $massageHeader = 'New order Arrived';
        $massage = 'customer name : ' . $first_name . ' ' . $last_name . '<br>order id : ' . $order_id . '<p style="font-size:12px; color:black;">Accept the order before timeout!</p>';
        $redirect_url = '../views/orders.php';
        notificationModel::insertnotification($connection, $type_number, $from_level, $from_id, $to_level, $to_id, $massageHeader, $massage, $redirect_url);


        if ($_SESSION['term'] == 'longTerm') {
            $start = $_SESSION['startDate'];
            $end = $_SESSION['endDate'];

            $dates = date_diff(date_create($end), date_create($start));
            print_r($dates->days);
            $startDate = date_create($start);
            for ($i = 0; $i < $dates->days; $i++) {
                $startDate->modify('+1 day');
                orderModel::addLongTerm($connection, $startDate->format('Y-m-d H:i:s'), $order_id);
            }
        }
        unset($_SESSION['cart']);
        unset($_SESSION['term']);
        header('Location:../views/paymentFood_receving.php');
    }
}

?>