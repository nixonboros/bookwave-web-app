package com.g3app.controller;

import com.g3app.dao.DBManager;
import com.g3app.model.StaffUser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StaffUserServlet")
public class StaffUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        // Initialize DBManager if it's not already in the session
        if (manager == null) {
            // Handle connection initialization logic if necessary
            throw new ServletException("DBManager not initialized");
        }

        String action = request.getParameter("action");

        if ("search".equals(action)) {
            String name = request.getParameter("search");
            try {
                List<StaffUser> staffUsers = manager.searchStaffUsers(name);
                session.setAttribute("staffUsers", staffUsers);
                request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException("Cannot search staff users", e);
            }
        } else {
            try {
                List<StaffUser> staffUsers = manager.getAllStaffUsers();
                session.setAttribute("staffUsers", staffUsers);
                request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
            } catch (SQLException e) {
                throw new ServletException("Cannot retrieve staff users", e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        // Initialize DBManager if it's not already in the session
        if (manager == null) {
            throw new ServletException("DBManager not initialized");
        }

        String action = request.getParameter("action");
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
            if ("delete".equals(action)) {
                manager.deleteStaffUser(email); // Delete by email
            } else {
                StaffUser staffUser = new StaffUser(firstName, lastName, email, password, dob, phone, address, city, postcode, country);
                if ("add".equals(action)) {
                    manager.addStaffUser(staffUser);
                } else if ("update".equals(action)) {
                    manager.updateStaffUser(staffUser);
                }
            }

            List<StaffUser> staffUsers = manager.getAllStaffUsers();
            session.setAttribute("staffUsers", staffUsers);
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Error managing staff users", e);
        }
    }
}
