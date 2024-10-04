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
        pstmt.setString(4, user.getPassword());
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
        pstmt.setString(4, staffUser.getPassword()); 
        pstmt.setString(5, staffUser.getDob());
        pstmt.setString(6, staffUser.getPhone());
        pstmt.setString(7, staffUser.getAddress());
        pstmt.setString(8, staffUser.getCity());
        pstmt.setString(9, staffUser.getPostcode());
        pstmt.setString(10, staffUser.getCountry());
        pstmt.setString(11, staffUser.getStaffId()); 
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
                rs.getString("staffId") 
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
    
    public List<SupportTicket> getAllSupportTickets() throws SQLException {
        String query = "SELECT * FROM support_tickets";
        ResultSet rs = st.executeQuery(query);
        List<SupportTicket> tickets = new ArrayList<>();
        while (rs.next()) {
            SupportTicket ticket = new SupportTicket();
            ticket.setTicketId(rs.getInt("ticket_id"));
            ticket.setCustomerName(rs.getString("customer_name"));
            ticket.setEmail(rs.getString("email"));
            ticket.setSubjectTitle(rs.getString("subject_title"));
            ticket.setTypeOfEnquiry(rs.getString("type_of_enquiry"));
            ticket.setIssueDescription(rs.getString("issue_description"));
            ticket.setStatus(rs.getString("status"));
            ticket.setDateSubmitted(rs.getDate("date_submitted"));
            tickets.add(ticket);
        }
        return tickets;
    }
    
    public SupportTicket getSupportTicketById(int ticketId) throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE ticket_id = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, ticketId);
        ResultSet rs = pstmt.executeQuery();
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
    
    public List<SupportTicket> getTicketsByEmail(String email) throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE email = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);

        ResultSet rs = pstmt.executeQuery();

        List<SupportTicket> tickets = new ArrayList<>();

        while (rs.next()) {
            SupportTicket ticket = new SupportTicket();
            ticket.setTicketId(rs.getInt("ticket_id"));
            ticket.setCustomerName(rs.getString("customer_name"));
            ticket.setEmail(rs.getString("email"));
            ticket.setSubjectTitle(rs.getString("subject_title"));
            ticket.setTypeOfEnquiry(rs.getString("type_of_enquiry"));
            ticket.setIssueDescription(rs.getString("issue_description"));
            ticket.setStatus(rs.getString("status"));
            ticket.setDateSubmitted(rs.getDate("date_submitted"));
            tickets.add(ticket);
        }
        return tickets;
    }
    
    public boolean updateTicketStatus(String ticketId, String status) throws SQLException {
        String query = "UPDATE support_tickets SET status = ? WHERE ticket_id = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);

        pstmt.setString(1, status);
        pstmt.setInt(2, Integer.parseInt(ticketId)); // Convert ticketId to integer if needed

        int rowsAffected = pstmt.executeUpdate(); // Execute the update

        return rowsAffected > 0; // Return true if the update was successful
    }

    public void addMessage(Message message) throws SQLException {
        String query = "INSERT INTO ticket_messages (ticket_id, sender, message) VALUES (?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, message.getTicketId());
        pstmt.setString(2, message.getSender());
        pstmt.setString(3, message.getMessage());
        pstmt.executeUpdate();
}

    public List<Message> getMessagesByTicketId(int ticketId) throws SQLException {
        String query = "SELECT * FROM ticket_messages WHERE ticket_id = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, ticketId);
        ResultSet rs = pstmt.executeQuery();

        List<Message> messages = new ArrayList<>();
        while (rs.next()) {
            Message message = new Message(
                rs.getInt("message_id"),
                rs.getInt("ticket_id"),
                rs.getString("sender"),
                rs.getString("message"),
                rs.getTimestamp("timestamp")
            );
            messages.add(message);
        }
        return messages;
    }
}