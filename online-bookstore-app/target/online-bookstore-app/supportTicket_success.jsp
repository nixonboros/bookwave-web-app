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
        <div class="orders-boundary">
            <div class="orders-table-card success-section" style="max-width: 480px; margin: 3rem auto 0 auto; text-align: center;">
            <img src="images/success.png" alt="Success" style="width: 90px; margin-bottom: 1.5rem;" />
            <h1 class="orders-title" style="font-size: 2rem; margin-bottom: 1rem;">Request has been sent!</h1>
            <p style="color: var(--text-secondary, #64748b); margin-bottom: 2rem;">Thank you for submitting your request. We will get back to you shortly.</p>
                <div class="success-buttons" style="display: flex; gap: 1rem; justify-content: center;">
                <a href="UserSupportDashboardServlet" class="button button-primary">Back to dashboard</a>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
