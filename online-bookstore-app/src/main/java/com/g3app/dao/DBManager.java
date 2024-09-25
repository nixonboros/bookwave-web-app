package com.g3app.dao;

import com.g3app.model.User;
import com.g3app.model.StaffUser;
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
    public User findStaffUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM staffusers WHERE email = ? AND password = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
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
        return null; // No staff user found
    }

    // Other methods (updateUser, deleteUser) can be added similarly
}