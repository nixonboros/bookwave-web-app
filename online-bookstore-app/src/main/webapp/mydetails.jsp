<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>My Details - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <% User user = (User) request.getSession().getAttribute("user");%>
    <main>
        <section class="contact-section animated">
            <%String name = user.getFirstName();%>
            <h1><% out.println(name + "'s"); %> Details </h1>
            <p>Here you can view your details as well as change them if you want.</p>

            <div class="tabs">
                <div class="tab active" data-target="dashboard">My Account Details</div>
                <div class="tab" data-target="editAccount">Edit my Account</div>
                <div class="tab" data-target="deleteAccount">Delete my Account</div>

            </div>
            
            <!-- DASHBOARD TAB -->
            <div id="dashboard" class="tab-content active">
                <h1>My Account Details</h1>
            <div class="account-info">
                <!-- Account Details Section -->
                <div class="account-field">
                    <label><b>First Name:</b><% 
                    if (user != null) {
                    String firstName = user.getFirstName();
                    out.println("<a>" + " " + firstName);
                }
                    %></label>
                </div>
                <div class="account-field">
                    <label><b>Surname:</b><% 
                    if (user != null) {
                    String lastName = user.getLastName();
                    out.println("<a>" + " " + lastName);
                }
                    %></label>
                </div>
                <div class="account-field">
                    <label><b>Email:</b><%
                    if (user != null) 
                    {
                        String lastName = user.getEmail();
                        out.println("<a>" + " " + lastName);
                    }%></label>
                </div>
                <div class="account-field">
                    <label for="dateSubmitted"><b>Date of Birth:</b><%
                    if (user != null) 
                    {
                        String dob = user.getDob();
                        out.println("<a>" + " " + dob);
                    }%></label>
                </div>
                <div class="account-field">
                    <label for="status"><b>Phone Number:</b><%
                    if (user != null) 
                    {
                        String phone = user.getPhone();
                        out.println("<a>" + " " + phone);
                    }%>
                </div>
                <div class="account-field">
                    <label for="type"><b>Address:</b><%
                    if (user != null) 
                    {
                        String address = user.getAddress();
                        String city = user.getCity();
                        String postcode = user.getPostcode();
                        String country = user.getCountry();
                        out.println("<a>" + " " + address + " " + city + " " + postcode + " " + country);
                    }%>
                </div>
                
                <div class="account-field">
                    <label for="description"><b>Membership:</b></label>
                    <span id="status">None.</span>
                </div>
            </div>

            </div>
            
            <!-- EDIT ACCOUNT TAB -->
            <div id="editAccount" class="tab-content">
                <h2>Edit Account Details</h2>
                <form id="editAccountForm" action="detailUpdate_success.jsp" method="post">
                    
                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" id="email" name="email" placeholder="Enter your new email address" required>
                    </div>

                    <div class="form-group">
                        <label for="subjectTitle">Address:</label>
                        <input type="text" id="subjectTitle" name="subjectTitle" placeholder="Enter your new address" required>
                    </div>

                    <div class="form-group">
                        <label for="subjectTitle">Phone Number:</label>
                        <input type="text" id="subjectTitle" name="subjectTitle" placeholder="Enter your new phone number" required>
                    </div>                           
                    
                    <div class="form-group">
                        <button type="submit" id="editAccountButton" disabled>Submit New Details</button>
                    </div>
                </form>
            </div>
            <!-- DELETE ACCOUNT TAB -->
            <div id="deleteAccount" class="tab-content">
                <!-- DELETE ACCOUNT BUTTON -->
    <div class="form-group">
        <form action="DeleteAccountServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This can not be undone.');">
            <button type="submit" class="delete-button">Delete Account</button>
        </form>
    </div>

            </div>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            function validateForm(formId, buttonId) {
                const form = document.getElementById(formId);
                const submitButton = document.getElementById(buttonId);
                const inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
                
                function updateButtonState() {
                    let allValid = true;

                    inputs.forEach(input => {
                        if (input.type === 'select-one') {
                            // Check if select field has a value
                            if (!input.value.trim()) {
                                allValid = false;
                            }
                        } else {
                            // Check if input field is filled
                            if (!input.value.trim()) {
                                allValid = false;
                            }
                        }
                    });

                    submitButton.disabled = !allValid;
                    submitButton.style.backgroundColor = allValid ? '#4CAF50' : '#ccc';
                }

                form.addEventListener('input', updateButtonState);
                form.addEventListener('change', updateButtonState); // Add change event listener for select fields
                updateButtonState(); // Initial check
            }

            // Validate the edit account form
            validateForm('editAccountForm', 'editAccountButton');

            // Tab functionality
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const targetId = tab.getAttribute('data-target');

                    tabs.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(content => content.classList.remove('active'));

                    tab.classList.add('active');
                    document.getElementById(targetId).classList.add('active');
                });
            });
        });
    </script>
</body>
</html>
