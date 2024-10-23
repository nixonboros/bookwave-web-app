package com.g3app.controller;

import com.g3app.model.Book;
import com.g3app.model.Cart;
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

@WebServlet("/AddToCartServlet")
public class CartServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Retrieve the book ID and quantity from the request
    String bookIdParam = request.getParameter("bookId");
    String quantityParam = request.getParameter("quantity");
    
    int bookId;
    int quantity;

    try {
        bookId = Integer.parseInt(bookIdParam);
        quantity = Integer.parseInt(quantityParam); // Parse the quantity here
    } catch (NumberFormatException e) {
        e.printStackTrace();
        request.setAttribute("status", "error");
        request.setAttribute("errorMessage", "Invalid book ID or quantity format.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return;
    }

    try {
        // Open database connection
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager dbManager = new DBManager(conn);

        // Retrieve the Book object from the database
        Book book = dbManager.getBookById(bookId);
        
        if (book != null) {
            // Retrieve the session and the cart object
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");

            // If cart doesn't exist, create a new one
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Add the book to the cart with the specified quantity
            cart.addItem(book, quantity); // Use the parsed quantity

            // Close database connection
            connector.closeConnection();

            // Redirect to the cart page
            response.sendRedirect("cart.jsp");
        } else {
            request.setAttribute("status", "error");
            request.setAttribute("errorMessage", "Book not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("status", "error");
        request.setAttribute("errorMessage", "Failed to add the book to the cart.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}
}

