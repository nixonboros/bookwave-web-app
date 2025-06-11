<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - BookWave</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <div class="container">
            <section class="catalogue-header">
                <h1>Book Catalogue</h1>
                <p>Explore our collection of books from various genres.</p>
                
                <div class="filter-container">
                    <form action="product.jsp" method="get" class="filter-form">
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
                        
                        <button type="submit" class="button button-primary">Apply Filters</button>
                    </form>
                </div>
            </section>

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
            </section>
        </div>
    </main>

    <jsp:include page="footer.jsp"/>

    <style>
    .catalogue-header {
        margin-bottom: var(--space-xl);
    }

    .catalogue-header h1 {
        font-size: 2.5rem;
        margin-bottom: var(--space-xs);
    }

    .catalogue-header p {
        color: var(--text-secondary);
        margin-bottom: var(--space-lg);
    }

    .filter-container {
        background-color: var(--surface);
        padding: var(--space-lg);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-sm);
        margin-bottom: var(--space-xl);
    }

    .filter-form {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: var(--space-md);
        align-items: end;
    }

    .filter-group {
        display: flex;
        flex-direction: column;
        gap: var(--space-xs);
    }

    .filter-group label {
        font-weight: 500;
        color: var(--text-primary);
    }

    .filter-select,
    .search-input {
        padding: 0.75rem;
        border: 1px solid var(--border);
        border-radius: var(--radius-md);
        font-family: var(--font-sans);
        font-size: 1rem;
        transition: var(--transition);
    }

    .filter-select:focus,
    .search-input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
    }

    .book-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: var(--space-lg);
    }

    .book-card {
        background-color: var(--surface);
        border-radius: var(--radius-lg);
        overflow: hidden;
        transition: var(--transition);
        box-shadow: var(--shadow-sm);
    }

    .book-card:hover {
        transform: translateY(-4px);
        box-shadow: var(--shadow-lg);
    }

    .book-link {
        text-decoration: none;
        color: inherit;
    }

    .book-image {
        position: relative;
        padding-top: 140%;
        overflow: hidden;
    }

    .book-image img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: var(--transition);
    }

    .book-card:hover .book-image img {
        transform: scale(1.05);
    }

    .book-info {
        padding: var(--space-md);
    }

    .book-info h3 {
        font-size: 1.25rem;
        margin-bottom: var(--space-xs);
        color: var(--text-primary);
    }

    .author {
        color: var(--text-secondary);
        margin-bottom: var(--space-xs);
    }

    .price {
        font-weight: 600;
        color: var(--primary);
        margin-bottom: var(--space-md);
    }

    .no-books {
        text-align: center;
        padding: var(--space-xl);
        background-color: var(--surface);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-sm);
    }

    .no-books svg {
        color: var(--text-secondary);
        margin-bottom: var(--space-md);
    }

    .no-books h2 {
        margin-bottom: var(--space-xs);
    }

    .no-books p {
        color: var(--text-secondary);
        margin-bottom: var(--space-lg);
    }

    @media (max-width: 768px) {
        .filter-form {
            grid-template-columns: 1fr;
        }

        .book-grid {
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        }
    }
    </style>

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
