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

    <main>
        <section class="contact-section animated">
            <h1>My Details</h1>
            <p>Welcome to My Details. Here you can view your details as well as change them if you want.</p>

            <div class="tabs">
                <div class="tab active" data-target="dashboard">My Account Details</div>
                <div class="tab" data-target="submitTicket">Edit my Account</div>

            </div>
            
            <!-- DASHBOARD TAB -->
            <div id="dashboard" class="tab-content active">
                <h1>My Account Details</h1>
            <div class="ticket-info">
                <!-- Ticket Details Section -->
                <div class="ticket-field">
                    <label for="ticketID">First Name:</label>
                    <span id="ticketID">John</span>
                </div>
                <div class="ticket-field">
                    <label>Surname:</label>
                    <span id="subjectTitle">Book</span>
                </div>
                <div class="ticket-field">
                    <label>Email:</label>
                    <span id="subjectTitle">johnbook@ilovebooks.com</span>
                </div>
                <div class="ticket-field">
                    <label for="type">Address:</label>
                    <span id="type">123 Bookstore</span>
                </div>
                <div class="ticket-field">
                    <label for="status">Phone Number:</label>
                    <span id="status">04123 456 789</span>
                </div>
                <div class="ticket-field">
                    <label for="dateSubmitted">Account Created:</label>
                    <span id="dateSubmitted">2024-09-01</span>
                </div>
                <div class="ticket-field">
                    <label for="description">Membership:</label>
                    <span id="status">None.</span>
                </div>
            </div>

            </div>
            
            <!-- CREATE NEW TICKET TAB -->
            <div id="submitTicket" class="tab-content">
                <h2>Edit Account Details</h2>
                <form id="submitTicketForm" action="detailUpdate_success.jsp" method="post">
                    
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
                        <button type="submit" id="submitTicketButton" disabled>Submit New Details</button>
                    </div>
                </form>
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

            // Validate the submit ticket form
            validateForm('submitTicketForm', 'submitTicketButton');

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
