
<?php 
session_start();
include ('nav.php');
include ('../database/db.php');
?>


<div class="content w-full">
            <div class="container pt-5">
                <div class="row">
                    <div class="col-10 mx-auto">


            <?php include ('../validation/message.php'); ?>

                <form class="row g-3 border p-4" action="../handlers/addadmin.php" method="POST">
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">name</label>
                        <input type="text" name="name" class="form-control" id="inputEmail4">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="inputEmail4">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail4" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="inputEmail4">
                    </div>
                    <div class="col-sm-12">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <input type="password" class="form-control"  id="password" name="password"  placeholder="Enter your password" required>
                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                    <i class="bi bi-eye-fill"></i>
                    </button>
                </div>
                <div class="invalid-feedback">
                    Valid password is required.
                </div>
            </div>

                    <div class="col-12">
                        <button type="submit" name="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>


    </div>

    
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/all.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/all.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#togglePassword').click(function() {
            var passwordInput = $('#password');
            var passwordType = passwordInput.attr('type');

            if (passwordType === 'password') {
                passwordInput.attr('type', 'text');
                $(this).html('<i class="bi bi-eye-slash"></i>');
            } else {
                passwordInput.attr('type', 'password');
                $(this).html('<i class="bi bi-eye"></i>');
            }
        });
    });
    </script>