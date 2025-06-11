<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/footer.css">
    <title>Login - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <div class="login-container">
                <h1>Bookstore Log In</h1>
                <form action="LoginServlet" method="POST" class="form">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <%
                    String errorMessage = request.getParameter("error");
                    if (errorMessage != null) {
                    %>
                        <p class="error-message" style="color: red;">Invalid email or password. Please try again.</p>
                    <% 
                        }
                    %>
                    <input type="hidden" id="submitted" name="submitted" value="yes">
                    <button type="submit" class="button button-primary">Login</button>
                </form>
                <div class="login-links">
                    <a href="register.jsp" class="register-link">Create a new account</a>
                    <a href="staffLogin.jsp" class="staff-link">Login as staff</a>
                </div>
            </div>
        </section>
    </main>

    
</body><jsp:include page="footer.jsp"/>
</html>
