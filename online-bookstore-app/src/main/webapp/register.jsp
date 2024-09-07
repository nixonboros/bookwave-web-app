<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Register - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <h1 class="formTitle">Register</h1>
            <form action="" method="POST" class="form">
                <div class="form-group">
                    <label class="formLabel" for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="password2">Confirm Password</label>
                    <input type="password" id="password2" name="password2" required>
                </div>
                <input type="hidden" id="submitted" name="submitted" value="yes">
                
                <div class="centerDiv">
                    <label for ="staffCheckbox" class="formLabel">Staff Member?</label>
                    <input type="checkbox" id="staffCheckbox" name="staffCheckbox"
                           onchange="document.getElementById('staffIDField').style.display = this.checked ? 'block' : 'none'">
                    <div id="staffIDField" style="display: none;"><br>
                        <label class="formLabel" for="staff_id">Staff ID</label>
                        <input type="text" id="staff_id" name="staff_id">
                    </div>
                    
                </div><div class="centerDiv">
                        <button type="submit" class="button" id="submit" name="submit">Register</button>
                    </div>
            </form>
        </section>
        <script>
            var password = document.getElementById("password"),confirm_password = document.getElementById("password2");
            function validatePassword(){
                if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords do not match");
                } 
                else {
                    confirm_password.setCustomValidity('');
                }
            }

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
        </script>
    </main>
</body>
</html>
