<!-- an -->
<?php session_start();
require_once('../config/database.php');
require_once('../models/boarder_list_modelN.php');


if (isset($_GET['boarderlist'])) {


    if (!isset($_POST["qry"])) {
        // search bar hasn't a query
        $boarder = boarder_list_modelN::all_boarderlist_of_owner($connection, $_SESSION['BOid']);
    } else {
        // search bar has a query
        $boarder = boarder_list_modelN::search_boarder_in_list($connection, $qry, $_SESSION['BOid']);
    }

    $output = array();

    if (mysqli_num_rows($boarder) > 0) {

        while ($row = mysqli_fetch_assoc($boarder)) {
            $data[] = $row;
        }
        $boarderlist = serialize($data);
    }
    header('Location:../views/myboarders1.php?blist=' . $boarderlist);
}

if (isset($_GET['myPost'])) {
    $Boid = $_SESSION["BOid"];
    $output="";
    $postList = boarder_list_modelN::get_my_post($connection, $Boid);
    if (mysqli_num_rows($postList) > 0) {
        while ($row = mysqli_fetch_assoc($postList)) {
            $output .= '
		<div class="divtable">
		<div class="table-responsive" >
		<table class="table table bordered">
			<tr>
				<th class="img_th" rowspan=6>
				<div class="inner_img">
				<img src="' . $row["image"] . '" class="profile_image" alt="" >
				</div>
				</th>
				<th>No</th><td>' . $row["B_post_id"] . '</td>
			</tr>
			<tr>
				<th>Address</th><td>' . $row["lane"] . ', ' . $row["city"] . '</td>
			</tr>
			<tr>
				<th>City</th><td>' . $row["city"] . '</td>
			</tr>
			<tr>
				<th>girls/boys</th><td>' . $row["girlsBoys"] . '</td>
			</tr>
			<tr>
				<th>cost per person</th><td>' . $row["cost_per_person"] . '</td>
			</tr>
			<tr>
				<th>description</th><td>' . $row["description"] . '</td>
			</tr>
		</table>
         <div class="button_class">
            <a  class="p_edit" href="../controller/adertisementController.php?id=' . $row["B_post_id"] . '" >View</a>
            <a  class="p_edit" href="../controller/adertisementController.php?editId=' . $row["B_post_id"] . '" >Edit</a>
         </div>
		</div>
		</div>
		';
        }
        echo $output;
    }

    echo null;
}
?>