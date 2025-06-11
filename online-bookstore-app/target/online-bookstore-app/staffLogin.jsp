<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Staff Login - Bookstore</title>
    <style>
        body {
            background: #f8fafc;
        }
        .staff-login-container {
            max-width: 420px;
            margin: 3.5rem auto 2.5rem auto;
            background: #fff;
            border-radius: 1.25rem;
            box-shadow: 0 4px 32px rgba(30,41,59,0.10);
            padding: 2.5rem 2rem 2rem 2rem;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }
        .staff-login-container h1 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-primary, #1e293b);
        }
        .staff-login-container form {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
        }
        .staff-login-container input[type="text"],
        .staff-login-container input[type="password"] {
            padding: 0.75rem 1rem;
            border-radius: 0.75rem;
            border: 1px solid var(--border, #e2e8f0);
            font-size: 1rem;
            background: #f8fafc;
            transition: border-color 0.2s;
        }
        .staff-login-container input[type="text"]:focus,
        .staff-login-container input[type="password"]:focus {
            border-color: var(--primary, #2563eb);
            outline: none;
        }
        .staff-login-container .button.button-primary {
            width: 100%;
            margin-top: 0.5rem;
            border-radius: 999px;
            font-weight: 600;
            font-size: 1.08rem;
            padding: 0.75rem 0;
            box-shadow: 0 2px 8px rgba(37,99,235,0.08);
            transition: background 0.2s, box-shadow 0.2s;
        }
        .staff-login-container .button.button-primary:hover,
        .staff-login-container .button.button-primary:focus {
            background: var(--primary-dark, #1d4ed8);
            color: #fff;
            box-shadow: 0 4px 16px rgba(37,99,235,0.12);
        }
        .staff-login-container .login-links {
            margin-top: 1.5rem;
            text-align: center;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        .staff-login-container .login-links a {
            color: var(--primary, #2563eb);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        .staff-login-container .login-links a:hover {
            color: var(--primary-dark, #1d4ed8);
            text-decoration: underline;
        }
    </style>
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
