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
    <title>Support Ticket Success - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="success-section">
            <img src="images/success.png" alt="Success">
            <h1>Request has been sent!</h1>
            <p>Thank you for submitting your request. We will get back to you shortly.</p>
            <div class="success-buttons">
                <a href="UserSupportDashboardServlet" class="button">Back to dashboard</a>
            </div>
        </section>
    </main>
</body>
</html>
