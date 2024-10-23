<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    <main>
        <section class="animated">
            <%
                String bookIdParam = request.getParameter("id");
                Book book = null;
                if (bookIdParam != null && !bookIdParam.isEmpty()) {
                    try {
                        int bookId = Integer.parseInt(bookIdParam);
                        Catalogue catalogue = new Catalogue();
                        book = catalogue.getBookById(bookId);
                    } catch (NumberFormatException e) {
                        out.println("Invalid book ID format.");
                    } catch (SQLException e) {
                        out.println("Error fetching book details: " + e.getMessage());
                    }
                }
                String title = (book != null) ? book.getTitle() : "Book not found.";
            %>
            <title><%= title %> - Bookstore</title>
            <h1 class="formTitle">Catalogue -> <%= (book != null) ? book.getMedium() : "Unknown" %></h1>
            <%
                if (book != null) {
            %>
            <div class="individual-book-details">
                <img src="<%= book.getImgUrl() %>" alt="<%= book.getTitle() %>" class="book-img">
                <div class="book-info">
                    <h2><%= book.getTitle() %></h2>
                    <p><strong>Author:</strong> <%= book.getAuthor() %></p>
                    <p><strong>Medium:</strong> <%= book.getMedium() %></p>
                    <p><strong>Price:</strong> $<%= book.getPrice() %></p>
                    <p><strong>Genre:</strong> <%= book.getGenre() %></p>
                    <p><strong>Description:</strong> <%= book.getDescription() %></p>
                    <div class="add-to-cart">
                        <form action="AddToCartServlet" method="POST">
                            <input type="hidden" name="bookId" value="<%= book.getId() %>">
                            <div style="display: flex; align-items: center;">
                                <label for="quantity" style="margin-right: 10px;">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" value="1" min="1" required>
                            </div>
                            <button type="submit" class="btn-add-to-cart">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                } else {
                    out.println("No book found with the specified ID.");
                }
            %>
        </section>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
</html>
