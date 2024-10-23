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

@WebServlet("/StaffUserDeleteServlet")
public class StaffUserDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the staff email from the request
        String staffEmail = request.getParameter("email"); // Change to match JSP input name

        // Validate the staff email
        if (staffEmail == null || staffEmail.trim().isEmpty()){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid email format.");
            return;
        }

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            boolean success = dbManager.deleteStaffUserByEmail(staffEmail);
            
            connector.closeConnection();
            
            if (success) {
                request.setAttribute("deleteStatus", "deleted");
                request.setAttribute("successMessage", "Staff user deleted successfully!");
            } else {
                request.setAttribute("deleteStatus", "notFound");
                request.setAttribute("errorMessage", "Staff user not found or could not be deleted.");
            }

            request.setAttribute("activeTab", "searchStaff");            
            request.getRequestDispatcher("manageStaff.jsp").forward(request, response);
            response.sendRedirect("manageStaff.jsp?activeTab=searchStaff&searchStatus=found");


        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete the staff user.");
        }
        request.setAttribute("activeTab", "searchStaff");            
            request.getRequestDispatcher("manageStaff.jsp").forward(request, response);
            response.sendRedirect("manageStaff.jsp?activeTab=searchStaff&searchStatus=found");
    }
}
