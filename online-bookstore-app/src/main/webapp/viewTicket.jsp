<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.g3app.model.SupportTicket" %>
<%
    SupportTicket ticket = (SupportTicket) request.getAttribute("ticket");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>View Ticket - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="ticket-details animated">
            <a href="UserSupportDashboardServlet" class="back-arrow">
                <img src="images/back-arrow.png" alt="Back" />
            </a>
             <!-- Example information, TO BE REPLACED W DATABASE-->
            <h1>Support Ticket Details</h1>
            <div class="ticket-info">
                <div class="ticket-field">
                    <label for="ticketID">Ticket ID:</label>
                    <span id="ticketID"><%= ticket.getTicketId() %></span>
                </div>
                <div class="ticket-field">
                    <label for="subjectTitle">Subject Title:</label>
                    <span id="subjectTitle"><%= ticket.getSubjectTitle() %></span>
                </div>
                <div class="ticket-field">
                    <label for="type">Type:</label>
                    <span id="type"><%= ticket.getTypeOfEnquiry() %></span>
                </div>
                <div class="ticket-field">
                    <label for="status">Status:</label>
                    <span id="status"><%= ticket.getStatus() %></span>
                </div>
                <div class="ticket-field">
                    <label for="dateSubmitted">Date Submitted:</label>
                    <span id="dateSubmitted"><%= ticket.getDateSubmitted() %></span>
                </div>
                <div class="ticket-field">
                    <label for="description">Issue Description:</label>
                    <p id="description"><%= ticket.getIssueDescription() %></p>
                </div>
            </div>

            <div class="chat-section">
                <h2>Chat with Support</h2>
                <div class="chat-history" id="chatHistory">
                    <div class="chat-message otheruser">
                        <div class="message-user">Support:</div>
                        <div class="message-text">We have reviewed your billing issue and will provide an update shortly.</div>
                    </div>
                    <div class="chat-message you">
                        <div class="message-user">You:</div>
                        <div class="message-text">Thanks for the update. Could you provide an estimated time for when this will be resolved?</div>
                    </div>
                    <div class="chat-message otheruser">
                        <div class="message-user">Support:</div>
                        <div class="message-text">We expect to have this resolved within the next 48 hours. We will notify you once the correction has been made.</div>
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
                    messageElement.classList.add('chat-message', 'you');
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
