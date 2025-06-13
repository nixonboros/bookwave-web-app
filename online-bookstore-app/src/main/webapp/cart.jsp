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
            window.location.href = 'checkout.jsp';
        }
    </script>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <main>
        <div class="orders-boundary">
            <div class="orders-header-card">
                <h1 class="orders-title">Shopping Cart</h1>
                <p class="orders-desc">
                  Review the items in your cart before proceeding to checkout. You can remove items or adjust your selection as needed.
                </p>
            </div>
            <div class="orders-table-card">
                <table class="orders-table">
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
                            Cart cart = (Cart) session.getAttribute("cart");
                            if (cart != null && !cart.getItems().isEmpty()) {
                                List<CartItem> items = cart.getItems();
                                for (CartItem item : items) {
                        %>
                        <tr>
                            <td><%= item.getBook().getId() %></td>
                            <td><%= item.getBook().getTitle() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>$<%= String.format("%.2f", item.getBook().getPrice()) %></td>
                            <td>$<%= String.format("%.2f", item.getTotalPrice()) %></td>
                            <td>
                                <form action="RemoveFromCartServlet" method="POST" style="display:inline;">
                                    <input type="hidden" name="bookId" value="<%= item.getBook().getId() %>">
                                    <button type="submit" class="button button-primary" aria-label="Remove <%= item.getBook().getTitle() %> from cart">Remove</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 2.5rem 0;">
                                <div class="no-books">
                                    <svg width="48" height="48" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="24" cy="24" r="24" fill="#f3f6fa"/><path d="M16 32V18a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v14" stroke="#2563eb" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M16 32h16" stroke="#2563eb" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M20 22h8" stroke="#2563eb" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                                    <h2>Your cart is empty</h2>
                                    <p>Click <a href="product.jsp">here</a> to view our range.</p>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
                <%
                    if (cart != null && !cart.getItems().isEmpty()) {
                    double totalAmount = cart.getTotal();
            %>
            <div style="display: flex; justify-content: flex-end; align-items: center; margin-top: 2rem; gap: 2rem; flex-wrap: wrap;">
                <div style="background: #f8fafc; border-radius: 1rem; box-shadow: 0 2px 16px 0 rgba(60,72,88,0.10); padding: 1.5rem 2.5rem; min-width: 260px; display: flex; flex-direction: column; align-items: flex-end;">
                    <h3 style="margin-bottom: 1rem; color: var(--primary, #2563eb);">Total: $<%= String.format("%.2f", totalAmount) %></h3>
                    <button class="button button-primary" style="width: 100%; font-size: 1.15rem; border-radius: 0.75rem;" onclick="checkout()" <% if (cart == null || cart.getItems().isEmpty()) { %>disabled<% } %>>Proceed to Checkout</button>
                </div>
            </div>
                <%
                    }
                %>
            </div>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
</html>
