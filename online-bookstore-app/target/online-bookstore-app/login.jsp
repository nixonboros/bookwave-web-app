<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Login - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <h1 class="formTitle">Bookstore Log In</h1>
            <form action="LoginServlet" method="POST" class="form">
                <div class="form-group">
                    <label class="formLabel" for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <input type="hidden" id="submitted" name="submitted" value="yes">
                <div class="centerDiv">
                    <button type="submit" class="button" id="submit" name="submit">Login</button><br>
                    <!-- Adding block display for register and staff login links -->
                    <a href="register.jsp" class="register-link">Create a new account</a><br>
                    <a href="staffLogin.jsp" class="staff-login-link">Login as staff</a>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
