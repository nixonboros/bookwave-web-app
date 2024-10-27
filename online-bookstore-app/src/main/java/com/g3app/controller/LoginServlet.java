package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.model.Cart; // Import Cart class
import com.g3app.model.Notification;
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Import HttpSession
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            User user = dbManager.findUser(email, password);

            if (user != null) {
                // Successful login
                HttpSession session = request.getSession();

                // Clear guest cart
                Cart guestCart = (Cart) session.getAttribute("cart");
                if (guestCart != null) {
                    session.removeAttribute("cart"); // Clear the guest cart
                }

                // Set user information in the session
                session.setAttribute("user", user);
                session.setAttribute("email", user.getEmail());
                
                // Fetch unread notifications
                List<Notification> unreadNotifications = dbManager.getUnreadNotificationsByEmail(user.getEmail());
                session.setAttribute("unreadNotifications", unreadNotifications);

                response.sendRedirect("index.jsp"); // Redirect to welcome page or dashboard
            } else {
                // Failed login
                response.sendRedirect("login.jsp?error=invalid_credentials");
            }

            // Close the connection after processing
            connector.closeConnection();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login failed.");
        }
    }
}
