<%@ page import="com.g3app.model.StaffUser" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
</head>
<header>
    <nav>
        <div class="logo">
            <img src="images/book-logo.png" alt="Bookstore Logo" class="logo-img">
            Bookstore
        </div>
        <ul class="nav-links">
            <li><a href="manageStaff.jsp">Manage Staff</a></li>
            <li><a href="manageUsers.jsp">Manage User</a></li>
            <li><a href="staffCatalogue.jsp">Manage Catalogue</a></li>
            <li><a href="manageOrders.jsp">Manage Orders</a></li>
            <li><a href="managePayments.jsp">Manage Payments</a></li>
            <li><a href="shipment_table.jsp">Manage Shipping</a></li>
            <li><a href="StaffSupportDashboardServlet">Support Tickets</a></li>
        </ul>

        <div class="user-actions">
            <%
                StaffUser staffUser = (StaffUser) request.getSession().getAttribute("staffUser");
                if (staffUser != null) {
                    // If the user is logged in, display My Account and Log Out
                    String email = staffUser.getEmail();
            %>
                <a href="mystaffdetails.jsp">My Account (<%= email %>)</a>
                <a href="LogoutServlet">Log Out</a>
            <%
                } else {
                    // Optionally, you can include a login link here if needed
                    // <a href="login.jsp">Login</a>
                }
            %>
        </div>
    </nav>
</header>
</html>