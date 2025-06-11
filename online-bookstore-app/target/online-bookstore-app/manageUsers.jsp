<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>
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
    <title>Manage Users - Bookstore</title>
</head>
<body>
    <%
        String activeTab = request.getAttribute("activeTab") != null ? request.getAttribute("activeTab").toString() : "addUser";
        
    %>
    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <section class="contact-section animated">
            <h1>Manage Users</h1>
            <p>Here you can add, update, and delete users.</p>

            <div class="tabs">
                <div class="tab <%= "addUser".equals(activeTab) ? "active" : "" %>" data-target="addUser">Add User</div>
                <div class="tab <%= "searchUser".equals(activeTab) ? "active" : "" %>" data-target="searchUser">Search User</div>
                <div class="tab <%= "allUser".equals(activeTab) ? "active" : "" %>" data-target="allUser">All Users</div>
            </div>

            <!-- ADD USER TAB -->
            <div id="addUser" class="tab-content <%= "addUser".equals(activeTab) ? "active" : "" %>">
                <h2>Add New User</h2>
                <form id="addUserForm" action="UserAddServlet" method="post">
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
                        <button type="submit" id="addUserButton">Add User</button>
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

            <!-- SEARCH USER TAB -->
            <div id="searchUser" class="tab-content <%= "searchUser".equals(activeTab) ? "active" : "" %>">
                <h2>Search for a User</h2>
                <form id="searchUserForm" action="UserSearchServlet" method="get">
                    <div class="form-group">
                        <label for="name">Enter User Name or Email:</label>
                        <input type="text" id="name" name="searchName" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="searchUserButton">Search for User</button>
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
                        <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "No users found with the given name." %></p>
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
                            List<User> searchedUsers = (List<User>) request.getAttribute("searchedUsers");
                            for (User user : searchedUsers) {
                            %>
                                <tr>
                                    <td><%= user.getFirstName() + " " + user.getLastName()%></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getPhone() %></td>
                                    <td><%= user.getDob() %></td>
                                    <td>
                                        <form action="UserDeleteServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                            <button type="submit" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
                                        </form>
                                        <form action="userEdit.jsp" method="post" style="display:inline;">
                                            <input type="hidden" name="email" value="<%= user.getEmail() %>">
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
                        <p style="color: red;">No users found with the given name.</p>
                    </div>
                <% 
                } else if ("error".equals(searchStatus)) { 
                %>
                    <div class="error-message">
                        <p style="color: red;"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An error occurred while searching for the user. Please try again." %></p>
                    </div>
                <% 
                } 
                %>
            </div>

            <!-- ALL USERS TAB -->
<div id="allUser" class="tab-content <%= "allUser".equals(activeTab) ? "active" : "" %>">
   
    <%
        // Fetch the user count and list from DBManager before displaying
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager dbManager = new DBManager(conn);

        // Get the user count and store it as an attribute
        int userCount = dbManager.getUserCount();
        request.setAttribute("userCount", userCount);

        // Fetch all users to display in the table
        List<User> allUsers = dbManager.getAllUsers();
    %>
     <h2>All Users</h2>
     <p>Total Users: <%= userCount %></p>
    <h3>List of Users</h3>
    
    <form id="deleteSelectedForm" action="BatchDeleteUserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete the selected users?');">
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
                    for (User user : allUsers) {
                %>
                    <tr>
                        <td><input type="checkbox" name="selectedUsers" value="<%= user.getEmail() %>"></td>
                        <td><%= user.getFirstName() + " " + user.getLastName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><%= user.getDob() %></td>
                        <td><%= user.getAddress() %></td>
                        
                    </tr>
                    
                <% 
                    }
                    conn.close(); // Close the connection once done
                %>
            </tbody>
        </table>
            
        <div class="form-group">
            <button type="submit">Delete Selected Users</button>
        </div>
    </form>
</div>

    </form>
</div>

        </section>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
<script>
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.tab-content');
    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));
            tab.classList.add('active');
            document.getElementById(tab.getAttribute('data-target')).classList.add('active');
        });
    });
</script>
</html>
