<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWave - Your Online Bookstore</title>
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="nav-header.jsp" />

    <main>
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Discover Your Next Favorite Book</h1>
                <p>Explore our vast collection of books across all genres. From bestsellers to hidden gems, find your perfect read.</p>
                <div class="hero-buttons">
                    <a href="product.jsp" class="button button-primary">Browse Books</a>
                    <a href="UserSupportDashboardServlet" class="button button-secondary">Get Help</a>
                </div>
            </div>
            <div class="hero-image">
                <div class="book-spread">
                    <div class="book book-1">
                        <img src="images/book1.jpg" alt="Book 1" width="200" height="300" loading="lazy">
                    </div>
                    <div class="book book-2">
                        <img src="images/book2.jpg" alt="Book 2" width="200" height="300" loading="lazy">
                    </div>
                    <div class="book book-3">
                        <img src="images/book3.jpg" alt="Book 3" width="200" height="300" loading="lazy">
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Categories -->
        <section class="featured-categories">
            <h2>Popular Categories</h2>
            <div class="category-grid">
                <a href="product.jsp?category=fiction" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Fiction category icon">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                    </div>
                    <h3>Fiction</h3>
                    <p>Explore captivating stories and novels</p>
                </a>
                
                <a href="product.jsp?category=non-fiction" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Non-Fiction category icon">
                            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                        </svg>
                    </div>
                    <h3>Non-Fiction</h3>
                    <p>Learn from expert knowledge and research</p>
                </a>
        
                <a href="product.jsp?category=biography" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Biography category icon">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </div>
                    <h3>Biography</h3>
                    <p>Discover inspiring life stories</p>
                </a>
                
                <a href="product.jsp?category=children" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Children's Books category icon">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <h3>Children</h3>
                    <p>Nurture young minds with engaging stories</p>
                </a>
            </div>
        </section>

        <!-- Featured Books -->
        <section class="featured-books">
            <h2>Featured Books</h2>
            <div class="book-grid">
                <div class="book-card">
                    <a href="book-details.jsp?id=1" class="book-link">
                        <div class="book-image">
                            <img src="images/book1.jpg" alt="The Flowers of Evil" width="200" height="300" loading="lazy">
                        </div>
                        <div class="book-info">
                            <h3>The Flowers of Evil</h3>
                            <p class="author">By Oshimi Shuuzo</p>
                            <p class="price">$19.99</p>
                            <button class="button button-primary">View Details</button>
                        </div>
                    </a>
                </div>
                <div class="book-card">
                    <a href="book-details.jsp?id=2" class="book-link">
                        <div class="book-image">
                            <img src="images/book2.jpg" alt="The Picture of Dorian Gray" width="200" height="300" loading="lazy">
                        </div>
                        <div class="book-info">
                            <h3>The Picture of Dorian Gray</h3>
                            <p class="author">By Oscar Wilde</p>
                            <p class="price">$24.99</p>
                            <button class="button button-primary">View Details</button>
                        </div>
                    </a>
                </div>
                <div class="book-card">
                    <a href="book-details.jsp?id=3" class="book-link">
                        <div class="book-image">
                            <img src="images/book3.jpg" alt="Blood Meridian" width="200" height="300" loading="lazy">
                        </div>
                        <div class="book-info">
                            <h3>Blood Meridian</h3>
                            <p class="author">By Cormac McCarthy</p>
                            <p class="price">$15.99</p>
                            <button class="button button-primary">View Details</button>
                        </div>
                    </a>
                </div>
                <!-- Book cards will be dynamically populated -->
            </div>
            <div class="center">
                <a href="product.jsp" class="button button-secondary">View All Books</a>
            </div>
        </section>

        <!-- Why Choose Us -->
        <section class="why-choose-us">
            <h2>Why Choose BookWave?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Expert Support icon">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </div>
                    <h3>Expert Support</h3>
                    <p>Our dedicated team is here to help you find the perfect book</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Fast Delivery icon">
                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                            <polyline points="7 10 12 15 17 10"></polyline>
                            <line x1="12" y1="15" x2="12" y2="3"></line>
                        </svg>
                    </div>
                    <h3>Fast Delivery</h3>
                    <p>Quick and reliable shipping to your doorstep</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Secure Shopping icon">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                        </svg>
                    </div>
                    <h3>Secure Shopping</h3>
                    <p>Your data is protected with industry-standard security</p>
                </div>
        
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-label="Quality Guarantee icon">
                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                        </svg>
                    </div>
                    <h3>Quality Guarantee</h3>
                    <p>We ensure the highest quality for all our books</p>
                </div>
            </div>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter-section">
            <div class="newsletter-content">
                <h2>Stay Updated</h2>
                <p>Subscribe to our newsletter for the latest releases and exclusive offers</p>
                <form action="NewsletterServlet" method="post" class="newsletter-form">
                    <input type="email" name="email" placeholder="Enter your email" required>
                    <button type="submit" class="button button-primary">Subscribe</button>
                </form>
            </div>
        </section>
    </main>

    <jsp:include page="footer.jsp" />

    <script>
    // Fetch and display featured books
    document.addEventListener('DOMContentLoaded', function() {
        fetch('FeaturedBooksServlet')
            .then(response => response.json())
            .then(books => {
                const bookGrid = document.querySelector('.book-grid');
                books.forEach(book => {
                    const bookCard = createBookCard(book);
                    bookGrid.appendChild(bookCard);
                });
            })
            .catch(error => console.error('Error fetching featured books:', error));
    });

    function createBookCard(book) {
        const card = document.createElement('div');
        card.className = 'book card';
        card.innerHTML = `
            <img src="${book.imageUrl}" alt="${book.title}" class="book-img" width="200" height="300" loading="lazy">
            <div class="book-details">
                <h3>${book.title}</h3>
                <p class="author">${book.author}</p>
                <p class="price">$${book.price}</p>
                <a href="book-details.jsp?id=${book.id}" class="button button-primary">View Details</a>
            </div>
        `;
        return card;
    }
    </script>
</body>
</html>
