package com.g3app.controller;

import com.g3app.model.Book;
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

@WebServlet("/BookSearchServlet")
public class BookSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("searchTitle");
        DBConnector connector = null;
        Connection conn = null;

        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            DBManager dbManager = new DBManager(conn);
            
            // Search for books by title
            List<Book> books = dbManager.searchBooksByTitle(title); 

            if (books != null && !books.isEmpty()) { // Check if books is not null and not empty
                request.setAttribute("searchStatus", "found");
                request.setAttribute("searchedBooks", books); // Set the list of books found
                request.setAttribute("activeTab", "deleteBook"); // Set active tab to deleteBook
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

        // Forward to the staffCatalogue.jsp page
        request.getRequestDispatcher("staffCatalogue.jsp").forward(request, response);
        request.setAttribute("activeTab", "deleteBook"); // Set active tab to deleteBook

    }
}
