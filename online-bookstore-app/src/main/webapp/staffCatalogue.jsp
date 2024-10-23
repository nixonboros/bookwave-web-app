<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>
<%@ page import="com.g3app.model.Book" %>
<%@ page import="com.g3app.dao.DBConnector" %>
<%@ page import="com.g3app.dao.DBManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Manage Books - Bookstore</title>
</head>
<body>
    <%
        String activeTab = request.getAttribute("activeTab") != null ? request.getAttribute("activeTab").toString() : "addBook";
    %>

    <jsp:include page="staff-nav-header.jsp"/>
    <main>
        <section class="contact-section animated">
            <h1>Manage Your Books</h1>
            <p>Here you can add new books, delete existing ones, and view all books.</p>

            <div class="tabs">
                <div class="tab <%= "addBook".equals(activeTab) ? "active" : "" %>" data-target="addBook">Add Book</div>
                <div class="tab <%= "deleteBook".equals(activeTab) ? "active" : "" %>" data-target="deleteBook">Delete Book</div>
                <div class="tab <%= "allBooks".equals(activeTab) ? "active" : "" %>" data-target="allBooks">All Books</div>
            </div>

            <!-- ADD BOOK TAB -->
            <div id="addBook" class="tab-content <%= "addBook".equals(activeTab) ? "active" : "" %>">
                <h2>Add New Book</h2>
                <form id="addBookForm" action="BookAddServlet" method="post">
                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="author">Author:</label>
                        <input type="text" id="author" name="author" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" id="price" name="price" required>
                    </div>
                    <div class="form-group">
                        <label for="publishedDate">Published Date:</label>
                        <input type="date" id="publishedDate" name="publishedDate" required>
                    </div>
                    <div class="form-group">
                        <label for="genre">Genre:</label>
                        <input type="text" id="genre" name="genre" required>
                    </div>
                    <div class="form-group">
                        <label for="medium">Medium:</label>
                        <input type="text" id="medium" name="medium" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="imgUrl">Image URL:</label>
                        <input type="text" id="imgUrl" name="imgUrl">
                    </div>
                    <div class="form-group">
                        <button type="submit" id="addBookButton">Add Book</button>
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

            <!-- DELETE BOOK TAB -->
            <div id="deleteBook" class="tab-content <%= "deleteBook".equals(activeTab) ? "active" : "" %>">
                <h2>Search and Delete a Book</h2>
                <form id="searchBookForm" action="BookSearchServlet" method="get">
                    <div class="form-group">
                        <label for="searchTitle">Enter Book Title to Search:</label>
                        <input type="text" id="searchTitle" name="searchTitle" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="searchBookButton">Search Book</button>
                    </div>
                </form>

                <!-- Results Section -->
                <%
                    String searchStatus = request.getAttribute("searchStatus") != null ? request.getAttribute("searchStatus").toString() : ""; 
                    if ("found".equals(searchStatus)) {
                        List<Book> books = (List<Book>) request.getAttribute("searchedBooks");
                %>
                    <h3>Books Found</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Price</th>
                                <th>Published Date</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String title = request.getParameter("searchTitle");
                                System.out.println("Search Title: " + title); // Debugging line
                                if (books != null) {
                                    for (Book book : books) {
                            %>
                                <tr>
                                    <td><%= book.getId() %></td>
                                    <td><%= book.getTitle() %></td>
                                    <td><%= book.getAuthor() %></td>
                                    <td><%= book.getPrice() %></td>
                                    <td><%= book.getPublishedDate() %></td>
                                    <td>
                                        <form action="BookDeleteServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="bookId" value="<%= book.getId() %>">
                                            <button type="submit" onclick="return confirm('Are you sure you want to delete this book?');">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                                    }
                                } else {
                            %>
                                <tr>
                                    <td colspan="6">No books found.</td>
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
                        <p style="color: red;">Book not found. Please try again.</p>
                    </div>
                <%
                    } 
                %>
            </div>

            <!-- ALL BOOKS TAB -->
            <div id="allBooks" class="tab-content">
                <h2>All Books</h2>
                <h3>List of Books</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Date of Publication</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                DBConnector connector = new DBConnector();
                                Connection conn = connector.openConnection();
                                DBManager dbManager = new DBManager(conn);
                                List<Book> books = dbManager.getAllBooks(); // Assuming this method exists in DBManager

                                for (Book book : books) {
                        %>
                            <tr>
                                <td><%= book.getId() %></td>
                                <td><%= book.getTitle() %></td>
                                <td><%= book.getAuthor() %></td>
                                <td><%= book.getPrice() %></td>
                                <td><%= book.getPublishedDate() %></td>
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
