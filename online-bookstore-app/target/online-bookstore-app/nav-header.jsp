<%@ page import="com.g3app.model.User" %>
<%@ page import="com.g3app.model.Book" %>
<%@ page import="com.g3app.model.Notification" %>
<%@ page import="java.util.List" %>

<html>
<header>
    <nav class="navbar">
        <div class="navbar__left">
            <a href="index.jsp" class="navbar__logo" aria-label="BookWave Home">
                <img src="images/book-logo.png" alt="BookWave Logo" class="navbar__logo-img">
                <span>BookWave</span>
            </a>
        </div>
        <button class="navbar__toggle" aria-label="Open menu" aria-expanded="false">
            <span></span><span></span><span></span>
        </button>
        <div class="navbar__center" id="navbarNav">
            <ul class="navbar__links">
                <li><a href="index.jsp" class="<%= request.getRequestURI().endsWith("index.jsp") ? "active" : "" %>">Home</a></li>
                <li><a href="product.jsp" class="<%= (request.getRequestURI().toLowerCase().contains("product") || request.getRequestURI().toLowerCase().contains("book-details")) ? "active" : "" %>">Products</a></li>
                <% User user = (User) request.getSession().getAttribute("user");
                   if (user != null) { %>
                <li><a href="UserOrderDashboardServlet" class="<%= (request.getRequestURI().toLowerCase().contains("order") || request.getRequestURI().toLowerCase().contains("shipment")) ? "active" : "" %>">Orders</a></li>
                <li><a href="UserSupportDashboardServlet" class="<%= (request.getRequestURI().toLowerCase().contains("support") || request.getRequestURI().toLowerCase().contains("contact") || request.getRequestURI().toLowerCase().contains("ticket")) ? "active" : "" %>">Contact</a></li>
                <% } %>
            </ul>
        </div>
        <div class="navbar__right">
            <% if (user != null) { %>
                <a href="cart.jsp" class="navbar__icon" aria-label="Cart" title="Cart">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                </a>
                <div class="navbar__icon notification notification-bell-container">
                    <button class="notification-button" id="notificationBellBtn" aria-label="Notifications" title="Notifications">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                        <% List<Notification> unreadNotifications = (List<Notification>) request.getSession().getAttribute("unreadNotifications");
                           if (unreadNotifications != null && !unreadNotifications.isEmpty()) { %>
                            <span class="notification-badge"><%= unreadNotifications.size() %></span>
                        <% } %>
                    </button>
                    <div class="notification-dropdown" id="notificationDropdown">
                        <div class="dropdown-header">Notifications</div>
                        <ul class="notification-list">
                            <% if (unreadNotifications != null && !unreadNotifications.isEmpty()) {
                                for (Notification notification : unreadNotifications) { %>
                                <li class="notification-item unread">
                                    <a href="UpdateNotificationStatusServlet?notificationId=<%= notification.getNotificationId() %>&ticketId=<%= notification.getTicketId() %>">
                                        <span class="notification-title"><%= notification.getMessage() %></span>
                                    </a>
                                </li>
                            <% } } else { %>
                                <li class="notification-item no-notifications">No new notifications</li>
                            <% } %>
                        </ul>
                        <div class="dropdown-footer">
                            <a href="NotificationServlet">View All</a>
                        </div>
                    </div>
                </div>
                <a href="mydetails.jsp" class="navbar__icon" aria-label="My Account" title="My Account">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                </a>
                <a href="LogoutServlet" class="navbar__icon logout-button" aria-label="Log Out" title="Log Out">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                </a>
            <% } else { %>
                <a href="login.jsp" class="button button-primary navbar__login" aria-label="Login" title="Login">
                    <svg class="login-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path><polyline points="10 17 15 12 10 7"></polyline><line x1="15" y1="12" x2="3" y2="12"></line></svg>
                    Login
                </a>
            <% } %>
        </div>
    </nav>
</header>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const toggle = document.querySelector('.navbar__toggle');
    const nav = document.getElementById('navbarNav');
    toggle.addEventListener('click', function() {
        nav.classList.toggle('active');
        toggle.setAttribute('aria-expanded', nav.classList.contains('active'));
    });
});
</script>
<script src="js/notification-dropdown.js"></script>
</html>
