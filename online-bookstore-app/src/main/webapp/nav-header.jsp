<%@ page import="com.g3app.model.User" %>
<%@ page import="com.g3app.model.Book" %>
<%@ page import="com.g3app.model.Notification" %>
<%@ page import="java.util.List" %>

<html>
<header>
    <nav>
        <div class="logo">
            <img src="images/book-logo.png" alt="Bookstore Logo" class="logo-img">
            Bookstore
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="product.jsp">Products</a></li>
            
            <%
                User user = (User) request.getSession().getAttribute("user");
                if (user != null) {
                    // If the user is logged in, display these links
            %>
            <li><a href="order.jsp">Orders</a></li>
            <li><a href="UserSupportDashboardServlet">Contact</a></li>
            <%
                }
            %>
        </ul>

        <div class="user-actions"> 
            <%
                if (user != null) {
                    // Display tabs if logged in
                    String email = user.getEmail();
                    // Retrieve unread notifications from session
                    List<Notification> unreadNotifications = (List<Notification>) request.getSession().getAttribute("unreadNotifications");
            %>
                <a href="mydetails.jsp">My Account (<%= email %>)</a>
                <a href="LogoutServlet">Log Out</a>
                <a href="cart.jsp">
                    <img src="images/shopping-cart.png" alt="Cart" class="cart-icon">
                </a>
                <div class="notification">
                    <img src="images/notification-bell.png" alt="Notifications" class="notification-bell">
                    <div class="dropdown-menu animated">
                        <div class="dropdown-header">
                            <h4>Notifications</h4>
                            <a class="mark-all-read" href="MarkAllNotificationsAsReadServlet">Mark All as Read</a>
                        </div>
                        <ul>
                            <%
                                // Check if there are unread notifications
                                if (unreadNotifications != null && !unreadNotifications.isEmpty()) {
                                    for (Notification notification : unreadNotifications) {
                            %>
                            <li>
                                <a href="UpdateNotificationStatusServlet?notificationId=<%= notification.getNotificationId() %>&ticketId=<%= notification.getTicketId() %>">
                                    <%= notification.getMessage() %>
                                </a>
                            </li>
                            <%
                                    }
                                } else {
                            %>
                            <li>No new notifications</li>
                            <%
                                }
                            %>
                        </ul>
                        <a href="NotificationServlet" class="view-all">View All Notifications</a>
                    </div>
                </div>

            <%
                } else {
                    // Show login link if not logged in
            %>
                <a href="login.jsp">Login</a>
            <%
                }
            %>
        </div>
    </nav>
</header>
</html>
