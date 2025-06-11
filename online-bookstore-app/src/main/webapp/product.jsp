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
    <link rel="stylesheet" href="css/styles.css">
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

    <style>
    .catalogue-boundary {
        max-width: 1200px;
        margin: 2rem auto 0 auto;
        padding: 0 1.5rem 2rem 1.5rem;
    }
    .catalogue-header-card {
        background: #fff;
        border-radius: 1.25rem;
        box-shadow: 0 2px 16px 0 rgba(60,72,88,0.10);
        padding: 2.5rem 2rem 2rem 2rem;
        margin-bottom: 2.5rem;
    }
    .catalogue-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        color: var(--text-primary, #1e293b);
        text-align: left;
    }
    .catalogue-desc {
        color: var(--text-secondary, #64748b);
        margin-bottom: 2rem;
        text-align: left;
    }
    .catalogue-filter-form {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 180px;
        gap: 1.5rem;
        align-items: end;
        width: 100%;
    }
    .filter-group {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    .filter-btn-group {
        align-self: end;
    }
    .filter-select,
    .search-input {
        height: 48px;
        padding: 0.75rem 1rem;
        border-radius: 0.75rem;
        border: 1px solid var(--border, #e2e8f0);
        font-size: 1rem;
        background: #f8fafc;
        transition: border-color 0.2s;
    }
    .filter-select:focus,
    .search-input:focus {
        border-color: var(--primary, #2563eb);
        outline: none;
    }
    .button.button-primary {
        height: 48px;
        width: 100%;
        font-size: 1rem;
        border-radius: 0.75rem;
        font-weight: 600;
        padding: 0;
    }
    .book-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 2rem;
    }
    .book-card {
        background-color: #fff;
        border-radius: 1.25rem;
        box-shadow: 0 2px 16px 0 rgba(60,72,88,0.10);
        display: flex;
        flex-direction: column;
        align-items: stretch;
        height: 600px;
        transition: box-shadow 0.2s, transform 0.2s;
        overflow: hidden;
    }
    .book-card:hover {
        transform: translateY(-4px) scale(1.02);
        box-shadow: 0 6px 24px 0 rgba(60,72,88,0.18);
    }
    .book-link {
        display: flex;
        flex-direction: column;
        height: 100%;
        text-decoration: none;
        color: inherit;
    }
    .book-image {
        width: 100%;
        height: 400px;
        background: #f8fafc;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
    .book-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
    }
    .book-info {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 1rem;
        text-align: center;
        background: #fff;
    }
    .book-info h3 {
        font-size: 1.1rem;
        font-weight: 600;
        margin: 0.5rem 0 0.25rem 0;
        color: #1e293b;
        min-height: 2.5em;
        line-height: 1.2;
    }
    .author {
        color: #64748b;
        font-size: 0.95rem;
        margin-bottom: 0.5rem;
    }
    .price {
        font-weight: 700;
        color: #2563eb;
        font-size: 1.05rem;
        margin-bottom: 1rem;
    }
    .book-info .button.button-primary {
        margin-top: auto;
        width: 100%;
        padding: 0.75rem 1.5rem;
        border-radius: 0.75rem;
        font-size: 1rem;
        font-weight: 600;
        background: #ff6b6b;
        color: #fff;
        border: none;
        transition: background 0.2s;
    }
    .book-info .button.button-primary:hover {
        background: #fa5252;
    }
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        margin: 2rem 0 0 0;
        font-size: 1.25rem;
        color: var(--text-secondary, #64748b);
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
    @media (max-width: 1100px) {
        .book-grid {
            grid-template-columns: repeat(2, 1fr);
        }
        .catalogue-filter-form {
            grid-template-columns: 1fr 1fr;
        }
    }
    @media (max-width: 700px) {
        .book-grid {
            grid-template-columns: 1fr;
        }
        .catalogue-filter-form {
            grid-template-columns: 1fr;
        }
    }
    .pagination-btn {
        background: #fff;
        border: 1px solid var(--border, #e2e8f0);
        color: var(--text-secondary, #64748b);
        border-radius: 0.5rem;
        font-size: 1.25rem;
        width: 2.5rem;
        height: 2.5rem;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: background 0.2s, border-color 0.2s;
        box-shadow: 0 1px 4px 0 rgba(60,72,88,0.06);
    }
    .pagination-btn:hover, .pagination-btn:focus {
        background: var(--primary, #2563eb);
        color: #fff;
        border-color: var(--primary, #2563eb);
        outline: none;
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
