package com.webapp;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert;

import com.g3app.dao.DBManager;
import com.g3app.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserTest {

    private User user;
    private User updatedUser;
    private DBManager dbManager;
    private Connection connection;

    // This method will run before each test case
    @Before
    public void setUp() throws Exception {
        // Initialize the user object with some data before each test
        user = new User("John", "Doe", "john.doe@example.com", "password123", "1990-01-01", "1234567890", "123 Main St", "New York", "10001", "USA");

        // Initialize the database connection and DBManager
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstoredb", "root", "root");
        dbManager = new DBManager(connection);

        // Ensure the user does not exist before adding
        dbManager.deleteUserByEmail(user.getEmail()); // Clean up any existing user
        dbManager.addUser(user); // Add the user to the database
    }

    // Test to verify that the user is created correctly
    @Test
    public void testUserCreation() {
        Assert.assertNotNull(user);
        Assert.assertEquals("John", user.getFirstName());
        Assert.assertEquals("Doe", user.getLastName());
        Assert.assertEquals("john.doe@example.com", user.getEmail());
    }

    @Test
    public void testUpdateUserDetails() throws Exception {
        // Act - Update user details
        String newEmail = "john.new@example.com";
        boolean updated = dbManager.updateUserDetails(user.getEmail(), 
                                                       "John", 
                                                       "Doe", 
                                                       newEmail, 
                                                       "1990-01-01", 
                                                       "9876543210", 
                                                       "456 Main St", 
                                                       "New York", 
                                                       "10001", 
                                                       "USA");

        // Assert - Ensure the update method returned true
        Assert.assertTrue("User details should be updated successfully.", updated);

        // Now fetch the updated user from the database
        updatedUser = dbManager.findUser(newEmail, "password123");

        // Verify that the details were updated correctly
        Assert.assertNotNull("Updated user should not be null.", updatedUser);
        Assert.assertEquals("John", updatedUser.getFirstName());
        Assert.assertEquals("Doe", updatedUser.getLastName());
        Assert.assertEquals(newEmail, updatedUser.getEmail());
        Assert.assertEquals("9876543210", updatedUser.getPhone()); // Verify the phone number
        Assert.assertEquals("456 Main St", updatedUser.getAddress()); // Verify the address
    }

    @Test
    public void testDeleteUserByEmail() throws SQLException {
        // Act - Delete the user using the original email
        boolean result = dbManager.deleteUserByEmail(user.getEmail());

        // Assert - Ensure deletion was successful
        Assert.assertTrue("User should be deleted successfully.", result);

        // Check that the user no longer exists in the database
        User deletedUser = dbManager.findUser(user.getEmail(), user.getPassword());
        Assert.assertNull("User should not be found after deletion.", deletedUser);
    }

    // Cleanup method to close the database connection after tests
    @org.junit.After
    public void tearDown() throws SQLException {
        // Cleanup the user after tests to maintain the database state
        dbManager.deleteUserByEmail(user.getEmail()); // Remove the user to avoid conflicts in future tests
        
        // Only delete updatedUser if it was created in the test
        if (updatedUser != null) {
            dbManager.deleteUserByEmail(updatedUser.getEmail()); // Remove updated user to avoid conflicts in future tests
        }

        // Close the connection
        if (connection != null) {
            connection.close();
        }
    }
}
