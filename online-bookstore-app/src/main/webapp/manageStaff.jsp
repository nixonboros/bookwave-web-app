<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.StaffUser" %>
<%@ page import="com.g3app.dao.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Manage Staff Users - Bookstore</title>
</head>
<body>
    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <section class="contact-section animated">
            <h1>Manage Staff Users</h1>
            <p>Here you can add, update, and delete staff users.</p>

            <div class="tabs">
                <div class="tab active" data-target="addStaff">Add Staff User</div>
                <div class="tab" data-target="deleteStaff">Delete Staff User</div>
            </div>
            
            <!-- ADD STAFF USER TAB -->
            <div id="addStaff" class="tab-content active">
                <h2>Add New Staff User</h2>
                <form id="addStaffForm" action="StaffUserServlet" method="post">
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" required>
                    </div>

                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="form-group">
                        <button type="submit" id="addStaffButton">Add Staff User</button>
                    </div>
                </form>

                <% 
                String addStatus = request.getAttribute("status") != null ? request.getAttribute("status").toString() : ""; 
                if ("success".equals(addStatus)) { 
                %>
                    <div class="success-message">
                        <p style="color: green;"><%= request.getAttribute("successMessage") %></p>
                    </div>
                <% 
                } else if ("error".equals(addStatus)) { 
                %>
                    <div class="error-message">
                        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                    </div>
                <% 
                } 
                %>
            </div>
            
            <!-- DELETE STAFF USER TAB -->
            <div id="deleteStaff" class="tab-content">
                <h2>Delete a Staff User</h2>
                <form id="deleteStaffForm" action="StaffUserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this staff user? This cannot be undone.');">
                    <div class="form-group">
                        <label for="email">Enter Staff User Email to Delete:</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <button type="submit" id="deleteStaffButton">Delete Staff User</button>
                    </div>
                </form>

                <% 
                String deleteStatus = request.getAttribute("deleteStatus") != null ? request.getAttribute("deleteStatus").toString() : ""; 
                if ("deleted".equals(deleteStatus)) { 
                %>
                    <div class="success-message">
                        <p style="color: green;">Staff user deleted successfully!</p>
                    </div>
                <% 
                } else if ("error".equals(deleteStatus) || "notFound".equals(deleteStatus)) { 
                %>
                    <div class="error-message">
                        <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An error occurred while deleting the staff user. Please try again." %></p>
                    </div>
                <% 
                } 
                %>

                <h3>List of Staff Users</h3>
                <table>
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager dbManager = new DBManager(conn);
                List<StaffUser> staffUsers = dbManager.getAllStaffUsers(); // Assuming this method exists in DBManager
                
                for (StaffUser staffUser : staffUsers) {
            %>
                <tr>
                    <td><%= staffUser.getFirstName() %></td>
                    <td><%= staffUser.getLastName() %></td>
                    <td><%= staffUser.getEmail() %></td>
                    <td><%= staffUser.getPhone() %></td>
                </tr>
            <% 
                }
                connector.closeConnection();
            } catch (Exception e) {
                e.printStackTrace();
            } 
            %>
                    </tbody>
                </table>
            </div>

        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Tab functionality
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const targetId = tab.getAttribute('data-target');

                    tabs.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(content => content.classList.remove('active'));

                    tab.classList.add('active');
                    document.getElementById(targetId).classList.add('active');
                });
            });
        });
    </script>
    <jsp:include page="footer.jsp"/>
</body>
</html>
