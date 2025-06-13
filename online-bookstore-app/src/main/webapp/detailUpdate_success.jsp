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
    <title>Account Update Status - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <div class="orders-boundary">
            <div class="orders-table-card success-section" style="max-width: 480px; margin: 3rem auto 0 auto; text-align: center;">
                <img src="images/success.png" alt="Success" style="width: 90px; margin-bottom: 1.5rem;" />
                <h1 class="orders-title" style="font-size: 2rem; margin-bottom: 1rem;">Details have been updated!</h1>
                <p style="color: var(--text-secondary, #64748b); margin-bottom: 2rem;">Your details have been updated. Feel free to continue browsing.</p>
                <div class="success-buttons" style="display: flex; gap: 1rem; justify-content: center;">
                    <a href="index.jsp" class="button button-primary">Home</a>
                    <a href="mydetails.jsp" class="button button-primary">My Account</a>
                </div>
            </div>
        </div>
    </main><jsp:include page="footer.jsp"/>
</body>
</html>
