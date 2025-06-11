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
    <title>Staff Login - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <div class="staff-login-container">
                <h1>Staff Log In</h1>
                <form action="StaffLoginServlet" method="POST" class="form">
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
                    <a href="staffRegister.jsp" class="register-link">Create a staff account</a>
                    <a href="login.jsp" class="user-link">Login as user</a>
                </div>
            </div>
        </section>
    </main>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>
