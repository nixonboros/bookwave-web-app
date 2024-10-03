package com.g3app.controller;

import com.g3app.model.SupportTicket;
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ViewTicketServlet")
public class ViewTicketServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the ticket ID from the request
        String ticketIdStr = request.getParameter("ticketId");
        
        // Check if the ticketId parameter is provided
        if (ticketIdStr == null || ticketIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ticket ID is required.");
            return;
        }

        int ticketId;
        try {
            // Convert ticketId to an integer
            ticketId = Integer.parseInt(ticketIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Ticket ID format.");
            return;
        }

        SupportTicket ticket = null;

        try {
            // Establish database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            // Retrieve the support ticket details by ticket ID
            ticket = dbManager.getSupportTicketById(ticketId);

            // Close connection
            connector.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching ticket details.");
            return;
        }

        // Check if the ticket exists
        if (ticket != null) {
            // Set the ticket object in the request scope
            request.setAttribute("ticket", ticket);

            // Forward to viewTicket.jsp
            request.getRequestDispatcher("viewTicket.jsp").forward(request, response);
        } else {
            // Redirect if no ticket found
            response.sendRedirect("contact.jsp?error=no_ticket_found");
        }
    }
}
