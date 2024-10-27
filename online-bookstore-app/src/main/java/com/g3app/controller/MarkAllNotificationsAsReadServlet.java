package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.model.Notification;
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/MarkAllNotificationsAsReadServlet")
public class MarkAllNotificationsAsReadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Establish database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            // Retrieve user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                // Mark all unread notifications as read for the user
                dbManager.markAllNotificationsAsRead(user.getEmail());

                // Fetch unread notifications again to refresh the session
                List<Notification> unreadNotifications = dbManager.getUnreadNotificationsByEmail(user.getEmail());
                session.setAttribute("unreadNotifications", unreadNotifications);
            }

            // Close connection
            connector.closeConnection();

            // Redirect back to the page where the user was
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error marking notifications as read.");
        }
    }
}
