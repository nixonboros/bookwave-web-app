<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Submitted</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Ticket Submitted Successfully</h1>
    <p>Your ticket ID is: <strong><%= request.getParameter("ticketId") %></strong></p>
    <p>Please use this ID to check the status of your ticket.</p>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
