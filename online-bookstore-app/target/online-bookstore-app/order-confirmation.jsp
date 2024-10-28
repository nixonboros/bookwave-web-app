<%@ page import="com.g3app.model.Order" %>
<%@ page import="com.g3app.model.CartItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Order Confirmation - Bookstore</title>
</head>
<body>

    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="order-section animated">
            <h1 class="formTitle">Your Order Confirmation</h1>
            
            <p>Thank you for your purchase! Your order details are as follows:</p>

            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Books Ordered</th>
                        <th>Status</th>
                        <th>Shipping Details</th>
                        <th>Date Placed</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Order order = (Order) request.getAttribute("order"); // Retrieve the order object from the request
                        if (order != null) {
                            List<CartItem> items = order.getItems(); // Get the list of CartItems
                            StringBuilder booksOrdered = new StringBuilder();

                            if (items != null && !items.isEmpty()) {
                                for (CartItem item : items) {
                                    booksOrdered.append(item.getBook().toString()).append("<br/>"); // Use the toString method of Book
                                }
                            } else {
                                booksOrdered.append("No books ordered.");
                            }
                    %>
                        <tr>
                            <td><%= order.getId() %></td> 
                            <td><%= order.getFirstName() + " " + order.getLastName() %></td>
                            <td><%= booksOrdered.toString() %></td> 
                            <td>Confirmed</td> 
                            <td><%= order.getAddress() + ", " + order.getCity() + ", " + order.getZip() %></td>
                            <td><%= order.getOrderDate() %></td>
                        </tr>
                    <%
                        } else {
                    %>
                        <tr>
                            <td colspan="6">No order details available.</td>
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
