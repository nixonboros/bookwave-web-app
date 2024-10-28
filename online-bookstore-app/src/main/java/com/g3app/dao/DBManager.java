package com.g3app.dao;

import com.g3app.model.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private Connection conn;  // Ensure this is properly initialized
    public Statement st;

    public DBManager(Connection conn) throws SQLException {
        this.conn = conn; // Assign the passed connection to this.conn
        if (this.conn != null) {
            st = conn.createStatement();
        } else {
            throw new SQLException("Database connection is null!");
        }
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
        String query = "INSERT INTO staffusers (firstName, lastName, email, password, dob, phone, address, city, postcode, country) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
        pstmt.executeUpdate();
    }
    
       // update staff
    public void updateStaff(StaffUser staffUser) throws SQLException {
    String query = "UPDATE staffusers SET firstName = ?, lastName = ?, email = ?, dob = ?, phone = ?, address = ?, city = ?, postcode = ?, country = ?, password = ? WHERE email = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    pstmt.setString(1, staffUser.getFirstName());
    pstmt.setString(2, staffUser.getLastName());
    pstmt.setString(3, staffUser.getEmail());
    pstmt.setString(4, staffUser.getDob());
    pstmt.setString(5, staffUser.getPhone());
    pstmt.setString(6, staffUser.getAddress());
    pstmt.setString(7, staffUser.getCity());
    pstmt.setString(8, staffUser.getPostcode());
    pstmt.setString(9, staffUser.getCountry());
    pstmt.setString(10, staffUser.getPassword());
    pstmt.setString(11, staffUser.getEmail());
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
                rs.getString("country")
            );
        }
        return null;
    }

    // get all staff users
    public ArrayList<StaffUser> getAllStaffUsers() throws SQLException {
        ArrayList<StaffUser> staffUsers = new ArrayList<>();
        String query = "SELECT * FROM staffusers"; // Ensure your table structure matches
        PreparedStatement pstmt = st.getConnection().prepareStatement(query); // Use prepared statement
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String email = rs.getString("email");
            String password = rs.getString("password");
            String dob = rs.getString("dob");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String city = rs.getString("city");
            String postcode = rs.getString("postcode");
            String country = rs.getString("country");

            StaffUser staffUser = new StaffUser(firstName, lastName, email, password, dob, phone, address, city, postcode, country);
            staffUsers.add(staffUser);
        }

        return staffUsers;
    }


    // Method to delete a staff user by email
    public boolean deleteStaffUserByEmail(String email) {
        String query = "DELETE FROM staffusers WHERE email = ?"; // Assuming 'email' is unique in the staffusers table

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email); // Set the staff email in the query
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0; // If rows were affected, return true (success)
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if any error occurs
        }
    }

    // update staff user
    public void updateStaffUser(StaffUser staffUser) throws SQLException {
        String query = "UPDATE staffusers SET firstName = ?, email = ?, password = ? WHERE email = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, staffUser.getFirstName());
        pstmt.setString(2, staffUser.getEmail());
        pstmt.setString(3, staffUser.getPassword());
        pstmt.setString(4, staffUser.getEmail());
        pstmt.executeUpdate();
    }

    // search staff users by name
    public List<StaffUser> searchStaffUsers(String search) throws SQLException {
        List<StaffUser> staffUsers = new ArrayList<>();
        String query = "SELECT * FROM staffusers WHERE firstName LIKE ? OR lastName LIKE ? OR email LIKE ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, "%" + search + "%");
        pstmt.setString(2, "%" + search + "%");
        pstmt.setString(3, "%" + search + "%");
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            StaffUser staffUser = new StaffUser(
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
            staffUsers.add(staffUser);
        }
        return staffUsers;
    }

    public boolean deleteUserByEmail(String email) throws SQLException {
    String query = "DELETE FROM users WHERE email = ?";

    // Ensure st.getConnection() provides an active connection
    try (PreparedStatement pstmt = st.getConnection().prepareStatement(query)) {
        pstmt.setString(1, email);
        int rowsAffected = pstmt.executeUpdate();

        System.out.println("Deleting user with email: " + email); // Debug line
        System.out.println("Rows affected: " + rowsAffected); // Debug line

        return rowsAffected > 0; // Returns true if at least one row was deleted
    }
}

    
    // get all staff users
    public ArrayList<User> getAllUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<>();
        String query = "SELECT * FROM users"; // Ensure your table structure matches
        PreparedStatement pstmt = st.getConnection().prepareStatement(query); // Use prepared statement
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            String firstName = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String email = rs.getString("email");
            String password = rs.getString("password");
            String dob = rs.getString("dob");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String city = rs.getString("city");
            String postcode = rs.getString("postcode");
            String country = rs.getString("country");

            User user = new User(firstName, lastName, email, password, dob, phone, address, city, postcode, country);
            users.add(user);
        }

        return users;
    }

    // update user
    public void updateUser(User user) throws SQLException {
    String query = "UPDATE users SET firstName = ?, lastName = ?, email = ?, dob = ?, phone = ?, address = ?, city = ?, postcode = ?, country = ?, password = ? WHERE email = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);
    pstmt.setString(1, user.getFirstName());
    pstmt.setString(2, user.getLastName());
    pstmt.setString(3, user.getEmail());
    pstmt.setString(4, user.getDob());
    pstmt.setString(5, user.getPhone());
    pstmt.setString(6, user.getAddress());
    pstmt.setString(7, user.getCity());
    pstmt.setString(8, user.getPostcode());
    pstmt.setString(9, user.getCountry());
    pstmt.setString(10, user.getPassword());
    pstmt.setString(11, user.getEmail());
    pstmt.executeUpdate();
}


    // search users by name
    public List<User> searchUsers(String search) throws SQLException {
        List<User> Users = new ArrayList<>();
        String query = "SELECT * FROM users WHERE firstName LIKE ? OR lastName LIKE ? OR email LIKE ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, "%" + search + "%");
        pstmt.setString(2, "%" + search + "%");
        pstmt.setString(3, "%" + search + "%");
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            User user = new User(
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
            Users.add(user);
        }
        return Users;
    }

    public boolean deleteBookByTitle(String title) throws SQLException {
    String query = "DELETE FROM books WHERE title = ?";
    PreparedStatement pstmt = st.getConnection().prepareStatement(query);

        try {
             pstmt.setString(1, title); // set the title parameter

            // Execute the update
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // returns true if a book was deleted
        } finally {
            // close the PreparedStatement if it was initialized
            if (pstmt != null) {
                pstmt.close();
            }
        }
    }
    
    public List<Book> searchBooksByTitle(String title) {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE title LIKE ?"; // Use LIKE for partial matches
            PreparedStatement pstmt = conn.prepareStatement(query);

            // add wildcard characters for partial matching
            String titleWithWildcards = "%" + title + "%"; 
            pstmt.setString(1, titleWithWildcards); // Set the parameter

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                // assuming Book has an appropriate constructor
                Book book = new Book(
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
                books.add(book); // Add book to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books; // Return the list of found books
    }


    public boolean deleteBookById(int id) throws SQLException {
        String query = "DELETE FROM books WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) { // use try-with-resources
            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // return true if at least one row was deleted
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // rethrow exception to handle it in the calling method if needed
        }
    }



    
    public boolean updateUserDetails(String oldEmail, String firstName, String lastName, String email, String password, String dob, String phone, String address, String city, String postcode, String country) throws SQLException {
        String query = "UPDATE users SET firstName = ?, lastName = ?, email = ?, password = ?, dob = ?, phone = ?, address = ?, city = ?, postcode = ?, country = ? WHERE email = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);

        try{
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, dob);
            pstmt.setString(6, phone);
            pstmt.setString(7, address);
            pstmt.setString(8, city);
            pstmt.setString(9, postcode);
            pstmt.setString(10, country);
            pstmt.setString(11, oldEmail); // identify user by old email

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
            // Use the constructor with parameters
            SupportTicket ticket = new SupportTicket(
                rs.getInt("ticket_id"),
                rs.getString("customer_name"),
                rs.getString("email"),
                rs.getString("subject_title"),
                rs.getString("type_of_enquiry"),
                rs.getString("issue_description"),
                rs.getString("status"),
                rs.getDate("date_submitted") // This can be converted to Date if necessary
            );
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
            // Use the constructor with parameters
            return new SupportTicket(
                rs.getInt("ticket_id"),
                rs.getString("customer_name"),
                rs.getString("email"),
                rs.getString("subject_title"),
                rs.getString("type_of_enquiry"),
                rs.getString("issue_description"),
                rs.getString("status"),
                rs.getDate("date_submitted")
            );
        }
        return null; // No ticket found
    }

    public List<SupportTicket> getTicketsByEmail(String email) throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE email = ? " +
                       "ORDER BY CASE WHEN status = 'Open' THEN 0 ELSE 1 END, ticket_id DESC";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);

        ResultSet rs = pstmt.executeQuery();

        List<SupportTicket> tickets = new ArrayList<>();

        while (rs.next()) {
            // Use the constructor with parameters
            SupportTicket ticket = new SupportTicket(
                rs.getInt("ticket_id"),
                rs.getString("customer_name"),
                rs.getString("email"),
                rs.getString("subject_title"),
                rs.getString("type_of_enquiry"),
                rs.getString("issue_description"),
                rs.getString("status"),
                rs.getDate("date_submitted")
            );
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
        
        // If the update was successful, send a notification
        if (rowsAffected > 0) {
            // Retrieve the support ticket details
            SupportTicket ticket = getSupportTicketById(Integer.parseInt(ticketId));

            // Create the notification message
            String notificationMessage = "Your support ticket #" + ticketId + " has been " + (status.equals("Open") ? "opened" : "closed") + ".";

            // Add the notification for the user
            addNotification(ticket.getEmail(), ticket.getTicketId(), notificationMessage);
        }
            
        return rowsAffected > 0; // Return true if the update was successful
    }

    public void addMessage(Message message, boolean sendNotification) throws SQLException {
        String query = "INSERT INTO ticket_messages (ticket_id, sender, message) VALUES (?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, message.getTicketId());
        pstmt.setString(2, message.getSender());
        pstmt.setString(3, message.getMessage());
        pstmt.executeUpdate();

        // Only send notification if flag is true
        if (sendNotification) {
            SupportTicket ticket = getSupportTicketById(message.getTicketId());
            // Include the ticket ID in the notification message
            String notificationMessage = "You have a new message in support ticket #" + message.getTicketId() + ".";
            addNotification(ticket.getEmail(), ticket.getTicketId(), notificationMessage);
        }
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
    
    public boolean deleteTicketById(int ticketId) throws SQLException {
        String query = "DELETE FROM support_tickets WHERE ticket_id = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, ticketId);

        int rowsAffected = pstmt.executeUpdate(); // Execute the deletion

        return rowsAffected > 0; // Return true if the ticket was deleted successfully
    }

    public List<SupportTicket> getOpenedSupportTickets() throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE status = 'Open'";
        List<SupportTicket> openedTickets = new ArrayList<>();
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            SupportTicket ticket = new SupportTicket(
                rs.getInt("ticket_id"),
                rs.getString("customer_name"),
                rs.getString("email"),
                rs.getString("subject_title"),
                rs.getString("type_of_enquiry"),
                rs.getString("issue_description"),
                rs.getString("status"),
                rs.getDate("date_submitted")
            );
            openedTickets.add(ticket);
        }
        return openedTickets;
    }

    public List<SupportTicket> getClosedSupportTickets() throws SQLException {
        String query = "SELECT * FROM support_tickets WHERE status = 'Closed' ORDER BY ticket_id DESC";
        List<SupportTicket> closedTickets = new ArrayList<>();
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            SupportTicket ticket = new SupportTicket(
                rs.getInt("ticket_id"),
                rs.getString("customer_name"),
                rs.getString("email"),
                rs.getString("subject_title"),
                rs.getString("type_of_enquiry"),
                rs.getString("issue_description"),
                rs.getString("status"),
                rs.getDate("date_submitted")
            );
            closedTickets.add(ticket);
        }
        return closedTickets;
    }
    
    public void addNotification(String userEmail, int ticketId, String message) throws SQLException {
        String query = "INSERT INTO notifications (user_email, ticket_id, message, status) VALUES (?, ?, ?, 'Unread')";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, userEmail);
        pstmt.setInt(2, ticketId);
        pstmt.setString(3, message);
        pstmt.executeUpdate();
    }
    
    public List<Notification> getUnreadNotificationsByEmail(String email) throws SQLException {
        String query = "SELECT * FROM notifications WHERE user_email = ? AND status = 'Unread' ORDER BY notification_id DESC";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        List<Notification> notifications = new ArrayList<>();
        while (rs.next()) {
            Notification notification = new Notification(
                rs.getInt("notification_id"),
                rs.getString("user_email"),
                rs.getInt("ticket_id"),
                rs.getString("message"),
                rs.getString("status"),
                rs.getDate("date_sent")
            );
            notifications.add(notification);
        }
        return notifications;
    }

    public List<Notification> getReadNotificationsByEmail(String email) throws SQLException {
        String query = "SELECT * FROM notifications WHERE user_email = ? AND status = 'Read' ORDER BY notification_id DESC";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        List<Notification> notifications = new ArrayList<>();
        while (rs.next()) {
            Notification notification = new Notification(
                rs.getInt("notification_id"),
                rs.getString("user_email"),
                rs.getInt("ticket_id"),
                rs.getString("message"),
                rs.getString("status"),
                rs.getDate("date_sent")
            );
            notifications.add(notification);
        }
        return notifications;
    }

    public List<Notification> getNotificationsByEmail(String email) throws SQLException {
        String query = "SELECT * FROM notifications WHERE user_email = ? ORDER BY notification_id DESC";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        List<Notification> notifications = new ArrayList<>();
        while (rs.next()) {
            Notification notification = new Notification(
                rs.getInt("notification_id"),
                rs.getString("user_email"),
                rs.getInt("ticket_id"),
                rs.getString("message"),
                rs.getString("status"),
                rs.getDate("date_sent")
            );
            notifications.add(notification);
        }
        return notifications;
    }

    public void updateNotificationStatus(int notificationId, String status) throws SQLException {
        String query = "UPDATE notifications SET status = ? WHERE notification_id = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, status);
        pstmt.setInt(2, notificationId);
        pstmt.executeUpdate();
    }
    
    public void markAllNotificationsAsRead(String email) throws SQLException {
        String query = "UPDATE notifications SET status = 'Read' WHERE user_email = ? AND status = 'Unread'";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.executeUpdate();
    }



    //SHIPMENTS CRUD
    public void createShipment(Shipment shipment) throws SQLException{
    String query = "INSERT INTO shipments (ShipmentID,ShipmentDate, ShipmentProgress, ShipmentStatus)" +
                       "VALUES (?,?, ?, ?)";
        PreparedStatement statement = st.getConnection().prepareStatement(query);
        statement.setInt(1, shipment.getID());
        statement.setString(2, shipment.getDate());
        statement.setString(3, shipment.getProgress());
        statement.setString(4, shipment.getStatus());
        statement.executeUpdate();
    }
    public boolean readShipment() throws SQLException{
        String query="SELECT * FROM shipments";
        PreparedStatement statement = st.getConnection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        int shipmentNum = 0;
        while (rs.next()) {
            shipmentNum++;
        }
        return shipmentNum > 0;
    }
    
    public void updateShipment(Shipment shipment) throws SQLException{
        String query = "UPDATE shipments SET ShipmentDate = ?, ShipmentProgress = ?, ShipmentStatus = ? WHERE ShipmentID = ?";
        PreparedStatement statement = st.getConnection().prepareStatement(query);
        statement.setString(1, shipment.getDate());
        statement.setString(2, shipment.getProgress());
        statement.setString(3, shipment.getStatus());
        statement.setInt(4, shipment.getID());
        statement.executeUpdate();
    }
    
    public void deleteShipment(Shipment shipment) throws SQLException{
        String query = "DELETE FROM shipments WHERE ShipmentID = ?";
        PreparedStatement statement = st.getConnection().prepareStatement(query);
        statement.setInt(1, shipment.getID());
        statement.executeUpdate();
    }
    
    public Shipment getShipmentByID(int id) throws SQLException{
        String query = "SELECT * FROM shipments WHERE ShipmentID = ?";
        PreparedStatement statement = st.getConnection().prepareStatement(query);
        statement.setInt(1, id);
        ResultSet rs = statement.executeQuery();
        if(rs.next()){
            Shipment shipment = new Shipment();
            shipment.setID(rs.getInt("ShipmentID"));
            shipment.setDate(rs.getString("ShipmentDate"));
            shipment.setProgress(rs.getString("ShipmentProgress"));
            shipment.setStatus(rs.getString("ShipmentStatus"));
            return shipment;
            }
        return null;
    }
    
    public void addPaymentMethod(Payment payment) throws SQLException {
        String query = "INSERT INTO payments (cardNumber, expiryDate, cardHolderName) VALUES (?, ?, ?)";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, payment.getCardNumber());
        pstmt.setString(2, payment.getExpiryDate());
        pstmt.setString(3, payment.getCardHolderName());
        pstmt.executeUpdate();
    }

    public void updatePaymentMethod(Payment payment) throws SQLException {
        String query = "UPDATE payments SET cardNumber = ?, expiryDate = ?, cardHolderName = ? WHERE paymentId = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setString(1, payment.getCardNumber());
        pstmt.setString(2, payment.getExpiryDate());
        pstmt.setString(3, payment.getCardHolderName());
        pstmt.setInt(4, payment.getPaymentId());
        pstmt.executeUpdate();
    }

    public void deletePaymentMethod(int paymentId) throws SQLException {
        String query = "DELETE FROM payments WHERE paymentId = ?";
        PreparedStatement pstmt = st.getConnection().prepareStatement(query);
        pstmt.setInt(1, paymentId);
        pstmt.executeUpdate();

    }
    
    public void addOrder(Order order) throws SQLException {
        // Query to insert order details into the orders table
        String orderQuery = "INSERT INTO orders (firstName, lastName, address, city, zip, paymentMethod, totalAmount, order_date, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = st.getConnection();
             PreparedStatement orderStmt = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS)) {
            // Set parameters for the orders table
            orderStmt.setString(1, order.getFirstName());
            orderStmt.setString(2, order.getLastName());
            orderStmt.setString(3, order.getAddress());
            orderStmt.setString(4, order.getCity());
            orderStmt.setString(5, order.getZip());
            orderStmt.setString(6, order.getPaymentMethod());
            orderStmt.setDouble(7, order.getTotalAmount());
            orderStmt.setDate(8, java.sql.Date.valueOf(order.getOrderDate())); 
            orderStmt.setString(9, order.getEmail());
            // Execute the insert and get the generated order ID
            int rowsAffected = orderStmt.executeUpdate();
            if (rowsAffected > 0) {
                // Get the generated order ID
                try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);
                        // Now insert the order items into the order_items table
                        String itemQuery = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                        try (PreparedStatement itemStmt = conn.prepareStatement(itemQuery)) {
                            for (CartItem item : order.getItems()) {
                                itemStmt.setInt(1, orderId); 
                                itemStmt.setInt(2, item.getProductId()); 
                                itemStmt.setInt(3, item.getQuantity()); 
                                itemStmt.setDouble(4, item.getPrice()); 
                                itemStmt.addBatch(); 
                            }
                            itemStmt.executeBatch();
                        }
                    }
                }
            }
        }
    }
    
    public List<Order> getOrdersByEmail(String email) throws SQLException {
        String query = "SELECT * FROM orders WHERE email = ?";
        List<Order> orders = new ArrayList<>();

        try (PreparedStatement pstmt = st.getConnection().prepareStatement(query)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setFirstName(rs.getString("firstName"));
                    order.setLastName(rs.getString("lastName"));
                    order.setEmail(rs.getString("email"));
                    order.setAddress(rs.getString("address"));
                    order.setCity(rs.getString("city"));
                    order.setZip(rs.getString("zip"));
                    order.setPaymentMethod(rs.getString("paymentMethod"));
                    order.setTotalAmount(rs.getDouble("totalAmount"));
                    order.setOrderDate(rs.getDate("order_date").toLocalDate());

                    // Retrieve order items for this order
                    order.setItems(getOrderItems(order.getId()));
                    orders.add(order);
                }
            }
        }
        return orders; 
    }

    private List<CartItem> getOrderItems(int orderId) throws SQLException {
        String query = "SELECT oi.*, b.title FROM order_items oi JOIN books b ON oi.product_id = b.id WHERE oi.order_id = ?";
        List<CartItem> items = new ArrayList<>();

        try (PreparedStatement pstmt = st.getConnection().prepareStatement(query)) {
            pstmt.setInt(1, orderId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setId(rs.getInt("product_id"));
                    book.setTitle(rs.getString("title"));
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    items.add(new CartItem(book, quantity));
                }
            }
        }
        return items; 
    }


    public User getUserByEmail(String email) throws SQLException {
        User user = null;
        String query = "SELECT * FROM users WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email); // Set the email parameter
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            user = new User(
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
        else {
            System.out.println("No user found with email: " + email);
        }

        return user; // Return the user object or null if not found
    }
    
    public StaffUser getStaffUserByEmail(String email) throws SQLException {
        StaffUser staffUser = null;
        String query = "SELECT * FROM staffusers WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email); // Set the email parameter
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            staffUser = new StaffUser(
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
        else {
            System.out.println("No user found with email: " + email);
        }

        return staffUser; // Return the user object or null if not found
    }
    
    public int getUserCount() throws SQLException {
    String query = "SELECT COUNT(*) AS total FROM users";
    try (PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            return rs.getInt("total");
        }
    }
    return 0;
    }
    
    public int getTotalStaffCount() throws SQLException {
    int count = 0;
    String query = "SELECT COUNT(*) AS total FROM staffusers"; // Replace 'staffusers' with the correct table name if needed
    try (PreparedStatement stmt = conn.prepareStatement(query);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            count = rs.getInt("total");
        }
    }
    return count;
}
    
     public boolean updateStaffUserDetails(String oldEmail, String firstName, String lastName, String email, String password, 
                                      String dob, String phone, String address, String city, String postcode, String country) 
                                      throws SQLException {
    String query = "UPDATE staffusers SET firstName = ?, lastName = ?, email = ?, password = ?, dob = ?, " +
                   "phone = ?, address = ?, city = ?, postcode = ?, country = ? WHERE email = ?";
    try (PreparedStatement statement = conn.prepareStatement(query)) {
        statement.setString(1, firstName);
        statement.setString(2, lastName);
        statement.setString(3, email);
        statement.setString(4, password);
        statement.setString(5, dob);
        statement.setString(6, phone);
        statement.setString(7, address);
        statement.setString(8, city);
        statement.setString(9, postcode);
        statement.setString(10, country);
        statement.setString(11, oldEmail);

        int rowsUpdated = statement.executeUpdate();
        return rowsUpdated > 0; // Return true if at least one row was updated
    }

    } 


}
