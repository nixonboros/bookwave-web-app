package com.g3app.dao;

import com.g3app.model.User;
import com.g3app.model.StaffUser;
import com.g3app.model.Book;
import java.util.*;
import java.sql.*;

public class DBManager {
    public Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    // Find user by email and password
    public User findUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = '" + email + "' AND password = '" + password + "'";
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            return new User(
                rs.getString("firstName"),
                rs.getString("lastName"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("dob"),
                rs.getString("phone"),
                rs.getString("address"),
                rs.getString("city"),
                rs.getString("postcode"),
                rs.getString("country")
            );
        }
        return null; // No user found
    }

    // Add a user to the database
    public void addUser(User user) throws SQLException {
        String query = "INSERT INTO users (firstName, lastName, email, password, dob, phone, address, city, postcode, country) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, user.getFirstName());
        pstmt.setString(2, user.getLastName());
        pstmt.setString(3, user.getEmail());
        pstmt.setString(4, user.getPassword()); // Hash passwords in production
        pstmt.setString(5, user.getDob());
        pstmt.setString(6, user.getPhone());
        pstmt.setString(7, user.getAddress());
        pstmt.setString(8, user.getCity());
        pstmt.setString(9, user.getPostcode());
        pstmt.setString(10, user.getCountry());
        pstmt.executeUpdate();
    }
   
    // add staff user
    public void addStaffUser(StaffUser staffUser) throws SQLException {
        String query = "INSERT INTO staffusers (firstName, lastName, email, password, dob, phone, address, city, postcode, country, staffId) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, staffUser.getFirstName());
        pstmt.setString(2, staffUser.getLastName());
        pstmt.setString(3, staffUser.getEmail());
        pstmt.setString(4, staffUser.getPassword()); // Hash passwords in production
        pstmt.setString(5, staffUser.getDob());
        pstmt.setString(6, staffUser.getPhone());
        pstmt.setString(7, staffUser.getAddress());
        pstmt.setString(8, staffUser.getCity());
        pstmt.setString(9, staffUser.getPostcode());
        pstmt.setString(10, staffUser.getCountry());
        pstmt.setString(11, staffUser.getStaffId()); // New field
        pstmt.executeUpdate();
    }
    
    // find staff user
    public StaffUser findStaffUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM staffusers WHERE email = ? AND password = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            return new StaffUser(
                rs.getString("firstName"),
                rs.getString("lastName"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("dob"),
                rs.getString("phone"),
                rs.getString("address"),
                rs.getString("city"),
                rs.getString("postcode"),
                rs.getString("country"),
                rs.getString("staffId") // Include staffId
            );
        }
        return null; // No staff user found
    }
    
    public boolean deleteUserByEmail(String email) throws SQLException {
    String query = "DELETE FROM users WHERE email = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);

    try {
        pstmt.setString(1, email);
        int rowsAffected = pstmt.executeUpdate();

        return rowsAffected > 0; // returns true assuming at least one row was deleted
    } finally {
        if (pstmt != null) {
            pstmt.close(); // close statement to release resources
        }
    }
}
    public boolean deleteBookByTitle(String title) throws SQLException {
    String query = "DELETE FROM books WHERE title = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);

    try {
         pstmt.setString(1, title); // Set the title parameter

        // Execute the update
        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0; // Returns true if a book was deleted
    } finally {
        // Close the PreparedStatement if it was initialized
        if (pstmt != null) {
            pstmt.close();
        }
    }
}

    
    public boolean updateUserDetails(String oldEmail, String firstName, String lastName, String email, String dob, String phone, String address, String city, String postcode, String country) throws SQLException {
    String query = "UPDATE users SET firstName = ?, lastName = ?, email = ?, dob = ?, phone = ?, address = ?, city = ?, postcode = ?, country = ? WHERE email = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    
    try{
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, email);
        pstmt.setString(4, dob);
        pstmt.setString(5, phone);
        pstmt.setString(6, address);
        pstmt.setString(7, city);
        pstmt.setString(8, postcode);
        pstmt.setString(9, country);
        pstmt.setString(10, oldEmail); // identify user by old email
        
        int rowsAffected = pstmt.executeUpdate();
        return rowsAffected > 0; // returns true if one row was updated
    }
    finally {
        if (pstmt != null) {
            pstmt.close(); // close statement to release resources
        }
    }
    }
    
public void addBook(Book book) throws SQLException {
    String query = "INSERT INTO books (title, author, price, publishedDate, description, imgUrl, genre, medium) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    
    try {
        pstmt.setString(1, book.getTitle());
        pstmt.setString(2, book.getAuthor());
        pstmt.setDouble(3, book.getPrice());
        pstmt.setString(4, book.getPublishedDate());
        pstmt.setString(5, book.getDescription());
        pstmt.setString(6, book.getImgUrl());
        pstmt.setString(7, book.getGenre());
        pstmt.setString(8, book.getMedium());

        pstmt.executeUpdate(); // Execute the insert statement
    } finally {
        if (pstmt != null) {
            pstmt.close(); // Close statement to release resources
        }
    }
}

    
    public ArrayList<Book> getAllBooks() throws SQLException {
    ArrayList<Book> books = new ArrayList<>();
    String query = "SELECT * FROM books"; // Ensure your table structure includes genre and medium
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
        int id = rs.getInt("id");
        String title = rs.getString("title");
        String author = rs.getString("author");
        double price = rs.getDouble("price");
        String publishedDate = rs.getString("publishedDate");
        String description = rs.getString("description");
        String imgUrl = rs.getString("imgUrl");
        String genre = rs.getString("genre"); // New line to get genre
        String medium = rs.getString("medium"); // Change the variable name to medium

        Book book = new Book(id, title, author, price, publishedDate, description, imgUrl, genre, medium); // Use medium
        books.add(book);
    }
    return books;
}

    
    public Book getBookById(int id) throws SQLException {
    Book book = null;
    String query = "SELECT * FROM books WHERE id = ?"; // Use parameterized query for security
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    pstmt.setInt(1, id); // Set the ID parameter
    ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // Create a book object from the result set
            book = new Book(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("author"),
                rs.getDouble("price"),
                rs.getString("publishedDate"),
                rs.getString("description"),
                rs.getString("imgUrl"),
                rs.getString("genre"),
                rs.getString("medium")
            );
        } else {
            System.out.println("No book found with ID: " + id); // Debug message
        }
    
    return book; // Return the book object or null if not found
}


    // Other methods (updateUser, deleteUser) can be added similarly
}