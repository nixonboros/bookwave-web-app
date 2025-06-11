<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Register - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <section class="form-section animated">
            <h1 class="formTitle">Customer Registration</h1>
            <form action="RegisterServlet" method="POST" class="form">
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
                    <label class="formLabel" for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" required>
                </div>

                <div class="form-group">
                    <label class="formLabel" for="phone">Phone Number</label>
                    <div class="phone-group">
                        <select id="countryCode" name="countryCode" required>
                            <option value="+1">+1 (USA)</option>
                            <option value="+44">+44 (UK)</option>
                            <option value="+61">+61 (Australia)</option>
                            <option value="+91">+91 (India)</option>
                            <option value="+81">+81 (Japan)</option>
                            <option value="+49">+49 (Germany)</option>
                            <option value="+33">+33 (France)</option>
                        </select>
                        <input type="tel" id="phone" name="phone" required placeholder="Phone Number">
                    </div>
                </div>

                <!-- Password and Confirm Password with Strength Meter -->
                <div class="form-group">
                    <label class="formLabel" for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Password" oninput="checkPasswordStrength(); validatePasswordMatch();">
                    <small id="password-strength" class="password-strength">Password strength: Weak</small>
                </div>
                <div class="form-group">
                    <label class="formLabel" for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm Password" oninput="validatePasswordMatch();">
                </div>

                <!-- Address Fields -->
                <div class="form-group">
                    <label class="formLabel" for="address">Address</label>
                    <input type="text" id="address" name="address" required placeholder="Street Address">
                </div>
                <div class="form-group">
                    <label class="formLabel" for="city">City</label>
                    <input type="text" id="city" name="city" required placeholder="City">
                </div>
                <div class="form-group">
                    <label class="formLabel" for="postcode">Postcode</label>
                    <input type="text" id="postcode" name="postcode" required placeholder="Postcode">
                </div>
                <div class="form-group">
                    <label class="formLabel" for="country">Country</label>
                    <input type="text" id="country" name="country" required placeholder="Country">
                </div>
                <div class="terms-and-conditions-group">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the Terms and Conditions</a></label>
                </div>


                <input type="hidden" id="submitted" name="submitted" value="yes">
                <div class="centerDiv">
                    <button type="submit" class="button" id="submit" name="submit">Register</button>
                </div>
                
            </form>
        </section>
    
    <script>
        const password = document.getElementById("password");
        const confirmPassword = document.getElementById("confirmPassword");
        const strengthText = document.getElementById("password-strength");

        // Validate password strength
        function checkPasswordStrength() {
            const value = password.value;
            let strength = "Weak";
            let strengthColor = "red";

            if (value.length >= 8) {
                strength = "Strong";
                strengthColor = "green";
                
            } else if (value.length >= 6) {
                strength = "Moderate";
                strengthColor = "orange";
            }
            
            strengthText.textContent = "Password strength: " + strength;
            strengthText.style.color = strengthColor;
        }

        // check that passwords match
        function validatePasswordMatch() {
            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("Passwords do not match");
            } else {
                confirmPassword.setCustomValidity('');
            }
        }

        // Attach event listeners to password fields
        password.addEventListener('input', checkPasswordStrength);
        confirmPassword.addEventListener('input', validatePasswordMatch);
    </script>
    </main>
</body>
</html>
