package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("staffEmail");
        String password = request.getParameter("staffPassword");

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            User user = dbManager.findUser(email, password); // This needs to check staffusers table
            connector.closeConnection();

            if (user != null) {
                // Successful login
                request.getSession().setAttribute("user", user);
                response.sendRedirect("staffDashboard.jsp"); // Redirect to staff dashboard
            } else {
                // Failed login
                response.sendRedirect("staffLogin.jsp?error=invalid_credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login failed.");
        }
    }
}
