 <!-- Masthead-->
 
 <?php 
if(!isset($_SESSION['login_user_id']))
 header("location: index.php?page=home");
 ?>

 <header class="masthead">
     <div class="container h-100">
         <div class="row h-100 d-flex align-items-center justify-content-center text-center">
             <div class="col-lg-10 align-self-end mb-4 page-title" style="background:transparent;">
                 <h3 class="text-uppercase text-white font-weight-bold" style="font-size: 55px">My Account</h3>
                 <hr class="divider my-4" />
             </div>
         </div>
     </div>
 </header>

<div class="container mt-5">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="orders-tab" data-toggle="tab" href="#orders" role="tab" aria-controls="orders" aria-selected="true">Orders</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Account Settings</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="orders" role="tabpanel" aria-labelledby="orders-tab">
            <?php
                if(isset($_SESSION['login_user_id'])){
                    $data = "where c.user_id = '".$_SESSION['login_user_id']."' ";
                }else{
                    $ip = isset($_SERVER['HTTP_CLIENT_IP']) ? $_SERVER['HTTP_CLIENT_IP'] : isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
                    $data = "where c.client_ip = '".$ip."' ";
                }
                $get = $conn->query("SELECT *, count(ol.product_id) as totalItems from orders o INNER JOIN order_list ol ON o.id = ol.order_id WHERE ol.user_id =". $_SESSION['login_user_id']." GROUP BY ol.order_id desc");

                // $get = $conn->query("SELECT *,
                //     c.id as cid, p.id as pid 
                //     FROM order_list c 
                //     inner join product_list p 
                //     on p.id = c.product_id 
                //     inner join orders o 
                //     on c.order_id = o.id ".$data); 
                           
            ?>
            <div class="card-body">
                <table class="table table-bordered;">    
                         <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Order #</th>
                                <th>Items</th>
                                <th>Status</th>
                                <th>Waiting</th>
                                <th>&nbsp;</th>
                                <!-- <th>Product Name</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Action</th> -->
                            </tr>
                        </thead>
                            <tbody>
                <?php 
                //$total = 0;
                $i = 1;
                while($row= $get->fetch_assoc()):
                   // $total += ($row['qty'] * $row['price']);
                ?>
                         <tr>
                                <td><?php echo $i++?></td>
                                <td><?php echo date_format(date_create($row['order_date']),"F j, Y, g:i a")?></td> 
                                <td><?php echo $row['order_id']?></td>  
                                <td><?php echo $row['totalItems']?></td>
                                <?php 
                                if($row['status'] == 1){
                                    echo '<td><span class="badge badge-success">Confirmed</span></td>';
                                }else if($row['status'] == 2){
                                    echo '<td><span class="badge badge-danger">Cancelled</span></td>';
                                }else{
                                    echo '<td><span class="badge badge-secondary">For Verification</span></td>';
                                }
                                ?>
                                <td><?php $user_id = $_SESSION['login_user_id']; ?>
                                	<?php
$result = "SELECT * FROM user_info WHERE user_id='$user_id'";
$qry = mysqli_query($conn, $result); 
while ($info = mysqli_fetch_assoc($qry)) {
   $municipality = $info['municipality'];
}
if ($municipality == 'Bantayan') {
	echo "45 Minutes";
} else {
	echo "30 Minutes";
}
?>


                                </td>
                                <td>
                                    <a href="index.php?page=order&id=<?php echo $row['order_id']?>" class="btn btn-sm btn-primary">
                                        View Order
                                    </a>
                                    <?php
                                    if($row['status'] == 0){
                                        echo ' <button type="button" class="btn btn-sm btn-warning" onclick="handleCancel('.$row['order_id'].')">
                                        Cancel
                                    </button>';
                                    }
                                     ?>
                                </td>

                                <!-- <td><?php echo $row['price']?></td>
                                <td><?php echo $row['qty']?></td>
                                <td><?php echo number_format($row['qty'] * $row['price'],2) ?></td> -->
                                 
                                <!--<td> <button class="btn btn-sm btn-danger"
                                     onclick="removeItem1(<?php echo $row['pid'].','.$row['cid'].','.$row['qty'] ?>)">Remove</button></td>-->
                              </tr>
                              <?php endwhile; ?>
                             </tbody>
                          </table>
                  </div>
            </div>

        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="card-body">
                <table class="table table-bordered;">    
                    <tbody>
                        <tr>
                        <td width="250">Name:</td>
                        <td><?php echo $_SESSION['login_first_name'] ." ". $_SESSION['login_last_name']?></td>
                        </tr>
                        <tr>
                        <td>Delivery Adress:</td>
                        <td><?php echo $_SESSION['login_address']?></td>
                        </tr>
                        <tr>
                        <td>Email Address:</td>
                        <td><?php echo $_SESSION['login_email']?></td></tr>
                        <tr>
                        <td>Contact Number:</td>
                        <td><?php echo $_SESSION['login_mobile']?></td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    function handleCancel(id) {
        if(confirm("Are you sure you want to cancel this order")){
            start_load()
            $.ajax({
                url: 'admin/ajax.php?action=cancel_order',
                method: "POST",
                data: {
                    id,
                },
                success: function(resp) {
                    if (resp == 1) {
                        alert_toast("Order cancelled successfully.", 'success')
                        setTimeout(() => {
                            location.reload();
                        }, 1000);
                    }
                }
            })
        }
    }
</script>