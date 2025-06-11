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
        <section class="form-section animated" style="min-height: 80vh; display: flex; align-items: center; justify-content: center;">
            <div class="staff-login-container" style="padding: 3rem 2.5rem 2.5rem 2.5rem; box-shadow: 0 2px 16px 0 rgba(60,72,88,0.10); border-radius: 1.25rem; background: #fff;">
                <h1 style="margin-bottom: 2rem;">Staff Log In</h1>
                <form action="StaffLoginServlet" method="POST" class="form" style="display: flex; flex-direction: column; gap: 1.25rem;">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <% String errorMessage = request.getParameter("error"); %>
                    <p class="error-message" id="staffLoginError"><%= errorMessage != null ? "Invalid email or password. Please try again." : "" %></p>
                    <input type="hidden" id="submitted" name="submitted" value="yes">
                    <button type="submit" class="button button-primary" style="margin-top: 0.5rem;">Login</button>
                </form>
                <div class="login-links" style="margin-top: 1.5rem; text-align: center; display: flex; flex-direction: column; gap: 0.5rem;">
                    <a href="staffRegister.jsp" class="register-link">Create a staff account</a>
                    <a href="login.jsp" class="user-link">Login as user</a>
                </div>
            </div>
        </section>
    </main>
    
    <jsp:include page="footer.jsp"/>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
      var errorMsg = document.getElementById('staffLoginError');
      if (errorMsg && errorMsg.textContent.trim() !== "") {
        setTimeout(function() {
          errorMsg.style.opacity = 0;
        }, 5000);
      }
    });
    </script>
</body>
</html>
