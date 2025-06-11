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
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Manage Staff Users - Bookstore</title>
</head>
<body>
    <%
        String activeTab = request.getAttribute("activeTab") != null ? request.getAttribute("activeTab").toString() : "addStaff";
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
                <form id="addStaffForm" action="StaffUserAddServlet" method="post">
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
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="postcode">Postcode:</label>
                        <input type="text" id="postcode" name="postcode" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" id="country" name="country" required>
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

            <!-- SEARCH STAFF USER TAB -->
<div id="searchStaff" class="tab-content <%= "searchStaff".equals(activeTab) ? "active" : "" %>">
    <h2>Search for a Staff User</h2>
    <form id="searchStaffForm" action="StaffUserSearchServlet" method="get">
        <div class="form-group">
            <label for="name">Enter Staff Name or Email:</label>
            <input type="text" id="name" name="searchName" required>
        </div>
        <div class="form-group">
            <button type="submit" id="searchStaffButton">Search for Staff User</button>
        </div>
    </form>

    <% 
    String deletionStatus = request.getAttribute("deleteStatus") != null ? request.getAttribute("deleteStatus").toString() : ""; 
    if ("success".equals(deletionStatus)) { 
    %>
        <div class="success-message">
            <p style="color: green;"><%= request.getAttribute("successMessage") %></p>
        </div>
    <% 
    } else if ("error".equals(deletionStatus) || "notFound".equals(deletionStatus)) { 
    %>
        <div class="error-message">
            <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "No staff users found with the given name." %></p>
        </div>
    <% 
    } 
    %>

    <% 
    String searchStatus = request.getAttribute("searchStatus") != null ? request.getAttribute("searchStatus").toString() : ""; 
    if ("found".equals(searchStatus)) { 
    %>
        <h3>Search Results</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date of Birth</th>
                    <th>Action(s)</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<StaffUser> searchedStaffUsers = (List<StaffUser>) request.getAttribute("searchedStaffUsers");
                for (StaffUser staffUser : searchedStaffUsers) {
                %>
                    <tr>
                        <td><%= staffUser.getFirstName() + " " + staffUser.getLastName() %></td>
                        <td><%= staffUser.getEmail() %></td>
                        <td><%= staffUser.getPhone() %></td>
                        <td><%= staffUser.getDob() %></td>
                        <td>
                            <form action="StaffUserDeleteServlet" method="post" style="display:inline;">
                                <input type="hidden" name="email" value="<%= staffUser.getEmail() %>">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete this staff user?');">Delete</button>
                            </form>
                            <form action="staffEdit.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="email" value="<%= staffUser.getEmail() %>">
                                <button type="submit">Edit</button>
                            </form>
                        </td>
                    </tr>
                <% 
                }
                %>
            </tbody>
        </table>
    <% 
    } else if ("notFound".equals(searchStatus)) { 
    %>
        <div class="error-message">
            <p style="color: red;">No staff users found with the given name.</p>
        </div>
    <% 
    } else if ("error".equals(searchStatus)) { 
    %>
        <div class="error-message">
            <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An error occurred while searching for the staff user. Please try again." %></p>
        </div>
    <% 
    } 
    %>
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
