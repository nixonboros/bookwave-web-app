package com.g3app.controller;

import com.g3app.model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the book ID from the request
        String bookIdParam = request.getParameter("bookId");

        if (bookIdParam != null) {
            int bookId = Integer.parseInt(bookIdParam);

            // Retrieve the cart from the session
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart != null) {
                // Remove the item from the cart
                cart.removeItem(bookId);
            }
        }
        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
