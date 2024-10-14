package com.g3app.controller;

import com.g3app.model.Order; // Ensure to import the Order class
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
import java.util.logging.Logger;
import java.time.LocalDate;
import java.util.logging.Level;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CheckoutServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newName = request.getParameter("newName");
        String[] nameParts = newName.split(" ");
        String firstName = nameParts[0]; // Assumes first name is the first part
        String lastName = nameParts.length > 1 ? nameParts[1] : ""; // Assumes last name is the second part

        String newAddress = request.getParameter("newAddress");
        String newCity = request.getParameter("newCity");
        String newZip = request.getParameter("newZip");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        String paymentMethod = request.getParameter("paymentMethod");

        Order order = new Order();
        order.setFirstName(firstName);
        order.setLastName(lastName);
        order.setAddress(newAddress);
        order.setCity(newCity);
        order.setZip(newZip);
        order.setTotalAmount(totalAmount);
        order.setPaymentMethod(paymentMethod);
        order.setOrderDate(LocalDate.now()); // Sets current date as order date

        DBConnector connector = null;
        try {
            connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            dbManager.saveOrder(order); // Save order to the database
            logger.info("Order saved successfully for user: " + firstName + " " + lastName); // Log successful order save
            response.sendRedirect("orderConfirmation.jsp"); // Redirect to confirmation page
        } catch (Exception e) {
            logger.severe("Failed to save order for user: " + firstName + " " + lastName + ". Error: " + e.getMessage()); // Log error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Order processing failed."); // Send error response
        } finally {
            if (connector != null) {
                try {
                    connector.closeConnection(); // Ensure connection is closed
                } catch (SQLException ex) {
                    Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}