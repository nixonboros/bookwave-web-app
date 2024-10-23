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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("searchName");
        DBConnector connector = null;
        Connection conn = null;

        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            // Search for users by name
            List<User> Users = dbManager.searchUsers(name);

            if (Users != null && !Users.isEmpty()) { // Check if Users is not null and not empty
                request.setAttribute("searchStatus", "found");
                request.setAttribute("searchedUsers", Users); // Set the list of users found
            } else {
                request.setAttribute("searchStatus", "notFound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("searchStatus", "error"); // Set searchStatus to error in case of exception
            request.setAttribute("errorMessage", "Database error occurred."); // Set error message
        } finally {
            // Ensure the connection is closed properly
            if (conn != null) {
                try {
                    conn.close(); // Close the connection
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connector != null) {
                try {
                    connector.closeConnection(); // Close the connector
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        request.setAttribute("activeTab", "searchUser"); 
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
    }
}
