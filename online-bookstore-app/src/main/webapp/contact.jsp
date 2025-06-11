<%@ page import="com.g3app.model.SupportTicket" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
    <title>Contact Support - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <div class="orders-boundary">
            <div class="orders-header-card">
                <h1 class="orders-title">Contact Support</h1>
                <p class="orders-desc">Welcome to the support dashboard. Here you can manage your existing support tickets and submit new requests.</p>
                <div class="contact-tabs">
                    <button class="tab-btn active" data-target="dashboard">Dashboard</button>
                    <button class="tab-btn" data-target="submitTicket">Create New Ticket</button>
                </div>
            </div>
            <div class="orders-table-card contact-table-card" id="dashboard" style="display: block;">
                <h2 class="section-title">Your Support Tickets</h2>
                <p class="section-desc">Here you can view and manage all your support tickets. Click on a ticket to view its details.</p>
                <table class="orders-table support-table">
                    <thead>
                        <tr>
                            <th>Ticket ID</th>
                            <th>Subject Title</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Date Submitted</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<SupportTicket> tickets = (List<SupportTicket>) request.getAttribute("tickets");
                            if (tickets != null && !tickets.isEmpty()) {
                                for (SupportTicket ticket : tickets) {
                                    String statusClass = ticket.getStatus().equals("Closed") ? "closed-ticket" : "opened-ticket";
                        %>
                        <tr class="<%= statusClass %>">
                            <td><%= ticket.getTicketId() %></td>
                            <td><%= ticket.getSubjectTitle() %></td>
                            <td><%= ticket.getTypeOfEnquiry() %></td>
                            <td><%= ticket.getStatus() %></td>
                            <td><%= ticket.getDateSubmitted() %></td>
                            <td><a href="ViewTicketServlet?ticketId=<%= ticket.getTicketId() %>" class="button button-primary">View</a></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr><td colspan="6">No support tickets found.</td></tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="orders-table-card contact-table-card" id="submitTicket" style="display: none;">
                <h2 class="section-title">Submit Your Support Request</h2>
                <form id="submitTicketForm" action="SubmitTicketServlet" method="post" class="support-form">
                    <div class="form-group">
                        <label for="customer_name">Full Name:</label>
                        <input type="text" id="customer_name" name="customer_name" placeholder="Enter your full name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                    </div>
                    <div class="form-group">
                        <label for="subject_title">Subject Title:</label>
                        <input type="text" id="subject_title" name="subject_title" placeholder="Enter a brief title for your issue" required>
                    </div>
                    <div class="form-group">
                        <label for="type_of_enquiry">Type of Enquiry:</label>
                        <select id="type_of_enquiry" name="type_of_enquiry" required>
                            <option value="">Select an option</option>
                            <option value="General">General Inquiry</option>
                            <option value="Technical">Technical Support</option>
                            <option value="Billing">Billing Issues</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="issue_description">Issue Description:</label>
                        <textarea id="issue_description" name="issue_description" rows="5" placeholder="Describe your issue in detail" required></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="submitTicketButton" class="button button-primary" disabled>Submit Ticket</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Tab switching for contact page
            const tabBtns = document.querySelectorAll('.tab-btn');
            const tabContents = [
                document.getElementById('dashboard'),
                document.getElementById('submitTicket')
            ];
            tabBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    tabBtns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                    tabContents.forEach(tc => tc.style.display = 'none');
                    document.getElementById(btn.dataset.target).style.display = 'block';
                });
            });
            // Form validation (unchanged)
            function validateForm(formId, buttonId) {
                const form = document.getElementById(formId);
                const submitButton = document.getElementById(buttonId);
                const inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
                function updateButtonState() {
                    let allValid = true;
                    inputs.forEach(input => {
                        if (input.type === 'select-one') {
                            if (!input.value.trim()) allValid = false;
                        } else {
                            if (!input.value.trim()) allValid = false;
                        }
                    });
                    submitButton.disabled = !allValid;
                    submitButton.style.backgroundColor = allValid ? '' : '#ccc';
                }
                form.addEventListener('input', updateButtonState);
                form.addEventListener('change', updateButtonState);
                updateButtonState();
            }
            validateForm('submitTicketForm', 'submitTicketButton');
        });
    </script>
    <jsp:include page="footer.jsp"/>
</body>
</html>
