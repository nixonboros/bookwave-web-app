package com.g3app.controller;

import com.g3app.model.StaffUser;
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

@WebServlet("/UpdateStaffAccountServlet")
public class UpdateStaffAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    StaffUser staffUser = (StaffUser) session.getAttribute("staffUser");

    if (staffUser != null) {
        // Fetch updated user details from form submission
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Optional field
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

            // Only update password if it's not empty
            if (password != null && !password.trim().isEmpty()) {
                staffUser.setPassword(password); // Update the password in the user object
            }

            // Update the user details (send password only if it's updated)
            boolean success = dbManager.updateStaffUserDetails(
                staffUser.getEmail(), // Identify the user by email
                firstName, lastName, email, staffUser.getPassword(), dob, phone, address, city, postcode, country
            );

            // Close database connection
            connector.closeConnection();

            if (success) {
                // Update session with new user details
                staffUser.setFirstName(firstName);
                staffUser.setLastName(lastName);
                staffUser.setEmail(email);
                staffUser.setDob(dob);
                staffUser.setPhone(phone);
                staffUser.setAddress(address);
                staffUser.setCity(city);
                staffUser.setPostcode(postcode);
                staffUser.setCountry(country);
                session.setAttribute("staffUser", staffUser);

                // Redirect to success page
                response.sendRedirect("staffDetailUpdate_success.jsp");
            } else {
                // Redirect to account details page with error message
                response.sendRedirect("mystaffdetails.jsp?status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Update failed.");
        }
    } else {
        // Redirect to login if user is not found in session
        response.sendRedirect("login.jsp");
    }
    }
}
