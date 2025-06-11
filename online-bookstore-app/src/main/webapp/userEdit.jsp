<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.g3app.dao.DBConnector" %>
<%@ page import="com.g3app.dao.DBManager" %>
<%@ page import="com.g3app.model.User" %>
<%@ page import="java.sql.*" %>

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
    <title>Edit User Details</title>
</head>

<%
    String email = request.getParameter("email");
    User user = null;

    // Fetch user details based on email
    try {
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager dbManager = new DBManager(conn);

        user = dbManager.getUserByEmail(email); // Ensure this method exists in DBManager

        connector.closeConnection();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<body>
    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <h2>Edit User Details</h2>
        <form action="UserEditServlet" method="post">
            <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" value="<%= user.getDob() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" required>
                        <small style="color: red;" id="phoneWarning" hidden>Phone number can only be numbers.</small>
                    </div>

                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="<%= user.getAddress() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" value="<%= user.getCity() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="postcode">Postcode:</label>
                        <input type="text" id="postcode" name="postcode" value="<%= user.getPostcode() %>" pattern="\d*" title="Postcode must contain digits only" required>
                        <small style="color: red;" id="postcodeWarning" hidden>Postcode can only be numbers.</small>
                    </div>

                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" id="country" name="country" value="<%= user.getCountry() %>" required>
                    </div>                   

                    <div class="form-group">
                        <label for="password">New Password:</label>
                        <input type="password" id="password" value="" name="password">
                    </div>

            <% String status = request.getParameter("status"); %>
            <% if ("error".equals(status)) { %>
                <p style="color: red;">An error occurred while processing your request. Please try again.</p>
            <% } %>

            <button type="submit">Update User</button>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>

    <script>
        // Postcode validation warning display
        document.getElementById('postcode').addEventListener('input', function() {
            const postcodeWarning = document.getElementById('postcodeWarning');
            postcodeWarning.hidden = /^\d*$/.test(this.value);
        });
    </script>
</body>
</html>
