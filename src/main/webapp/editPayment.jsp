<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Payment Methods - Bookstore</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="nav-header.jsp" />

<main>
    <section class="form-section animated">
        <h1 class="formTitle">Edit Payment Methods</h1>
        <form action="PaymentServlet" method="post">
            <% 
                String action = request.getParameter("action");
                if ("edit".equals(action)) {
                    String cardNumber = request.getParameter("cardNumber"); 
            %>
                <!-- Edit Payment Method Form -->
                <input type="hidden" name="action" value="edit">
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" value="<%= cardNumber %>" required>
                </div>
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div class="form-group">
                    <label for="cardHolderName">Cardholder Name</label>
                    <input type="text" id="cardHolderName" name="cardHolderName" required>
                </div>
                <button type="submit" class="button">Save Changes</button>
                <button type="submit" name="action" value="delete" class="delete-button">Delete Payment Method</button>
            <% } else { %>
                <!-- Add New Payment Method Form -->
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" required>
                </div>
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                </div>
                <div class="form-group">
                    <label for="cardHolderName">Cardholder Name</label>
                    <input type="text" id="cardHolderName" name="cardHolderName" required>
                </div>
                <button type="submit" class="button">Add Payment Method</button>
            <% } %>
        </form>
    </section>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
