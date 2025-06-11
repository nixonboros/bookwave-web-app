<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.Cart, com.g3app.model.CartItem" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
    <title>Shopping Cart</title>
    <script>
        function checkout() {
            // Redirect to the checkout page
            window.location.href = 'checkout.jsp';
        }
    </script>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <h1 class="formTitle">Shopping Cart</h1>

        <section class="cart-details animated">
            <form action="RemoveFromCartServlet" method="POST"> <!-- Main form for removing items -->
                <table>
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Retrieve the cart object from the session
                            Cart cart = (Cart) session.getAttribute("cart");

                            if (cart != null && !cart.getItems().isEmpty()) {
                                // Loop through the cart items and display them in the table
                                List<CartItem> items = cart.getItems();
                                for (CartItem item : items) {
                        %>
                        <tr>
                            <td><%= item.getBook().getId() %></td>
                            <td><%= item.getBook().getTitle() %></td>
                            <td><%= item.getQuantity() %></td> <!-- Displaying quantity -->
                            <td>$<%= String.format("%.2f", item.getBook().getPrice()) %></td> <!-- Formatted price -->
                            <td>$<%= String.format("%.2f", item.getTotalPrice()) %></td> <!-- Formatted total price -->
                            <td>
                                <!-- Form to remove a specific item from the cart -->
                                <form action="RemoveFromCartServlet" method="POST" style="display:inline;"> <!-- Inline to keep in the same row -->
                                    <input type="hidden" name="bookId" value="<%= item.getBook().getId() %>">
                                    <button type="submit" class="button">Remove</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" style="text-align: center;">Your cart is empty. Click <a href="product.jsp">here</a> to view our range.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <%
                    if (cart != null && !cart.getItems().isEmpty()) {
                        // Calculate total from cart
                        double totalAmount = cart.getTotal(); // Ensure this is calculating the correct total
                %>
                <h3>Total: $<%= String.format("%.2f", totalAmount) %></h3> <!-- Formatted total -->
                <%
                    }
                %>
            </form>
            
        </section>
                <%-- Separate Checkout Button Outside of the Form --%>
            <div class="ticket-actions animated">
                <button class="button" 
                        onclick="checkout()" 
                        <% if (cart == null || cart.getItems().isEmpty()) { %>disabled<% } %>
                >
                    Proceed to Checkout
                </button>
            </div>
    </main>

    <jsp:include page="footer.jsp"/>
</body>
</html>
