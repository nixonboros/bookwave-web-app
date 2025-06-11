<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.g3app.model.SupportTicket" %>
<%@ page import="com.g3app.model.Message" %>
<%@ page import="java.util.List" %>

<%
    SupportTicket ticket = (SupportTicket) request.getAttribute("ticket");
    List<Message> messages = (List<Message>) request.getAttribute("messages"); // Retrieve messages from request
%>

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
    <title>View Ticket - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="orders-table-card contact-table-card ticket-details animated">
            <a href="UserSupportDashboardServlet" class="back-arrow">
                <img src="images/back-arrow.png" alt="Back" />
            </a>
            <div style="height: 2.5rem;"></div>
            <h1 class="orders-title">Support Ticket Details</h1>
            <div class="ticket-info">
                <div class="ticket-field"><label>Ticket ID:</label><span><%= ticket.getTicketId() %></span></div>
                <div class="ticket-field"><label>Subject Title:</label><span><%= ticket.getSubjectTitle() %></span></div>
                <div class="ticket-field"><label>Type:</label><span><%= ticket.getTypeOfEnquiry() %></span></div>
                <div class="ticket-field"><label>Status:</label><span><%= ticket.getStatus() %></span></div>
                <div class="ticket-field"><label>Date Submitted:</label><span><%= ticket.getDateSubmitted() %></span></div>
                <div class="ticket-field"><label>Issue Description:</label><p><%= ticket.getIssueDescription() %></p></div>
            </div>
            <div class="chat-section">
                <h2 class="section-title">Chat with Support</h2>
                <div class="chat-history" id="chatHistory">
                    <% if (messages != null) { for (Message msg : messages) { String userType = msg.getSender(); String messageText = msg.getMessage(); String messageClass = userType.equals("Support") ? "otheruser" : "you"; %>
                    <div class="chat-message <%= messageClass %>">
                        <div class="message-user"><%= userType %>:</div>
                        <div class="message-text"><%= messageText %></div>
                    </div>
                    <% } } %>
                </div>
                <form id="chatForm" action="MessageServlet" method="POST" class="support-form" style="margin-top:2rem;">
                    <input type="hidden" name="ticketId" value="<%= ticket.getTicketId() %>">
                    <div class="form-group">
                        <textarea id="message" name="message" rows="3" placeholder="Type your message..." required></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="sendMessageButton" class="button button-primary">Send</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
</body>
</html>
