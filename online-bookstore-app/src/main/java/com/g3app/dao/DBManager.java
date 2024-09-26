package com.g3app.dao;

import com.g3app.model.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    public Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    // find customer user
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

    // add customer user
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
    
    public void createSupportTicket(SupportTicket ticket) throws SQLException {
        String query = "INSERT INTO support_tickets (customer_name, email, subject_title, type_of_enquiry, issue_description, status, date_submitted) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, ticket.getCustomerName());
        pstmt.setString(2, ticket.getEmail());
        pstmt.setString(3, ticket.getSubjectTitle());
        pstmt.setString(4, ticket.getTypeOfEnquiry());
        pstmt.setString(5, ticket.getIssueDescription());
        pstmt.setString(6, ticket.getStatus());
        pstmt.setDate(7, new java.sql.Date(ticket.getDateSubmitted().getTime()));
        pstmt.executeUpdate();
    }
    
    public SupportTicket getSupportTicketById(int ticketId) throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE ticket_id = " + ticketId;
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            SupportTicket ticket = new SupportTicket();
            ticket.setTicketId(rs.getInt("ticket_id"));
            ticket.setCustomerName(rs.getString("customer_name"));
            ticket.setEmail(rs.getString("email"));
            ticket.setSubjectTitle(rs.getString("subject_title"));
            ticket.setTypeOfEnquiry(rs.getString("type_of_enquiry"));
            ticket.setIssueDescription(rs.getString("issue_description"));
            ticket.setStatus(rs.getString("status"));
            ticket.setDateSubmitted(rs.getDate("date_submitted"));
            return ticket;
        }
        return null; // No ticket found
    }
    
    public List<SupportTicket> getAllSupportTickets() throws SQLException {
        String query = "SELECT * FROM supporttickets";
        ResultSet rs = st.executeQuery(query);
        List<SupportTicket> tickets = new ArrayList<>();
        while (rs.next()) {
            SupportTicket ticket = new SupportTicket();
            ticket.setTicketId(rs.getInt("ticketId"));
            ticket.setCustomerName(rs.getString("customerName"));
            ticket.setEmail(rs.getString("email"));
            ticket.setSubjectTitle(rs.getString("subjectTitle"));
            ticket.setTypeOfEnquiry(rs.getString("typeOfEnquiry"));
            ticket.setIssueDescription(rs.getString("issueDescription"));
            ticket.setStatus(rs.getString("status"));
            ticket.setDateSubmitted(rs.getDate("dateSubmitted"));
            tickets.add(ticket);
        }
        return tickets;
    }

}