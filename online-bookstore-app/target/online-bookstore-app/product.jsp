<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - BookWave</title>
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <div class="catalogue-boundary">
            <div class="catalogue-header-card">
                <h1 class="catalogue-title">Book Catalogue</h1>
                <p class="catalogue-desc">Explore our collection of books from various genres.</p>
                <form action="product.jsp" method="get" class="catalogue-filter-form">
                    <div class="filter-group">
                        <label for="category">Category</label>
                        <select name="category" id="category" class="filter-select">
                            <option value="">All Categories</option>
                            <option value="fiction">Fiction</option>
                            <option value="non-fiction">Non-Fiction</option>
                            <option value="biography">Biography</option>
                            <option value="children">Children's Books</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="sort">Sort By</label>
                        <select name="sort" id="sort" class="filter-select">
                            <option value="newest">Newest</option>
                            <option value="price-low">Price: Low to High</option>
                            <option value="price-high">Price: High to Low</option>
                            <option value="title">Title: A to Z</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="search">Search</label>
                        <input type="text" name="search" id="search" placeholder="Search books..." class="search-input">
                    </div>
                    <div class="filter-group filter-btn-group">
                    </div>
                </form>
            </div>
            <section class="book-grid-section">
                <%
                    // Create a new instance of Catalogue and fetch all books
                    Catalogue catalogue = new Catalogue();
                    ArrayList<Book> books = catalogue.getAllBooks();

                    // Check if there are books to display
                    if (books != null && !books.isEmpty()) {
                %>
                    <div class="book-grid">
                        <%
                            for (Book book : books) {
                        %>
                            <div class="book-card">
                                <a href="book-details.jsp?id=<%= book.getId() %>" class="book-link">
                                    <div class="book-image">
                                        <img src="<%= book.getImgUrl() %>" alt="<%= book.getTitle() %>">
                                    </div>
                                    <div class="book-info">
                                        <h3><%= book.getTitle() %></h3>
                                        <p class="author">By <%= book.getAuthor() %></p>
                                        <p class="price">$<%= book.getPrice() %></p>
                                        <button class="button button-primary">View Details</button>
                                    </div>
                                </a>
                            </div>
                        <%
                            }
                        %>
                    </div>
                <%
                    } else {
                %>
                    <div class="no-books">
                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        <h2>No Books Found</h2>
                        <p>We couldn't find any books matching your criteria.</p>
                        <a href="product.jsp" class="button button-primary">View All Books</a>
                    </div>
                <%
                    }
                %>
                <div class="pagination">
                    <button type="button" class="pagination-btn" tabindex="0">&lt;</button>
                    <span class="current-page">1</span>
                    <button type="button" class="pagination-btn" tabindex="0">&gt;</button>
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="footer.jsp"/>

    <script>
    // Set selected values from URL parameters
    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        
        const category = urlParams.get('category');
        if (category) {
            document.getElementById('category').value = category;
        }
        
        const sort = urlParams.get('sort');
        if (sort) {
            document.getElementById('sort').value = sort;
        }
        
        const search = urlParams.get('search');
        if (search) {
            document.getElementById('search').value = search;
        }
    });
    </script>
</body>
</html>
