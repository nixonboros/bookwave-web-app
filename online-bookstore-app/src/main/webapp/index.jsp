<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="form-section animated">
            <%
                // Retrieve user from session
                User user = (User) request.getSession().getAttribute("user");
                if (user != null) {
                    String welcomeMessage = "Welcome, " + user.getFirstName() + "!";
                    out.println("<h1>" + welcomeMessage + "</h1>");
                }
            %>
            <p>Your one-stop shop for all your reading needs.</p>
        </section>
    </main>
</body>
</html>
