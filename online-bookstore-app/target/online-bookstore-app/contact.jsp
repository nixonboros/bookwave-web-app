<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Contact Us - Bookstore Support</title>
</head>
<body>
    <header>
    <nav>
        <div class="logo">Bookstore</div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="product.jsp">Products</a></li>
            <li><a href="order.jsp">Orders</a></li>
            <li><a href="payment.jsp">Payments</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>

        <div class="user-actions">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>

    </nav>
    </header>

    <main>
        <section class="contact-section">
            <h1>Contact Us</h1>
            <p>If you are experiencing any issues or have any questions, please fill out the form below, and our support team will get back to you as soon as possible.</p>

            <form action="submitTicket" method="post">
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="issue">Issue Description:</label>
                    <textarea id="issue" name="issue" rows="5" required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit">Submit Ticket</button>
                </div>
            </form>
        </section>

        <section class="status-section">
            <h2>Check Ticket Status</h2>
            <form action="checkTicketStatus" method="post">
                <div class="form-group">
                    <label for="ticketID">Ticket ID:</label>
                    <input type="text" id="ticketID" name="ticketID" required>
                </div>

                <div class="form-group">
                    <button type="submit">Check Status</button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
