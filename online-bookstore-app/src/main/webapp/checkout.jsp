<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.Cart, com.g3app.model.CartItem, com.g3app.model.User" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
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
        <h1 class="formTitle">Checkout</h1>

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
            <form action="CheckoutServlet" method="POST" id="orderForm">
                <h2>Order Summary</h2>
                <table>
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

                <h3>Total Amount: $<%= String.format("%.2f", totalAmount) %></h3>
                <input type="hidden" name="totalAmount" value="<%= totalAmount %>"> <!-- Hidden total amount -->

                <h2>Shipping Information</h2>
                <div>
                    <label>
                        <input type="radio" name="addressOption" id="use-existing" value="existing" checked onclick="toggleAddressForm()"> Use Existing Address
                    </label>
                    <label>
                        <input type="radio" name="addressOption" id="use-new" value="new" onclick="toggleAddressForm()"> Ship to New Address
                    </label>
                </div>

                <div id="existing-address">
                    <label for="name">Full Customer Name:</label>
                    <input type="text" name="name" value="<%= user.getFirstName() + " " + user.getLastName() %>" readonly>

                    <label for="address">Address:</label>
                    <input type="text" name="address" value="<%= user.getAddress() %>" readonly>

                    <label for="city">City:</label>
                    <input type="text" name="city" value="<%= user.getCity() %>" readonly>

                    <label for="zip">Zip Code:</label>
                    <input type="text" name="zip" value="<%= user.getPostcode() %>" readonly>
                </div>

                <div id="new-address" style="display: none;">
                    <label for="newName">Name:</label>
                    <input type="text" name="newName" required>

                    <label for="newAddress">Address:</label>
                    <input type="text" name="newAddress" required>

                    <label for="newCity">City:</label>
                    <input type="text" name="newCity" required>

                    <label for="newZip">Zip Code:</label>
                    <input type="text" name="newZip" required>
                </div>

                <label for="paymentMethod">Payment Method:</label>
                <select name="paymentMethod" required>
                    <option value="creditCard">Credit Card</option>
                    <option value="paypal">PayPal</option>
                </select>
            </form>

            <button type="submit" class="button" onclick="document.getElementById('orderForm').submit();">Place Order</button>
            <%
                }
            %>
        </section>
    </main>
</body>
</html>
