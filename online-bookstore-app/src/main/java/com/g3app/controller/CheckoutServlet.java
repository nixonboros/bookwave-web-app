package com.g3app.controller;

import com.g3app.model.User;
import com.g3app.model.Cart;
import com.g3app.model.CartItem;
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
import java.time.LocalDate;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");
    Cart cart = (Cart) session.getAttribute("cart");

    // Collecting order information
    String name = user.getFirstName() + " " + user.getLastName();
    String email = user.getEmail();
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String zip = request.getParameter("zip");
    String paymentMethod = request.getParameter("paymentMethod");
    double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
    LocalDate orderDate = LocalDate.now();

    // Create the Order object
    Order order = new Order();
    order.setFirstName(user.getFirstName());
    order.setLastName(user.getLastName());
    order.setEmail(user.getEmail());
    order.setAddress(address);
    order.setCity(city);
    order.setZip(zip);
    order.setPaymentMethod(paymentMethod);
    order.setTotalAmount(totalAmount);
    order.setOrderDate(orderDate);

    List<CartItem> cartItems = cart.getItems();
    order.setItems(cartItems);

    try {
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager dbManager = new DBManager(conn);

        // insert the order into the database
        dbManager.addOrder(order);

        // close the database connection
        connector.closeConnection();

        // clear the cart from the session after order placement
        session.removeAttribute("cart");

        // redirect to a confirmation page
        request.setAttribute("order", order); // Set the order object as a request attribute
        request.getRequestDispatcher("orderconfirmation_success.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Order placement failed.");
    }
}
}
