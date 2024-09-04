<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
    <title>Login - Bookstore</title>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <img src="images/booklogo.png" alt="Bookstore Logo" class="logo-img">
                Bookstore
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="product.jsp">Products</a></li>
                <li><a href="order.jsp">Orders</a></li>
                <li><a href="payment.jsp">Payment</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>

            <div class="user-actions">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </nav>
    </header>

    <main>
        <section class="form-section animated">
            <h1 class="formTitle">Log In</h1>
            <form action="" method="POST" class="form">
                <div class="form-group">
                    <label class="formLabel" for="email">Email</label>
                    <input type="text" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <input type="hidden" id="submitted" name="submitted" value="yes">
                <div class="centerDiv">
                    <button type="submit" class="submitButton" id="submit" name="submit">Login</button><br>
                    <a href="register.jsp">Create a new account</a>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
