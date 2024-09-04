<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Status</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Ticket Status</h1>
    <p><strong>Ticket ID:</strong> <%= ((SupportTicket) request.getAttribute("ticket")).getTicketId() %></p>
    <p><strong>Status:</strong> <%= ((SupportTicket) request.getAttribute("ticket")).getStatus() %></p>
    <p><strong>Issue:</strong> <%= ((SupportTicket) request.getAttribute("ticket")).getIssueDescription() %></p>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
