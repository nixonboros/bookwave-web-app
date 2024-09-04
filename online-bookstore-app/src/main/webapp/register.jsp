<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Bookstore</title>
</head>
<body>
    <header>
    <nav>
        <div class="logo">Bookstore</div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="product.jsp">Products</a></li>
                <li><a href="order.jsp">Orders</a></li>
                <li><a href="payment.jsp">Payments</a></li>
            
        </ul>

        <div class="user-actions">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>

    </nav>
    </header>
    <div class="formDivv">
        <div class="formDiv">
            <h1 class="formTitle">Register</h1><br>
        </div>
        <div class="formDiv">
            <form action="" method="POST" class="form">
                <label class="formLabel" for="name">First Name</label>
                <input type="text" id="firstName" name="firstName" required><br><br>
                <label class="formLabel" for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required><br><br>
                <label class="formLabel" for="email">Email</label>
                <input type="text" id="email" name="email" required><br><br>
                <label class="formLabel" for="password">Password</label>
                <input type="password" id="password" name="password" required><br><br>
                <label class="formLabel" for="password2">Confirm Password</label>
                <input type="password" id="password2" name="password2" required><br><br>
                <label class="formLabel" for="tos">Terms of Service</label>
                <div class="centerDiv">
                    <input type="checkbox" id="tos" name="tos" required><br><br>
                    <div>
                        <input type="hidden" id="submitted" name="submitted" value="yes">
                        <input class="submitButton" type="submit" id="submit" name="submit"><br>
                    </div>
                </div>
            </form>
        </div> 
    </div>
</body>
</html>
