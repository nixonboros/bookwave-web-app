<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.*" %>
<%@ page import="java.sql.*" %>
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details - BookWave</title>
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <div class="book-details-boundary">
            <div class="book-details-card">
                <nav class="breadcrumb">
                    <a href="index.jsp">Home</a>
                    <span class="separator">/</span>
                    <a href="product.jsp">Books</a>
                    <span class="separator">/</span>
                    <span class="current"><%= title %></span>
                </nav>
                <div class="book-details-content">
                    <div class="book-details-cover">
                        <img src="<%= book != null ? book.getImgUrl() : "images/book-logo.png" %>" alt="<%= book != null ? book.getTitle() : "Book Cover" %>" class="book-cover-img">
                    </div>
                    <div class="book-details-info">
                        <h1 class="book-title"><%= book != null ? book.getTitle() : "Book not found." %></h1>
                        <p class="author">By <%= book != null ? book.getAuthor() : "Unknown" %></p>
                        <div class="book-meta">
                            <span class="meta-label">Format:</span> <span class="meta-value"><%= book != null ? book.getMedium() : "-" %></span><br>
                            <span class="meta-label">Genre:</span> <span class="meta-value"><%= book != null ? book.getGenre() : "-" %></span><br>
                            <span class="meta-label">Price:</span> <span class="meta-value price">$<%= book != null ? book.getPrice() : "-" %></span>
                        </div>
                        <div class="book-description">
                            <h2 class="desc-heading">Description</h2>
                            <p><%= book != null ? book.getDescription() : "No description available." %></p>
                        </div>
                        <form action="AddToCartServlet" method="POST" class="add-to-cart-form">
                            <input type="hidden" name="bookId" value="<%= book != null ? book.getId() : "" %>">
                            <div class="quantity-row">
                                <label for="quantity">Quantity</label>
                                <div class="quantity-selector">
                                    <button type="button" class="quantity-btn" onclick="decrementQuantity()">-</button>
                                    <input type="number" id="quantity" name="quantity" value="1" min="1" required>
                                    <button type="button" class="quantity-btn" onclick="incrementQuantity()">+</button>
                                </div>
                            </div>
                            <button type="submit" class="button button-primary add-to-cart-btn">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp"/>

    <style>
    .book-details-boundary {
        max-width: 900px;
        margin: 2rem auto 0 auto;
        padding: 0 1.5rem 2rem 1.5rem;
    }
    .book-details-card {
        background: #fff;
        border-radius: 1.25rem;
        box-shadow: 0 2px 16px 0 rgba(60,72,88,0.10);
        padding: 2.5rem 2.5rem 2rem 2.5rem;
        display: flex;
        flex-direction: column;
        gap: 2rem;
    }
    .breadcrumb {
        font-size: 1rem;
        color: var(--text-secondary, #64748b);
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }
    .breadcrumb a {
        color: var(--primary, #2563eb);
        text-decoration: none;
        margin-right: 0.25rem;
    }
    .breadcrumb .separator {
        color: var(--border, #e2e8f0);
        margin: 0 0.25rem;
    }
    .breadcrumb .current {
        color: var(--text-primary, #1e293b);
        font-weight: 600;
    }
    .book-details-content {
        display: flex;
        gap: 2.5rem;
        align-items: stretch;
        height: 100%;
    }
    .book-details-info {
        flex: 1 1 0;
        display: flex;
        flex-direction: column;
        height: 100%;
        justify-content: space-between;
        align-items: flex-start;
    }
    .book-title {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        color: var(--text-primary, #1e293b);
    }
    .author {
        color: var(--text-secondary, #64748b);
        margin-bottom: 0.5rem;
    }
    .book-meta {
        font-size: 1.1rem;
        margin-bottom: 1.5rem;
    }
    .meta-label {
        font-weight: 600;
        color: var(--text-secondary, #64748b);
    }
    .meta-value.price {
        color: var(--primary, #2563eb);
        font-weight: 700;
    }
    .book-description {
        margin-top: 0.5rem;
        font-size: 1rem;
        color: var(--text-primary, #1e293b);
        margin-bottom: 1.5rem;
    }
    .desc-heading {
        font-size: 1.25rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: var(--text-primary, #1e293b);
    }
    .add-to-cart-form {
        width: 100%;
        margin-top: auto;
    }
    .quantity-row {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 0.5rem;
    }
    .quantity-selector {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        background: #f8fafc;
        border-radius: 999px;
        padding: 0.25rem 0.5rem;
    }
    .quantity-btn {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        border: 1px solid var(--border, #e2e8f0);
        background: #f8fafc;
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--primary, #2563eb);
        cursor: pointer;
        transition: background 0.2s, color 0.2s;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .quantity-btn:hover {
        background: var(--primary, #2563eb);
        color: #fff;
    }
    .add-to-cart-btn {
        height: 48px;
        width: 100%;
        font-size: 1rem;
        border-radius: 0.75rem;
        font-weight: 600;
        padding: 0;
        margin-top: 0.5rem;
    }
    .book-details-cover {
        flex: 0 0 340px;
        display: flex;
        align-items: stretch;
        justify-content: center;
        height: 100%;
    }
    .book-cover-img {
        height: 100%;
        width: auto;
        max-width: 100%;
        object-fit: contain;
        border-radius: 1rem;
        box-shadow: 0 8px 32px 0 rgba(60,72,88,0.18);
        background: #f8fafc;
    }
    @media (max-width: 900px) {
        .book-details-content {
            flex-direction: column;
            align-items: stretch;
        }
        .book-details-cover {
            justify-content: flex-start;
            margin-bottom: 2rem;
        }
        .book-details-card {
            padding: 1.5rem 0.5rem;
        }
    }
    </style>

    <script>
    function incrementQuantity() {
        const input = document.getElementById('quantity');
        input.value = parseInt(input.value) + 1;
    }

    function decrementQuantity() {
        const input = document.getElementById('quantity');
        const newValue = parseInt(input.value) - 1;
        if (newValue >= 1) {
            input.value = newValue;
        }
    }

    // Share functionality
    document.querySelector('.share-button').addEventListener('click', function() {
        if (navigator.share) {
            navigator.share({
                title: '<%= book != null ? book.getTitle() : "" %>',
                text: 'Check out this book on BookWave!',
                url: window.location.href
            });
        } else {
            // Fallback for browsers that don't support the Web Share API
            const dummy = document.createElement('input');
            document.body.appendChild(dummy);
            dummy.value = window.location.href;
            dummy.select();
            document.execCommand('copy');
            document.body.removeChild(dummy);
            alert('Link copied to clipboard!');
        }
    });
    </script>
</body>
</html>
