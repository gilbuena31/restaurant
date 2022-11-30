
<?php 



$sql = "SELECT * FROM  product_list order by rand()";


if(isset($_POST["Bagutte"])) {
    $sql = "SELECT * FROM  product_list WHERE category_id='1' order by rand()";
}


if(isset($_POST["Coffee"])) {
    $sql = "SELECT * FROM  product_list WHERE category_id='2' order by rand()";
}

if(isset($_POST["Crepes"])) {
    $sql = "SELECT * FROM  product_list WHERE category_id='3' order by rand()";
}

if(isset($_POST["Shake"])) {
    $sql = "SELECT * FROM  product_list WHERE category_id='4' order by rand()";
}


 ?>




 <header class="masthead">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
 </header>


 <section class="page-section" id="menu">
<center>
    <div class="dropdown" >
  <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Category
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <button class="btn btn-primary dropdown-item" type="submit" name="Bagutte">Baguette</button>
        <button class="btn btn-primary dropdown-item" type="submit" name="Coffee">Coffee</button>
        <button class="btn btn-primary dropdown-item" type="submit" name="Crepes">Crepes</button>
        <button class="btn btn-primary dropdown-item" type="submit" name="Shake">Shake</button>
    </form>
  </div>
</div>
</center>
<br />
     <div id="menu-field" class="card-deck">

        
         <?php

                    include'admin/db_connect.php';
                    $qry = $conn->query($sql);
                    while($row = $qry->fetch_assoc()):
                    ?>
         <div class="col-lg-3" style="padding-left: 20px;">
             <div class="card menu-item " style="    background: #ec2261; color: #fff;border-color: #ec2261; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; margin-bottom: 25px; margin-right: 5px;">
                 <img src="assets/img/<?php echo $row['img_path'] ?>" class="card-img-top" width="100" height="300" alt="...">
                 <div class="card-body">
                     <h5 class="card-title"><?php echo $row['name'] ?></h5>
                     <p class="card-text truncate"><?php echo $row['description'] ?></p>
                     <p>
                         <span class="small text-white">Unit Price:</span>
                         <span><?php echo $row['price'] ?></span>
                    </p>
                     <p>
                         <span class="small text-white">Stocks: </span>
                         <span><?php echo $row['stocks'] ?> </span>

                     </p>
                     <div class="text-center">
                         <?php if ($row['stocks'] == 0){
                         echo '<button class="btn btn-sm btn-outline-primary view_prod btn-block" disabled>Out of stock</button>';
                     }else{
                         echo '<button class="btn btn-sm btn-outline-primary view_prod btn-block"
                         data-id='.$row["id"].'><i class="fa fa-eye"></i> Buy Now</button>';
                         } ?>
                     </div>
                 </div>

             </div>
         </div>
         <?php endwhile; ?>
     </div>
 </section>
 <script>
$('.view_prod').click(function() {
    uni_modal_right('Product', 'view_prod.php?id=' + $(this).attr('data-id'))
})
 </script>
