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

@WebServlet("/BatchDeleteStaffServlet")
public class BatchDeleteStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedStaff = request.getParameterValues("selectedStaff");

        if (selectedStaff == null || selectedStaff.length == 0) {
            request.setAttribute("deleteStatus", "error");
            request.setAttribute("errorMessage", "No staff selected for deletion.");
            response.sendRedirect("manageStaff.jsp?activeTab=allStaff");
            return;
        }

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);

            boolean allDeleted = true;
            for (String email : selectedStaff) {
                boolean deleted = dbManager.deleteStaffUserByEmail(email); // Assume this method exists in DBManager
                if (!deleted) {
                    allDeleted = false;
                }
            }
            connector.closeConnection();

            if (allDeleted) {
                request.getSession().setAttribute("deleteStatus", "success");
                request.getSession().setAttribute("successMessage", "Selected staff were deleted successfully.");
            } else {
                request.getSession().setAttribute("deleteStatus", "partialSuccess");
                request.getSession().setAttribute("successMessage", "Some staff could not be deleted.");
            }
            response.sendRedirect("manageStaff.jsp?activeTab=allStaff");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("deleteStatus", "error");
            request.getSession().setAttribute("errorMessage", "An error occurred while deleting staff.");
            response.sendRedirect("manageStaff.jsp?activeTab=allStaff");
        }
    }
}
