package com.g3app.controller;

import com.g3app.model.Notification;
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming user email is stored in the session after login
        String userEmail = (String) request.getSession().getAttribute("email");

        if (userEmail == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
            return;
        }

        try {
            // Establish database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            // Retrieve unread and read notifications for the user based on email
            List<Notification> unreadNotifications = dbManager.getUnreadNotificationsByEmail(userEmail);
            List<Notification> readNotifications = dbManager.getReadNotificationsByEmail(userEmail);

            // Set notifications as request attributes
            request.setAttribute("unreadNotifications", unreadNotifications);
            request.setAttribute("readNotifications", readNotifications);

            // Close connection
            connector.closeConnection();

            // Forward to the notification dashboard JSP
            request.getRequestDispatcher("notification_dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving notifications.");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver not found.");
        }
    }
}
