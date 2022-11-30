<?php 
    if(!isset($_SESSION['login_user_id'])){
        header("location: index.php?page=home");
    }else{
        if(isset($_GET["id"]) && !empty($_GET["id"])){
            $get = $conn->query("SELECT * from order_list ol INNER JOIN product_list pl ON pl.id = ol.product_id WHERE ol.order_id = ".$_GET["id"]);
        }else{
            header("location: index.php?page=account");
        }
    }
 ?>

<?php
$rowid = $_GET['id'];
if(isset($_POST['confirm'])){
    $sql = "UPDATE orders SET user_confirmation = 'Confirmed' WHERE id='$rowid'";
    if(mysqli_query($conn, $sql)){
    echo "Successfully Confirmed.";
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

}




?>




<header class="masthead">
     <div class="container h-100">
         <div class="row h-100 d-flex align-items-center justify-content-center text-center">
             <div class="col-lg-10 align-self-end mb-4 page-title"style="background:transparent;">
                 <h3 class="text-uppercase text-white font-weight-bold">Order #<?php echo $_GET["id"] ?></h3>
                 <hr class="divider my-4" />
             </div>
         </div>
     </div>
 </header>

 <div class="container mt-5">
    <table class="table table-bordered;">    
    <thead>
    <tr>
        <th>#</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>qty</th>
        <th>Total</th>
        <th>Action</th>
    </tr>
</thead>
    <tbody>
<?php 
//$total = 0;
$i = 1;
while($row= $get->fetch_assoc()):
?>
    <tr>
        <td><?php echo $i++?></td>
        <td><?php echo $row['name']?></td>  
        <td><?php echo $row['price']?></td>
        <td><?php echo $row['qty']?></td>
        <td><?php echo number_format($row['qty'] * $row['price'])?></td>
        <td>

        <?php
        
        
        ?>
            <form action="" method="post">
            <button name="confirm" class="btn btn-primary" onclick="alert('Successfully Confirmed')">Confirm</button>
            </form>
        </td>
        </tr>
        <?php endwhile; ?>
        </tbody>
    </table>    
 <div>