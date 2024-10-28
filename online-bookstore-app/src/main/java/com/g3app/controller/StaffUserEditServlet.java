package com.g3app.controller;

import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;
import com.g3app.model.StaffUser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/StaffUserEditServlet")
public class StaffUserEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String country = request.getParameter("country");

        try {
            // Open database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            if (password == null || password.isEmpty()) {
                StaffUser existingStaffUser = dbManager.getStaffUserByEmail(email); // Fetch existing user details
                password = existingStaffUser.getPassword(); // Retain the current password if input is empty
            }

            // Update the user details
            StaffUser staffUser = new StaffUser(firstName, lastName, email, password, dob, phone, address, city, postcode, country);
            dbManager.updateStaff(staffUser);

            // Close the database connection
            connector.closeConnection();

            // Set success message and redirect
            request.setAttribute("status", "success");
            request.setAttribute("successMessage", "User details updated successfully.");
            request.getRequestDispatcher("manageStaff.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            request.setAttribute("errorMessage", "Failed to update user details.");
            request.getRequestDispatcher("manageStaff.jsp").forward(request, response);
        }
    }
}
