package com.g3app.controller;

import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;
import com.g3app.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String userId = request.getParameter("userId");
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

            // Update the user details
            User user = new User(firstName, lastName, email, password, dob, phone, address, city, postcode, country);
            dbManager.updateUser(user);

            // Close the database connection
            connector.closeConnection();

            // Set success message and redirect
            request.setAttribute("status", "success");
            request.setAttribute("successMessage", "User details updated successfully.");
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            request.setAttribute("errorMessage", "Failed to update user details.");
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
        }
    }
}
