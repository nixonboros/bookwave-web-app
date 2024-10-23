package com.g3app.controller;

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

@WebServlet("/UpdateNotificationStatusServlet")
public class UpdateNotificationStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String notificationId = request.getParameter("notificationId");

        if (notificationId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Notification ID is required.");
            return;
        }

        try {
            // Establish database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            // Update the notification status to "Read"
            dbManager.updateNotificationStatus(Integer.parseInt(notificationId), "Read");

            // Close connection
            connector.closeConnection();

            // Redirect to the ViewTicketServlet with the ticket ID
            String ticketId = request.getParameter("ticketId");
            response.sendRedirect("ViewTicketServlet?ticketId=" + ticketId);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating notification status.");
        }
    }
}
