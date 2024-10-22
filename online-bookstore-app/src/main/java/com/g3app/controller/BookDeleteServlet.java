package com.g3app.controller;

import com.g3app.dao.DBConnector;
import com.g3app.dao.DBManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/BookDeleteServlet")
public class BookDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the book ID from the request
        String bookIdStr = request.getParameter("bookId");

        // Validate the book ID
        if (bookIdStr == null || bookIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID format.");
            return;
        }

        try {
            int bookId = Integer.parseInt(bookIdStr); // Convert to integer

            // Open database connection
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            // Delete the book from the database
            boolean success = dbManager.deleteBookById(bookId); // Use delete by ID
            
            // Close database connection
            connector.closeConnection();
            
            // Set success message if deletion was successful
            if (success) {
                request.setAttribute("deleteStatus", "deleted");
                request.setAttribute("successMessage", "Book deleted successfully!");
            } else {
                request.setAttribute("deleteStatus", "notFound");
                request.setAttribute("errorMessage", "Book not found or could not be deleted.");
            }

            // Set activeTab to 'deleteBook' so it returns to the delete book tab
            request.setAttribute("activeTab", "deleteBook");

            // Forward to the JSP page
            request.getRequestDispatcher("staffCatalogue.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid book ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete the book.");
        }
    }
}
