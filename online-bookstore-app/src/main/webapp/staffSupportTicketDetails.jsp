<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Staff Ticket Details - Bookstore</title>
</head>
<body>
    <jsp:include page="staff-nav-header.jsp"/>

    <main>
        <section class="ticket-details animated">
            <a href="StaffSupportDashboardServlet" class="back-arrow">
                <img src="images/back-arrow.png" alt="Back" />
            </a>
            <h1>Support Ticket Details</h1>
            <div class="ticket-info">
                <!-- Ticket Details Section -->
                <div class="ticket-field">
                    <label for="ticketID">Ticket ID:</label>
                    <span id="ticketID">12345</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="customerName">Customer Name:</label>
                    <span id="customerName">Jane Doe</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="subjectTitle">Subject Title:</label>
                    <span id="subjectTitle">Incorrect Billing Amount Charged</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="type">Type:</label>
                    <span id="type">Billing Issues</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="status">Status:</label>
                    <span id="status">Open</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="dateSubmitted">Date Submitted:</label>
                    <span id="dateSubmitted">2024-09-01</span> <!-- Replace with dynamic data -->
                </div>
                <div class="ticket-field">
                    <label for="description">Issue Description:</label>
                    <p id="description">There seems to be an error with the billing amount charged to my account. Please review and correct the amount.</p> <!-- Replace with dynamic data -->
                </div>
            </div>

            <div class="chat-section">
                <h2>Chat with Customer</h2>
                <div class="chat-history" id="chatHistory">
                    <!-- Chat history placeholder -->
                    <div class="chat-message otheruser">
                        <div class="message-user">Jane Doe:</div>
                        <div class="message-text">I'm having issues with my billing amount. Any assistance would be appreciated!</div>
                    </div>
                    <div class="chat-message you">
                        <div class="message-user">You:</div>
                        <div class="message-text">Can you please provide more details?</div>
                    </div>
                </div>
            
                <form id="chatForm">
                    <div class="form-group">
                        <textarea id="messageInput" name="message" rows="3" placeholder="Type your message..." required></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="sendMessageButton" class="button">Send</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // JavaScript for handling chat form submission
            const chatForm = document.getElementById('chatForm');
            const chatHistory = document.getElementById('chatHistory');
            const messageInput = document.getElementById('messageInput');

            chatForm.addEventListener('submit', (event) => {
                event.preventDefault(); // Prevent form from submitting the traditional way

                const newMessage = messageInput.value.trim();
                if (newMessage) {
                    // Add the new message to the chat history
                    const messageElement = document.createElement('div');
                    messageElement.classList.add('chat-message', 'you'); // Use 'you' class for right alignment
                    messageElement.innerHTML = `
                        <div class="message-user">You:</div>
                        <div class="message-text">${newMessage}</div>
                    `;
                    chatHistory.appendChild(messageElement);

                    // Scroll to the bottom of the chat history
                    chatHistory.scrollTop = chatHistory.scrollHeight;

                    // Clear the input field
                    messageInput.value = '';
                }
            });
        });
    </script>
</body>
</html>
