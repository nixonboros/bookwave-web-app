<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Staff Login - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <h1 class="formTitle">Staff Log In</h1>
            <form action="staffDashboard.jsp" method="POST" class="form">
                <div class="form-group">
                    <label class="formLabel" for="staffEmail">Staff Email</label>
                    <input type="email" id="staffEmail" name="staffEmail" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="staffPassword">Password</label>
                    <input type="password" id="staffPassword" name="staffPassword" required>
                </div>
                <input type="hidden" id="submitted" name="submitted" value="yes">
                <div class="centerDiv">
                    <button type="submit" class="button" id="submit" name="submit">Login</button><br>
                    <a href="staffRegister.jsp" class="register-link">Register Staff</a> 
                </div>
            </form>
            <p class="note">*Note: For now, clicking login will take you to the <strong>Staff Dashboard</strong> directly.</p>
        </section>
    </main>
</body>
</html>
