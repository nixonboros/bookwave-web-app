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

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the email from the request
        String userEmail = request.getParameter("email"); // Change to match JSP input name

        // Validate the email
        if (userEmail == null || userEmail.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid email format.");
            return;
        }

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            boolean success = dbManager.deleteUserByEmail(userEmail);
            
            connector.closeConnection();

            // Set deletion status and message
            if (success) {
                request.setAttribute("deleteStatus", "success");
                request.setAttribute("successMessage", "User deleted successfully.");
            } else {
                request.setAttribute("deleteStatus", "error");
                request.setAttribute("errorMessage", "User not found or could not be deleted.");
            }

            // Set the active tab for the JSP
            request.setAttribute("activeTab", "searchUser");            
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete the user.");
        }           
    }
}
