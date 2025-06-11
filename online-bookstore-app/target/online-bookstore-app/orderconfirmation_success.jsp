<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/footer.css">
    <title>Order Confirmation - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="success-section">
            <img src="images/success.png" alt="Success">
            <h1>Thank you for your purchase!</h1>
            <p>Your order has been successfully placed and is being processed.</p>
            <div class="success-buttons">
                <a href="UserOrderDashboardServlet" class="button">View Orders</a>
            </div>
        </section>
    </main>
</body>
</html>
