package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.model.Order;
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
import java.util.List;

@WebServlet("/UserOrderDashboardServlet")
public class UserOrderDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager dbManager = new DBManager(conn);

                // Retrieve orders for the logged-in user
                List<Order> orders = dbManager.getOrdersByEmail(user.getEmail());

                // Close the database connection
                connector.closeConnection();

                // Set the orders as a request attribute
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("order.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve orders.");
            }
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        }
    }
}
