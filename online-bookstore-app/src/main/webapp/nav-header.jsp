<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>


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
            <li><a href="order.jsp">Orders</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="shipment_table.jsp">Shipment (STAFF)</a></li>
        </ul>

        <div class="user-actions"> 
            <% 
                User user = (User) session.getAttribute("user"); 
                if (user == null) { 
            %>
            <a href="login.jsp">Login</a>
            <% } else { %>
            <a href="LogoutServlet">Logout</a>
            <a href="mydetails.jsp">My Details</a>
            <% } %>

            <a href="cart.jsp">Cart</a>

            <div class="notification">
                <img src="images/notification-bell.png" alt="Notifications" class="notification-bell">
                <div class="dropdown-menu animated">
                    <div class="dropdown-header">
                        <h4>Notifications</h4>
                        <button class="mark-all-read">Mark All as Read</button>
                    </div>
                    <ul>
                        <li><a href="#">Your order #12345 has been shipped.</a></li>
                        <li><a href="#">Your payment for order #67890 was successful.</a></li>
                    </ul>
                    <a href="notification_dashboard.jsp" class="view-all">View All Notifications</a>
                </div>
            </div>
        </div>
    </nav>
</header>
</html>
