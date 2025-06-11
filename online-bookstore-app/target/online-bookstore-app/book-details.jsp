<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details - BookWave</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav-header.jsp"/>
    
    <main>
        <div class="container">
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
            
            <div class="breadcrumb">
                <a href="index.jsp">Home</a>
                <span class="separator">/</span>
                <a href="product.jsp">Books</a>
                <span class="separator">/</span>
                <span class="current"><%= title %></span>
            </div>

            <%
                if (book != null) {
            %>
                <div class="book-details-container">
                    <div class="book-image-section">
                        <img src="<%= book.getImgUrl() %>" alt="<%= book.getTitle() %>" class="book-cover">
                        <div class="book-actions">
                            <button class="button button-secondary share-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="18" cy="5" r="3"></circle>
                                    <circle cx="6" cy="12" r="3"></circle>
                                    <circle cx="18" cy="19" r="3"></circle>
                                    <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
                                    <line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line>
                                </svg>
                                Share
                            </button>
                            <button class="button button-secondary wishlist-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                                </svg>
                                Add to Wishlist
                            </button>
                        </div>
                    </div>

                    <div class="book-info-section">
                        <h1><%= book.getTitle() %></h1>
                        <p class="author">By <%= book.getAuthor() %></p>
                        
                        <div class="book-meta">
                            <div class="meta-item">
                                <span class="meta-label">Format</span>
                                <span class="meta-value"><%= book.getMedium() %></span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">Genre</span>
                                <span class="meta-value"><%= book.getGenre() %></span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">Price</span>
                                <span class="meta-value price">$<%= book.getPrice() %></span>
                            </div>
                        </div>

                        <div class="book-description">
                            <h2>Description</h2>
                            <p><%= book.getDescription() %></p>
                        </div>

                        <form action="AddToCartServlet" method="POST" class="add-to-cart-form">
                            <input type="hidden" name="bookId" value="<%= book.getId() %>">
                            <div class="quantity-selector">
                                <label for="quantity">Quantity</label>
                                <div class="quantity-input">
                                    <button type="button" class="quantity-btn" onclick="decrementQuantity()">-</button>
                                    <input type="number" id="quantity" name="quantity" value="1" min="1" required>
                                    <button type="button" class="quantity-btn" onclick="incrementQuantity()">+</button>
                                </div>
                            </div>
                            <button type="submit" class="button button-primary add-to-cart-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="9" cy="21" r="1"></circle>
                                    <circle cx="20" cy="21" r="1"></circle>
                                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                                </svg>
                                Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            <%
                } else {
            %>
                <div class="error-message">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="8" x2="12" y2="12"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16"></line>
                    </svg>
                    <h2>Book Not Found</h2>
                    <p>We couldn't find the book you're looking for.</p>
                    <a href="product.jsp" class="button button-primary">Browse Books</a>
                </div>
            <%
                }
            %>
        </div>
    </main>

    <jsp:include page="footer.jsp"/>

    <style>
    .breadcrumb {
        display: flex;
        align-items: center;
        gap: var(--space-xs);
        margin-bottom: var(--space-lg);
        color: var(--text-secondary);
    }

    .breadcrumb a {
        color: var(--text-secondary);
        text-decoration: none;
        transition: var(--transition);
    }

    .breadcrumb a:hover {
        color: var(--primary);
    }

    .separator {
        color: var(--border);
    }

    .current {
        color: var(--text-primary);
    }

    .book-details-container {
        display: grid;
        grid-template-columns: 1fr 1.5fr;
        gap: var(--space-xl);
        margin-bottom: var(--space-xl);
    }

    .book-image-section {
        position: sticky;
        top: var(--space-xl);
    }

    .book-cover {
        width: 100%;
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-lg);
        margin-bottom: var(--space-md);
    }

    .book-actions {
        display: flex;
        gap: var(--space-sm);
    }

    .share-button,
    .wishlist-button {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: var(--space-xs);
    }

    .book-info-section h1 {
        font-size: 2.5rem;
        margin-bottom: var(--space-xs);
    }

    .author {
        font-size: 1.25rem;
        color: var(--text-secondary);
        margin-bottom: var(--space-lg);
    }

    .book-meta {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: var(--space-md);
        margin-bottom: var(--space-lg);
        padding: var(--space-md);
        background-color: var(--background);
        border-radius: var(--radius-lg);
    }

    .meta-item {
        display: flex;
        flex-direction: column;
        gap: var(--space-xs);
    }

    .meta-label {
        font-size: 0.875rem;
        color: var(--text-secondary);
    }

    .meta-value {
        font-weight: 500;
    }

    .meta-value.price {
        color: var(--primary);
        font-size: 1.25rem;
    }

    .book-description {
        margin-bottom: var(--space-xl);
    }

    .book-description h2 {
        font-size: 1.5rem;
        margin-bottom: var(--space-md);
    }

    .book-description p {
        color: var(--text-secondary);
        line-height: 1.6;
    }

    .add-to-cart-form {
        display: flex;
        flex-direction: column;
        gap: var(--space-md);
    }

    .quantity-selector {
        display: flex;
        flex-direction: column;
        gap: var(--space-xs);
    }

    .quantity-selector label {
        font-weight: 500;
    }

    .quantity-input {
        display: flex;
        align-items: center;
        gap: var(--space-xs);
    }

    .quantity-btn {
        width: 36px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--background);
        border: 1px solid var(--border);
        border-radius: var(--radius-md);
        cursor: pointer;
        transition: var(--transition);
    }

    .quantity-btn:hover {
        background-color: var(--border);
    }

    .quantity-input input {
        width: 60px;
        text-align: center;
        padding: 0.5rem;
        border: 1px solid var(--border);
        border-radius: var(--radius-md);
        font-family: var(--font-sans);
    }

    .add-to-cart-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: var(--space-xs);
    }

    .error-message {
        text-align: center;
        padding: var(--space-xl);
        background-color: var(--surface);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-sm);
    }

    .error-message svg {
        color: var(--text-secondary);
        margin-bottom: var(--space-md);
    }

    .error-message h2 {
        margin-bottom: var(--space-xs);
    }

    .error-message p {
        color: var(--text-secondary);
        margin-bottom: var(--space-lg);
    }

    @media (max-width: 768px) {
        .book-details-container {
            grid-template-columns: 1fr;
        }

        .book-image-section {
            position: static;
        }

        .book-meta {
            grid-template-columns: 1fr;
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
