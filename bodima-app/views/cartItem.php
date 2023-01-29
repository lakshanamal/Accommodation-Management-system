<?php session_start();
if (isset($_SESSION['cart'])) {
    require_once('../config/database.php');
    require_once('../models/reg_user.php');

    date_default_timezone_set("Asia/Colombo");
    header('Location=paymentFood_pending.php');
?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="../resource/css/card1.css">
        <link rel="stylesheet" href="../resource/css/card.css">
        <link rel="stylesheet" href="../resource/css/nav.css">
        <link rel="stylesheet" href="../resource/css/footer.css">
        <link rel="stylesheet" href="../resource/css/all.css">
        <script src="../resource/js/jquery.js"></script>
    </head>

    <body>
        <?php include 'nav.php' ?>

        <!-- product-cart and product order deatils -->
        <div class="grid-item">
            <div class="mycart">
                <div class="mycart-header">
                    <!-- <?php echo '<a href="cart.php? =' . $_GET["Pid"] . '&name=' . $_GET["name"] . '&address=' . $_GET["address"] . '"><i class="fas fa-chevron-circle-left fa-2x"></i></a>'; ?> -->
                    <h1>My Cart</h1>
                </div>
                <?php
                $total = 0;
                if (isset($_SESSION['cart'])) {
                    $results = $_SESSION['cart'];
                    $amount = 0;
                    $i = 0;
                    foreach ($results as $result) {
                        //  print_r($_SESSION);
                ?>
                        <form action="../controller/cartCon.php?action=remove&id=<?php echo $result['product_id']; ?>" method="post">

                            <div class="item-wrap">
                                <div class="cart-item">
                                    <img src="<?php echo $result['product_img'] ?>" alt="">
                                    <div class="product-details">
                                        <h4>Produnct Name : <?php echo $result['item_name']; ?></h4>
                                        <h4>Item price :RS : <?php echo $result['product_price']; ?></h4>

                                        <div class="item-count">

                                            <button class="btn4" type="button" id="minus<?php echo $i; ?>"><i class="fas fa-minus"></i></button>
                                            <p>
                                            <h4 id=<?php echo $i; ?>><?php echo $result['item_quantity'] ?></h4>
                                            </p>
                                            <button class="btn4" type="button" id="plus<?php echo $i; ?>"><i class="fas fa-plus"></i></button>
                                            <button class="btn2" name="remove" type="submit"> <i class="far fa-trash-alt"></i> Remove</button>

                                        </div>

                                    </div>

                                </div>
                            </div>

                        </form>
                        <?php
                        $total = $total + $result['product_price'];
                        ?>
                        <script>
                            // increase quantity
                            $(document).ready(function() {
                                $(document).on('click', "#plus<?php echo $i; ?>", function() {
                                    var countTag = document.getElementById(<?php echo $i; ?>);
                                    var count = parseInt(countTag.innerHTML) + 1; // convert to integer
                                    var totalTag = document.querySelectorAll('.left-item');
                                    var total = parseInt(totalTag[0].innerHTML); // first class data [total]
                                    var itemPrice = <?php echo $result['product_price'] ?>;
                                    if (count > 10) {
                                        count = 10;
                                    } else {
                                        total = total + itemPrice;
                                        totalTag[0].innerHTML = total;
                                        totalTag[2].innerHTML = total;
                                    }
                                    countTag.innerHTML = count;
                                    var productId = <?php echo $result['product_id'] ?>;

                                    $.ajax({
                                        url: "../controller/cartCon.php",
                                        method: "POST",
                                        data: {
                                            quantity: count,
                                            productId: productId,
                                            total: total
                                        },
                                        dataType: "json"
                                    });
                                })
                            })
                            // decrase quantity    
                            $(document).on('click', "#minus<?php echo $i; ?>", function() {
                                var countTag = document.getElementById(<?php echo $i; ?>);
                                var count = parseInt(countTag.innerHTML) - 1;
                                var itemPrice = <?php echo $result['product_price'] ?>;
                                var totalTag = document.querySelectorAll('.left-item');
                                var total = parseInt(totalTag[0].innerHTML);
                                if (count <= 0) {
                                    count = 1;
                                } else {
                                    total = total - itemPrice;
                                    totalTag[0].innerHTML = total;
                                    totalTag[2].innerHTML = total;
                                }
                                countTag.innerHTML = count;
                                var productId = <?php echo $result['product_id'] ?>;
                                $.ajax({
                                    url: "../controller/cartCon.php",
                                    method: "POST",
                                    data: {
                                        quantity: count,
                                        productId: productId,
                                        total: total
                                    },
                                    dataType: "json"
                                });
                            })
                        </script>
                <?php $i++;
                    }
                }
                ?>
            </div>
            <!-- order price details -->

            <?php $count = count($_SESSION['cart']);
            $_SESSION['total'] = $total;
            ?>
            <div class="payment">
                <div class="price-details">
                    <div class="total">
                        <h3>Price details</h3>
                    </div>
                    <div class="details">
                        <h5>Food item price <span class="left-item"><?php echo $_SESSION['total']; ?></span></h5>
                        <h5 style="padding-bottom: 10px ;">Delivery Charges <span style="color: green;" class="left-item">Free</span></h5>
                        <h4 style="padding-bottom: 10px;border-top:1px solid rgb(191, 184, 184); border-bottom:1px solid rgb(191, 184, 184);">Amount payable<span class="left-item"><?php echo $_SESSION['total']; ?></span> </h4>
                        <form action="../controller/orderCon.php" method="post">
                            <h4>Enter delivery address :</h4>
                            <?php if (isset($_GET['errorAddress'])) echo "<h5 style='color:red'>*Please enter the delivery address</h5>"; ?>
                            <input type="hidden" name="Pid" value="<?php echo $_GET['Pid']; ?>">
                            <input type="text" placeholder="ex:310/delgasduwa/dodanduwa" name="address" ?>
                            <h4>Enter phone number :</h4>
                            <?php if (isset($_GET['errorPhone'])) echo "<h5 style='color:red'>*Please enter the phone number</h5>"; ?>
                            <?php if (isset($_GET['errorPhone1'])) echo "<h5 style='color:red'>*Please enter the valid phone number</h5>"; ?>
                            <input type="text" placeholder="ex:07x xxx xxx xxxx" name="phone" ?>
                            <h4>Select the payment method :</h4>
                            <div class="payment_method">
                                <input type="radio" id="card" name="method" value="card" checked>
                                <label for="card">Card</label>
                            </div>
                            <div class="payment_method">
                                <input type="radio" id="cash" name="method" value="cash">
                                <label for="cash">Cash on delivery</label>
                            </div>
                            <div class="shedule-order">
                                <h4>Shedule order </h4>
                                <select name="shedule" class="shedule-time">

                                </select>
                            </div>
                            <button name="submit" type="submit" id="request" class="btn6 request">ORDER </button>
                        </form>

                        <!-- disabled card if term is long term -->
                        <?php
                        if ($_SESSION['term'] == 'longTerm') { ?>
                            <script>
                                document.getElementById('card').disabled = true;
                                document.getElementById('cash').checked = true;
                            </script>
                        <?php   } elseif ($_SESSION['term'] == 'shortTerm') { ?>

                            <script>
                                document.getElementById('card').disabled = false;
                            </script>
                        <?php   }

                        ?>

                    </div>
                </div>
            </div>
            <?php if (isset($_GET['popf'])) { ?>
                <div class="pop-modal">
                    <div class="pop-bg"></div>
                    <div id="pop">
                        <div class="post-amount">
                            <h5>Food item price <span class="left-item"><?php echo $_SESSION['total']; ?></span></h5>
                            <h5 style="padding-bottom: 10px ;">Delivery Charges <span style="color: green;" class="left-item">Free</span></h5>
                            <h4 style="padding-bottom: 10px;border-top:1px solid rgb(191, 184, 184); border-bottom:1px solid rgb(191, 184, 184);">Amount payable<span class="left-item"><?php echo $_SESSION['total']; ?></span> </h4>
                        </div>
                        <form action="https://sandbox.payhere.lk/pay/checkout" method="post" class="payment">

                            <input type="hidden" name="merchant_id" value="1222017">
                            <input type="hidden" name="return_url" value='http://bodimaapp.com/controller/cardPaymentCon.php?success&Pid=<?php echo $_GET["Pid"] ?>&shedule=<?php echo $_GET["shedule"] ?>&address=<?php echo $_GET["address"] ?>&phone=<?php echo $_GET["phone"] ?>'>
                            <input type="hidden" name="cancel_url" value="http://bodimaapp.com/views/cartItem.php?Pid=<?php echo $_GET["Pid"] ?>">
                            <input type="hidden" name="notify_url" value="http://bodimaapp.com/config/paycon.php">

                            <!-- <br><p>Boarding Details</p> -->
                            <?php
                            $orderId = mt_rand(1, 1000000);
                            $house_num = 1;
                            $lane = 'aaa';
                            $city = 'aa';
                            $first_name = $_SESSION["first_name"];
                            $last_name = $_SESSION["last_name"];
                            $st_email = $_SESSION["email"];
                            $amount =  $_SESSION['total'];
                            // print_r($_SESSION);
                            $hash = "1222017";
                            $hash .= $orderId;
                            $hash .= number_format($amount, 2, '.', '');
                            $hash .= "LKR";
                            $hash .= strtoupper(md5("MjUyNDc4MjE4NTI4Nzg0MTM5MzAzOTk1MTA2NzE0MTg2MzQwMDU3NQ=="));
                            $hash = strtoupper(md5($hash));
                            ?>
                            <input type="hidden" name="order_id" value="<?php echo $orderId; ?>">
                            <input type="hidden" name="items" value=" Post fee"><br>
                            <input type="hidden" name="currency" value="LKR">
                            <input type="hidden" name="amount" value="<?php echo $amount; ?>">
                            <br><br>
                            <input type="hidden" name="first_name" value="<?php echo $first_name; ?>">
                            <input type="hidden" name="last_name" value="<?php echo $last_name; ?>"><br>
                            <input type="hidden" name="email" value="<?php echo $st_email; ?>">
                            <input type="hidden" name="address" value="No.1, Galle Road">
                            <input type="hidden" name="city" value="Colombo">
                            <input type="hidden" name="country" value="Sri Lanka"><br><br>
                            <input type="hidden" name="hash" value="<?php echo $hash; ?>">
                            <div class="pop-btn">
                                <input type="button" id="submit" value="Close" onclick="window.location = '../views/cartItem.php?Pid=<?php echo $_GET['Pid'] ?>'" />
                                <input type="submit" id="foodpay" value="Pay" name="value" style="margin: 0%;">
                            </div>
                        </form>
                    </div>
                </div>


            <?php } ?>

        </div>
        <?php include 'footer.php' ?>


    </body>
    <script src="../resource/js/home1.js"></script>
    <script src="../resource/js/cartItem.js"></script>

    </html>

<?php } else {
    header('Location:../views/paymentFood_pending.php');
}

?>