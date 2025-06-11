<%-- 
    Document   : footer
    Created on : 25 Sept 2024, 10:08:52 pm
    Author     : jerry
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <footer class="footer">
            <div class="footer-main">
                <div class="footer-col brand-col">
                <div class="footer-logo">
                        <img src="images/book-logo.png" alt="BookWave Logo" class="footer-logo-img">
                        <span>BookWave</span>
                </div>
                    <p class="footer-description">
                        Your one-stop destination for discovering and purchasing your next favorite book.
                    </p>
                </div>
                <div class="footer-col links-col">
                    <h3>Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="product.jsp">Products</a></li>
                        <li><a href="contact.jsp">Contact Us</a></li>
                        <li><a href="UserSupportDashboardServlet">Support</a></li>
                    </ul>
                </div>
                <div class="footer-col service-col">
                    <h3>Customer Service</h3>
                    <ul class="footer-links">
                        <li><a href="UserOrderDashboardServlet">Track Order</a></li>
                        <li><a href="shipment_tracking.jsp">Shipping Info</a></li>
                        <li><a href="contact.jsp">Help Center</a></li>
                        <li><a href="UserSupportDashboardServlet">FAQs</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-social-newsletter">
                <div class="footer-social">
                    <a href="#" class="footer-social-link" aria-label="Facebook"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg></a>
                    <a href="#" class="footer-social-link" aria-label="Twitter"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg></a>
                    <a href="#" class="footer-social-link" aria-label="Instagram"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg></a>
                </div>
                <form action="NewsletterServlet" method="post" class="footer-newsletter">
                    <label for="newsletter-email">Subscribe to our newsletter</label>
                    <div class="newsletter-row">
                        <input type="email" id="newsletter-email" name="email" placeholder="Enter your email" required>
                        <button type="submit" class="button button-primary">Subscribe</button>
                    </div>
                </form>
            </div>
            <div class="footer-bottom">
                <div class="footer-bottom-container">
                    <span>&copy; <%= java.time.Year.now().getValue() %> BookWave. All rights reserved.</span>
                    <ul class="footer-bottom-links">
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Cookie Policy</a></li>
                    </ul>
                </div>
                </div>
        </footer>

    </body>
</html>
