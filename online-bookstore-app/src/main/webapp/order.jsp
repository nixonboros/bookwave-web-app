<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.g3app.model.Order" %>
<%@ page import="com.g3app.model.CartItem" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Orders - Bookstore</title>
</head>
<body>

    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="order-section animated">
            <h1 class="formTitle">Your Orders</h1>
            <p>Welcome to your order dashboard. Here you can view the details of your past orders and track their status. 
                Use the options below to navigate through your orders and access more information about each transaction.</p>

            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Books Ordered</th>
                        <th>Status</th>
                        <th>Shipping Details</th>
                        <th>Date Placed</th>
                        <th>Total Amount</th> 
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Order> orders = (List<Order>) request.getAttribute("orders");
                        if (orders != null) {
                            for (Order order : orders) {
                    %>
                        <tr>
                            <td><%= order.getId() %></td>
                            <td>
                                <% 
                                    List<CartItem> items = order.getItems();
                                    if (items != null) {
                                        for (CartItem item : items) {
                                %>
                                            <%= item.getBook().getTitle() %> (Qty: <%= item.getQuantity() %>)<br>
                                <% 
                                        }
                                    }
                                %>
                            </td>
                            <td>Processing</td>
                            <td><%= order.getAddress() %>, <%= order.getCity() %>, <%= order.getZip() %></td>
                            <td><%= order.getOrderDate() %></td>
                            <td>$<%= order.getTotalAmount() %></td>
                            <td><a href="shipment_tracking.jsp?id=<%= order.getId() %>" class="button">Track</a></td>
                        </tr>
                    <% 
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7">No orders found.</td> <!-- Adjusted colspan to 7 -->
                        </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
</html>
