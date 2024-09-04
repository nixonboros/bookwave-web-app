<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
    <title>Contact Us - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="contact-section animated">
            <h1>Contact Us</h1>
            <p>If you are experiencing any issues or have any questions, please use the tabs below to access the relevant form.</p>

            <div class="tabs">
                <div class="tab active" data-target="submitTicket">Create New Ticket</div>
                <div class="tab" data-target="checkStatus">Check Ticket Status</div>
            </div>

            <div id="submitTicket" class="tab-content active">
                <h2>Submit Your Support Request</h2>
                <form id="submitTicketForm" action="submitTicket" method="post">
                    <div class="form-group">
                        <label for="name">Full Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="issue">Issue Description:</label>
                        <textarea id="issue" name="issue" rows="5" required></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" id="submitTicketButton" disabled>Submit Ticket</button>
                    </div>
                </form>
            </div>

            <div id="checkStatus" class="tab-content">
                <h2>View the Status of Your Request</h2>
                <form id="checkStatusForm" action="checkTicketStatus" method="post">
                    <div class="form-group">
                        <label for="ticketID">Ticket ID:</label>
                        <input type="text" id="ticketID" name="ticketID" required>
                    </div>

                    <div class="form-group">
                        <button type="submit" id="checkStatusButton" disabled>Check Status</button>
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
                const inputs = form.querySelectorAll('input[required], textarea[required]');
                
                function updateButtonState() {
                    let allValid = true;

                    inputs.forEach(input => {
                        if (!input.value.trim()) {
                            allValid = false;
                        }
                    });

                    submitButton.disabled = !allValid;
                    submitButton.style.backgroundColor = allValid ? '#4CAF50' : '#ccc';
                }

                form.addEventListener('input', updateButtonState);
                updateButtonState(); // Initial check
            }

            // Validate both forms
            validateForm('submitTicketForm', 'submitTicketButton');
            validateForm('checkStatusForm', 'checkStatusButton');

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
