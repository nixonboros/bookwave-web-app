package com.g3app.controller;

import com.g3app.model.Notification;
import com.g3app.model.User; // Import User class
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

@WebServlet("/UpdateNotificationStatusServlet")
public class UpdateNotificationStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String notificationId = request.getParameter("notificationId");
        String ticketId = request.getParameter("ticketId");

        if (notificationId == null || ticketId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Notification ID and Ticket ID are required.");
            return;
        }

        try {
            // Establish database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            // Update the notification status to "Read"
            dbManager.updateNotificationStatus(Integer.parseInt(notificationId), "Read");

            // Retrieve user from the session to fetch notifications
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                // Fetch unread notifications again using the user's email
                List<Notification> unreadNotifications = dbManager.getUnreadNotificationsByEmail(user.getEmail());
                session.setAttribute("unreadNotifications", unreadNotifications);
            }

            // Close connection
            connector.closeConnection();

            // Redirect to the ViewTicketServlet with the ticket ID
            response.sendRedirect("ViewTicketServlet?ticketId=" + ticketId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating notification status.");
        }
    }
}
