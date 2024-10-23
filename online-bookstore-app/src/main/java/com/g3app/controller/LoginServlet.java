package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.model.Cart; // Import Cart class
import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Import HttpSession
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            User user = dbManager.findUser(email, password);
            connector.closeConnection();

            if (user != null) {
                // successful login
                HttpSession session = request.getSession();
                
                // clear guest cart
                Cart guestCart = (Cart) session.getAttribute("cart");
                if (guestCart != null) {
                    session.removeAttribute("cart"); // clear the guest cart
                }
                
                // set user information in the session
                session.setAttribute("user", user);
                session.setAttribute("email", user.getEmail());
                response.sendRedirect("index.jsp"); // redirect to welcome page or dashboard
            } else {
                // failed login
                response.sendRedirect("login.jsp?error=invalid_credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login failed.");
        }
    }
}
