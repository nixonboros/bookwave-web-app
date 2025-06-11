<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.g3app.dao.DBConnector" %>
<%@ page import="com.g3app.dao.DBManager" %>
<%@ page import="com.g3app.model.StaffUser" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Edit Staff User Details</title>
</head>

<%
    String email = request.getParameter("email");
    StaffUser staffUser = null;

    // Fetch user details based on email
    try {
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager dbManager = new DBManager(conn);

        staffUser = dbManager.getStaffUserByEmail(email); // Ensure this method exists in DBManager

        connector.closeConnection();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<body>
    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <h2>Edit Staff User Details</h2>
        <form action="StaffUserEditServlet" method="post">
            <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" value="<%= staffUser.getFirstName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" value="<%= staffUser.getLastName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= staffUser.getEmail() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" value="<%= staffUser.getDob() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone" value="<%= staffUser.getPhone() %>" required>
                        <small style="color: red;" id="phoneWarning" hidden>Phone number can only be numbers.</small>
                    </div>

                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="<%= staffUser.getAddress() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" value="<%= staffUser.getCity() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="postcode">Postcode:</label>
                        <input type="text" id="postcode" name="postcode" value="<%= staffUser.getPostcode() %>" pattern="\d*" title="Postcode must contain digits only" required>
                        <small style="color: red;" id="postcodeWarning" hidden>Postcode can only be numbers.</small>
                    </div>

                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" id="country" name="country" value="<%= staffUser.getCountry() %>" required>
                    </div>                   

                    <div class="form-group">
                        <label for="password">New Password:</label>
                        <input type="password" id="password" value="" name="password">
                    </div>

            <% String status = request.getParameter("status"); %>
            <% if ("error".equals(status)) { %>
                <p style="color: red;">An error occurred while processing your request. Please try again.</p>
            <% } %>

            <button type="submit">Update Staff</button>
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
