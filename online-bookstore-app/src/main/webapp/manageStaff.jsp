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
    <%
        String activeTab = request.getAttribute("activeTab") != null ? request.getAttribute("activeTab").toString() : "allStaff";
    %>
    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <section class="contact-section animated">
            <h1>Manage Staff Users</h1>
            <p>Here you can add, update, and delete staff users.</p>

            <div class="tabs">
                <div class="tab <%= "addStaff".equals(activeTab) ? "active" : "" %>" data-target="addStaff">Add Staff</div>
                <div class="tab <%= "searchStaff".equals(activeTab) ? "active" : "" %>" data-target="searchStaff">Search Staff</div>
                <div class="tab <%= "allStaff".equals(activeTab) ? "active" : "" %>" data-target="allStaff">All Staff</div>
            </div>

            <!-- ADD STAFF USER TAB -->
            <div id="addStaff" class="tab-content <%= "addStaff".equals(activeTab) ? "active" : "" %>">
                <h2>Add New Staff User</h2>
                <!-- Form content goes here -->
            </div>

            <!-- SEARCH STAFF USER TAB -->
            <div id="searchStaff" class="tab-content <%= "searchStaff".equals(activeTab) ? "active" : "" %>">
                <h2>Search for a Staff User</h2>
                <!-- Search form and results go here -->
            </div>

            <!-- ALL STAFF TAB -->
            <div id="allStaff" class="tab-content <%= "allStaff".equals(activeTab) ? "active" : "" %>">
                <h2>All Staff</h2>
                <%
                    int totalStaffCount = 0;
                    try {
                        DBConnector connector = new DBConnector();
                        Connection conn = connector.openConnection();
                        DBManager dbManager = new DBManager(conn);
                        totalStaffCount = dbManager.getTotalStaffCount();
                        connector.closeConnection(); // Close the connection after retrieving the count
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <p>Total Staff Members: <%= totalStaffCount %></p>
                <h3>List of Staff Members</h3>
                <form id="deleteSelectedStaffForm" action="BatchDeleteStaffServlet" method="post" onsubmit="return confirm('Are you sure you want to delete the selected staff members?');">
                    <table>
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Date of Birth</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    DBConnector connector = new DBConnector();
                                    Connection conn = connector.openConnection();
                                    DBManager dbManager = new DBManager(conn);
                                    List<StaffUser> allStaff = dbManager.getAllStaffUsers();
                                    for (StaffUser staff : allStaff) {
                            %>
                                <tr>
                                    <td><input type="checkbox" name="selectedStaff" value="<%= staff.getEmail() %>"></td>
                                    <td><%= staff.getFirstName() + " " + staff.getLastName() %></td>
                                    <td><%= staff.getEmail() %></td>
                                    <td><%= staff.getPhone() %></td>
                                    <td><%= staff.getDob() %></td>
                                    <td><%= staff.getAddress() %></td>
                                </tr>
                            <% 
                                    }
                                    connector.closeConnection(); // Ensure to close the connection after use
                                } catch (Exception e) {
                                    e.printStackTrace();
                            %>
                                <tr>
                                    <td colspan="6">Error fetching staff members: <%= e.getMessage() %></td>
                                </tr>
                            <% 
                                }
                            %>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <button type="submit">Delete Selected Staff</button>
                    </div>
                </form>
            </div>

        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
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
