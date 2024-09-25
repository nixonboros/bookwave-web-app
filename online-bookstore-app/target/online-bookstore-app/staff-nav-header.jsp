<%@ page import="com.g3app.model.User" %>
<html>
<header>
    <nav>
        <div class="logo">
            <img src="images/book-logo.png" alt="Bookstore Logo" class="logo-img">
            Bookstore
        </div>
        <ul class="nav-links">
            <li><a href="manageUsers.jsp">Manage Users</a></li>
            <li><a href="manageOrders.jsp">Manage Orders</a></li>
            <li><a href="managePayments.jsp">Manage Payments</a></li>
            <li><a href="shipment_table.jsp">Manage Shipping</a></li>
            <li><a href="manageSupportTickets.jsp">Support Tickets</a></li>
        </ul>

        <div class="user-actions">
            <%
                User user = (User) request.getSession().getAttribute("user");
                if (user != null) {
                    // If the user is logged in, display My Account and Log Out
                    String email = user.getEmail();
            %>
                <a href="mydetails.jsp">My Account (<%= email %>)</a>
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
