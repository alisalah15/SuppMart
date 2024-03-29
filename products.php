<?php 
include('nav.php');
include ('database/db.php');

// Pagination
$currentPage = isset($_GET['page']) ? $_GET['page'] : 1;
$productsPerPage = 20;
$offset = ($currentPage - 1) * $productsPerPage;

// Search
if (isset($_GET['search'])) {
    $search = $_GET['search'];
    if (!empty($search)) {
        $sql = "SELECT * FROM `products` WHERE `name` LIKE '%$search%' ORDER BY RAND() LIMIT $offset, $productsPerPage";
    } else {
        $sql = "SELECT * FROM `products` ORDER BY RAND() LIMIT $offset, $productsPerPage";
    }
} else {
    // Filter by category
    if (isset($_GET['categ'])) {
        $category = $_GET['categ'];
        if ($category == 'all') {
            $sql = "SELECT * FROM `products` ORDER BY RAND() LIMIT $offset, $productsPerPage";
        } else {
            $sql = "SELECT * FROM `products` WHERE `categ_id` = $category ORDER BY RAND() LIMIT $offset, $productsPerPage";
        }
    } else {
        $sql = "SELECT * FROM `products` ORDER BY RAND() LIMIT $offset, $productsPerPage";
    }
}
// Get total number of products for pagination
$countSql = "SELECT COUNT(*) AS total FROM `products`";
$countResult = mysqli_query($conn, $countSql);
$countRow = mysqli_fetch_assoc($countResult);
$totalProducts = $countRow['total'];
$totalPages = ceil($totalProducts / $productsPerPage);

$result1 = mysqli_query($conn, $sql);

$categ = "SELECT * FROM `categ`";
$categResult = mysqli_query($conn, $categ);
?>

<div class="products" id="products">
    <center>
        <!-- start filter -->
        <div class="col-md-3">
            <label for="inputState" class="form-label"><h5>Category</h5></label>
            <form action="products.php" method="GET">
                <select name="categ" class="form-select" onchange="this.form.submit()">
                    <option value="all" <?php if (!isset($_GET['categ']) || $_GET['categ'] == 'all') echo 'selected'; ?>>All</option>
                    <?php while ($category = mysqli_fetch_assoc($categResult)) { ?>
                        <option value="<?php echo $category['id']; ?>" <?php if (isset($_GET['categ']) && $_GET['categ'] == $category['id']) echo 'selected'; ?>><?php echo $category['name']; ?></option>
                    <?php } ?>
                </select>
            </form>
        </div>
    </center>
    
    <!-- Search bar -->
    <div class="col-md-6 offset-md-3 mt-4">
    <form action="products.php" method="GET">
            <div class="input-group">
                <input type="text" class="form-control" name="search" placeholder="Search products">
                <button type="submit" class="btn btn-primary">Search</button>
                <?php if (isset($_GET['search']) && !empty($_GET['search'])) { ?>
                    <a href="products.php" class="btn btn-secondary">Show All</a>
                <?php } ?>
            </div>
        </form>
    </div>
    <!-- start products -->

    <h1 class="special-heading">products</h1>
    <p>get ready to create</p>

    <div class="section-1">
        <div class="container">
            <?php while ($product = mysqli_fetch_assoc($result1)) { ?>
                <div class="box">
                    <img src="uploads/<?php echo $product['IMG']; ?>" alt="">
                    <div class="content">
                        <h3><?php echo $product['name']; ?></h3>
                        <p>Price: <?php echo $product['price']; ?></p>
                    </div>
                    <div class="info">
                        <a href="show-product.php?id=<?php echo $product['id'];?>">Show Product</a>
                        <i class="fas fa-long-arrow-alt-right"></i>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
    <!-- Pagination -->
    <nav>
        <ul class="pagination justify-content-center">
            <?php for ($i = 1; $i <= $totalPages; $i++) { ?>
                <li class="page-item <?php if ($currentPage == $i) echo 'active'; ?>"><a class="page-link" href="products.php?page=<?php echo $i; ?>"><?php echo $i; ?></a></li>
            <?php } ?>
        </ul>
    </nav>
</div>

<!-- end products -->
     <!-- start footer -->
   <div class="footer">
    <div class="container">
    &copy;2023 <span> SuppMart </span> All Right Reserved
   
    <div class="social">
        Find Us On Social Networks <br>
        <i class="fa-brands fa-youtube"></i>
        <i class="fa-brands fa-facebook-f"></i>
        <i class="fa-brands fa-twitter"></i>
    </div>
      </div>
   </div>
   <!-- end footer -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/all.min.js"></script>
</body>
</html>