<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>

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
    <title>My Details - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <% User user = (User) request.getSession().getAttribute("user"); %>
    <main>
        <div class="orders-boundary">
            <div class="orders-header-card">
                <% String name = user.getFirstName(); %>
                <h1 class="orders-title"><% out.println(name + "'s"); %> Details</h1>
                <p class="orders-desc">Here you can view your details as well as change them if you want.</p>
                <div class="contact-tabs" style="margin-top: 2rem;">
                    <button class="tab-btn active" type="button" data-target="dashboard">My Account Details</button>
                    <button class="tab-btn" type="button" data-target="editAccount">Edit my Account</button>
                </div>
            </div>
            <div class="orders-table-card" style="margin-bottom: 2rem;">
                <div id="dashboard" class="tab-content" style="display: block;">
                    <h2 class="section-title">My Account Details</h2>
                    <div class="account-info" style="margin-bottom: 2rem;">
                        <div class="account-field"><label><b>Name:</b> <span><%= user.getFirstName() %> <%= user.getLastName() %></span></label></div>
                        <div class="account-field"><label><b>Email:</b> <span><%= user.getEmail() %></span></label></div>
                        <div class="account-field"><label><b>Date of Birth:</b> <span><%= user.getDob() %></span></label></div>
                        <div class="account-field"><label><b>Phone Number:</b> <span><%= user.getPhone() %></span></label></div>
                        <div class="account-field"><label><b>Address:</b> <span><%= user.getAddress() %> <%= user.getCity() %> <%= user.getPostcode() %> <%= user.getCountry() %></span></label></div>
                        <div class="account-field"><label><b>Membership:</b> <span id="status">None.</span></label></div>
                    </div>
                    <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This cannot be undone.');" style="display: flex; justify-content: flex-end;">
                        <button type="submit" class="button button-primary" style="background: #ef4444; color: #fff; border: none; min-width: 180px;">Delete Account</button>
                    </form>
                </div>
                <div id="editAccount" class="tab-content" style="display: none;">
                    <h2 class="section-title">Edit Account Details</h2>
                    <form id="editAccountForm" action="UpdateAccountServlet" method="post" class="support-form" style="margin: 0 auto;">
                        <div class="form-group">
                            <label for="firstName">First Name:</label>
                            <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth:</label>
                            <input type="date" id="dob" name="dob" value="<%= user.getDob() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" required class="styled-input">
                            <small style="color: red;" id="phoneWarning" hidden>Phone number can only be numbers.</small>
                        </div>
                        <div class="form-group">
                            <label for="address">Address:</label>
                            <input type="text" id="address" name="address" value="<%= user.getAddress() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="city">City:</label>
                            <input type="text" id="city" name="city" value="<%= user.getCity() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="postcode">Postcode:</label>
                            <input type="text" id="postcode" name="postcode" value="<%= user.getPostcode() %>" pattern="\d*" title="Postcode must contain digits only" required class="styled-input">
                            <small style="color: red;" id="postcodeWarning" hidden>Postcode can only be numbers.</small>
                        </div>
                        <div class="form-group">
                            <label for="country">Country:</label>
                            <input type="text" id="country" name="country" value="<%= user.getCountry() %>" required class="styled-input">
                        </div>
                        <div class="form-group">
                            <label for="password">New Password:</label>
                            <input type="password" id="password" name="password" class="styled-input">
                        </div>
                        <% String status = request.getParameter("status"); %>
                        <% if ("error".equals(status)) { %>
                            <div class="error-message">
                                <p style="color: red;">An error occurred while processing your request. Please try again.</p>
                            </div>
                        <% } %>
                        <div class="form-group" style="display: flex; justify-content: flex-end;">
                            <button type="submit" id="editAccountButton" class="button button-primary" disabled style="min-width: 180px;">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            function validateForm(formId, buttonId) {
                const form = document.getElementById(formId);
                const submitButton = document.getElementById(buttonId);
                const inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
                const postcodeInput = document.getElementById('postcode');
                const postcodeWarning = document.getElementById('postcodeWarning');
                const phoneInput = document.getElementById('phone');
                const phoneWarning = document.getElementById('phoneWarning');
                
                postcodeInput.addEventListener('input', () => {
                    const isValid = /^[0-9]*$/.test(postcodeInput.value);
                    postcodeWarning.hidden = isValid;
                });
                
                phoneInput.addEventListener('input', () => {
                    const isValid = /^[0-9]*$/.test(phoneInput.value);
                    phoneWarning.hidden = isValid;
                });

                function updateButtonState() {
                    let allValid = true;

                    inputs.forEach(input => {
                        if (input.type === 'select-one') {
                            if (!input.value.trim()) {
                                allValid = false;
                            }
                        } else {
                            if (!input.value.trim()) {
                                allValid = false;
                            }
                        }
                    });

                    submitButton.disabled = !allValid;
                    submitButton.style.backgroundColor = allValid ? '#4CAF50' : '#ccc';
                }

                form.addEventListener('input', updateButtonState);
                form.addEventListener('change', updateButtonState);
                updateButtonState();
            }

            validateForm('editAccountForm', 'editAccountButton');

            const tabBtns = document.querySelectorAll('.tab-btn');
            const tabContents = [
                document.getElementById('dashboard'),
                document.getElementById('editAccount')
            ];
            tabBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    tabBtns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                    tabContents.forEach(tc => tc.style.display = 'none');
                    document.getElementById(btn.dataset.target).style.display = 'block';
                });
            });
        });
    </script>
</body>
</html>
