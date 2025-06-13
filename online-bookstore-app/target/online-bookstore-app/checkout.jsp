<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.Cart, com.g3app.model.CartItem, com.g3app.model.User" %>
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
    <title>Checkout</title>
    <script>
        function toggleAddressForm() {
            const existingAddress = document.getElementById("existing-address");
            const newAddress = document.getElementById("new-address");
            if (document.getElementById("use-existing").checked) {
                existingAddress.style.display = "block";
                newAddress.style.display = "none";
            } else {
                existingAddress.style.display = "none";
                newAddress.style.display = "block";
            }
        }
    </script>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <main>
        <div class="orders-boundary">
            <div class="orders-header-card">
                <h1 class="orders-title">Checkout</h1>
                <p class="orders-desc">Review your order and provide shipping information to complete your purchase.</p>
            </div>
            <div class="orders-table-card">
                <section class="checkout-details animated">
                    <%
                        Cart cart = (Cart) session.getAttribute("cart");
                        User user = (User) session.getAttribute("user");

                        if (cart == null || cart.getItems().isEmpty()) {
                    %>
                    <p>Your cart is empty. Please <a href="product.jsp">add items</a> before proceeding to checkout.</p>
                    <%
                        } else {
                            List<CartItem> items = cart.getItems();
                            double totalAmount = cart.getTotal();
                    %>
                    <form action="CheckoutServlet" method="POST" id="orderForm" style="margin-bottom: 0;">
                        <h2 class="section-title">Order Summary</h2>
                        <table class="orders-table">
                            <thead>
                                <tr>
                                    <th>Item ID</th>
                                    <th>Item Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (CartItem item : items) {
                                %>
                                <tr>
                                    <td><%= item.getBook().getId() %></td>
                                    <td><%= item.getBook().getTitle() %></td>
                                    <td><%= item.getQuantity() %></td>
                                    <td>$<%= String.format("%.2f", item.getBook().getPrice()) %></td>
                                    <td>$<%= String.format("%.2f", item.getTotalPrice()) %></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <h3 style="margin-top: 1.5rem; color: var(--primary, #2563eb);">Total Amount: $<%= String.format("%.2f", totalAmount) %></h3>
                        <input type="hidden" name="totalAmount" value="<%= totalAmount %>">

                        <h2 class="section-title" style="margin-top: 2.5rem;">Shipping Information</h2>
                        <div style="margin-bottom: 1.5rem;">
                            <label style="margin-right: 1.5rem;">
                                <input type="radio" name="addressOption" id="use-existing" value="existing" checked onclick="toggleAddressForm()"> Use Existing Address
                            </label>
                            <label>
                                <input type="radio" name="addressOption" id="use-new" value="new" onclick="toggleAddressForm()"> Ship to New Address
                            </label>
                        </div>
                        <div id="existing-address" class="support-form" style="margin-bottom: 1.5rem;">
                            <div class="form-group">
                                <label for="name">Full Customer Name:</label>
                                <input type="text" id="name" name="name" value="<%= user.getFirstName() + " " + user.getLastName() %>" readonly class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" id="email" name="email" value="<%= user.getEmail() %>" readonly class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" id="address" name="address" value="<%= user.getAddress() %>" readonly class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="city">City:</label>
                                <input type="text" id="city" name="city" value="<%= user.getCity() %>" readonly class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="zip">Zip Code:</label>
                                <input type="text" id="zip" name="zip" value="<%= user.getPostcode() %>" readonly class="styled-input">
                            </div>
                        </div>
                        <div id="new-address" class="support-form" style="display: none; margin-bottom: 1.5rem;">
                            <div class="form-group">
                                <label for="newName">Full Customer Name:</label>
                                <input type="text" id="newName" name="newName" required class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="newEmail">Email:</label>
                                <input type="text" id="newEmail" name="newEmail" required class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="newAddress">Address:</label>
                                <input type="text" id="newAddress" name="newAddress" required class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="newCity">City:</label>
                                <input type="text" id="newCity" name="newCity" required class="styled-input">
                            </div>
                            <div class="form-group">
                                <label for="newZip">Zip Code:</label>
                                <input type="text" id="newZip" name="newZip" required class="styled-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="paymentMethod">Payment Method:</label>
                            <select id="paymentMethod" name="paymentMethod" required class="styled-input">
                                <option value="Credit Card">Credit Card</option>
                                <option value="Paypal">PayPal</option>
                            </select>
                        </div>
                    </form>
                    <div style="display: flex; justify-content: flex-end; margin-top: 2rem;">
                        <button type="button" class="button button-primary" style="min-width: 180px; font-size: 1.1rem;" onclick="document.getElementById('orderForm').submit();">Place Order</button>
                    </div>
                    <%
                        }
                    %>
                </section>
            </div>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
</html>
