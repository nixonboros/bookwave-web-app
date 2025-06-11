<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookWave - Your Online Bookstore</title>
    <link rel="icon" type="image/png" href="images/book-logo.png">
    <link rel="stylesheet" href="css/styles.css">
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
                        <img src="images/book1.jpg" alt="Book 1">
                    </div>
                    <div class="book book-2">
                        <img src="images/book2.jpg" alt="Book 2">
                    </div>
                    <div class="book book-3">
                        <img src="images/book3.jpg" alt="Book 3">
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
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                    </div>
                    <h3>Fiction</h3>
                    <p>Explore captivating stories and novels</p>
                </a>
                
                <a href="product.jsp?category=non-fiction" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                        </svg>
                    </div>
                    <h3>Non-Fiction</h3>
                    <p>Learn from expert knowledge and research</p>
                </a>
        
                <a href="product.jsp?category=biography" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
            </div>
                    <h3>Biography</h3>
                    <p>Discover inspiring life stories</p>
                </a>
                
                <a href="product.jsp?category=children" class="category-card">
                    <div class="category-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
            </div>
                    <h3>Children's Books</h3>
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
                            <img src="images/book1.jpg" alt="The Flowers of Evil">
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
                            <img src="images/book2.jpg" alt="The Picture of Dorian Gray">
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
                            <img src="images/book3.jpg" alt="Blood Meridian">
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
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </div>
                    <h3>Expert Support</h3>
                    <p>Our dedicated team is here to help you find the perfect book</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
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
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                        </svg>
                    </div>
                    <h3>Secure Shopping</h3>
                    <p>Your data is protected with industry-standard security</p>
        </div>
        
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
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

    <style>
    :root {
        --primary: #4A90E2;
        --primary-dark: #357ABD;
        --text-primary: #2C3E50;
        --text-secondary: #7F8C8D;
        --background: #F8FAFC;
        --surface: #FFFFFF;
        --radius-sm: 4px;
        --radius-md: 8px;
        --radius-lg: 16px;
        --space-xs: 0.5rem;
        --space-sm: 1rem;
        --space-md: 1.5rem;
        --space-lg: 2rem;
        --space-xl: 3rem;
        --shadow-sm: 0 2px 4px rgba(0,0,0,0.05);
        --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
        --shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
        --transition: all 0.3s ease;
    }

    body {
        font-family: 'Inter', sans-serif;
        color: var(--text-primary);
        background-color: var(--background);
        line-height: 1.6;
    }

    h1, h2, h3, h4, h5, h6 {
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
    }

    /* Hero Section */
    .hero {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: var(--space-xl);
        align-items: center;
        padding: var(--space-xl) 0;
        max-width: 1200px;
        margin: 0 auto;
        position: relative;
        overflow: hidden;
    }

    .hero::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -20%;
        width: 80%;
        height: 200%;
        background: linear-gradient(45deg, rgba(74, 144, 226, 0.1) 0%, rgba(74, 144, 226, 0) 100%);
        transform: rotate(-15deg);
        z-index: -1;
    }

    .book-spread {
        position: relative;
        width: 100%;
        height: 400px;
        perspective: 1000px;
        transform-style: preserve-3d;
    }

    .book {
        position: absolute;
        width: 200px;
        height: 300px;
        transform-style: preserve-3d;
        transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
        cursor: pointer;
    }

    .book img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: var(--radius-md);
        box-shadow: var(--shadow-lg);
        transition: var(--transition);
    }

    .book-1 {
        left: 20%;
        transform: rotateY(-30deg) translateZ(20px);
    }

    .book-2 {
        left: 40%;
        transform: rotateY(-15deg) translateZ(40px);
    }

    .book-3 {
        left: 60%;
        transform: rotateY(0deg) translateZ(60px);
    }

    .book:hover {
        transform: translateY(-15px) rotateY(-15deg) scale(1.05);
        z-index: 2;
    }

    .book:hover img {
        box-shadow: var(--shadow-lg), 0 0 20px rgba(74, 144, 226, 0.3);
    }

    .hero-content {
        padding: var(--space-lg);
    }

    .hero-content h1 {
        font-size: 3.5rem;
        line-height: 1.2;
        margin-bottom: var(--space-md);
        color: var(--text-primary);
        background: linear-gradient(45deg, var(--text-primary), var(--primary));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: fadeInUp 0.8s ease-out;
    }

    .hero-content p {
        font-size: 1.25rem;
        color: var(--text-secondary);
        margin-bottom: var(--space-lg);
        animation: fadeInUp 0.8s ease-out 0.2s backwards;
    }

    .hero-buttons {
        display: flex;
        gap: var(--space-md);
        animation: fadeInUp 0.8s ease-out 0.4s backwards;
    }

    .button {
        padding: 0.75rem 1.5rem;
        border-radius: var(--radius-md);
        font-weight: 500;
        text-decoration: none;
        transition: var(--transition);
        border: none;
        cursor: pointer;
        font-size: 1rem;
    }

    .button-primary {
        background-color: var(--primary);
        color: white;
    }

    .button-primary:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
    }

    .button-secondary {
        background-color: transparent;
        color: var(--primary);
        border: 2px solid var(--primary);
    }

    .button-secondary:hover {
        background-color: var(--primary);
        color: white;
        transform: translateY(-2px);
    }

    .hero-image {
        position: relative;
    }

    .hero-img {
        width: 100%;
        height: auto;
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-lg);
    }

    /* Featured Categories */
    .featured-categories {
        padding: var(--space-xl) 0;
        background-color: var(--background);
    }

    .featured-categories h2 {
        text-align: center;
        margin-bottom: var(--space-xl);
        font-size: 2.5rem;
        color: var(--text-primary);
    }

    .category-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: var(--space-lg);
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 var(--space-lg);
    }

    .category-card {
        background-color: var(--surface);
        padding: var(--space-lg);
        border-radius: var(--radius-lg);
        text-decoration: none;
        color: var(--text-primary);
        transition: var(--transition);
        box-shadow: var(--shadow-sm);
        position: relative;
        overflow: hidden;
    }

    .category-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(45deg, rgba(74, 144, 226, 0.1) 0%, rgba(74, 144, 226, 0) 100%);
        opacity: 0;
        transition: var(--transition);
    }

    .category-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-lg);
    }

    .category-card:hover::before {
        opacity: 1;
    }

    .category-icon {
        width: 56px;
        height: 56px;
        background-color: var(--primary);
        border-radius: var(--radius-md);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: var(--space-md);
        color: white;
        transition: var(--transition);
    }

    .category-card:hover .category-icon {
        transform: scale(1.1) rotate(5deg);
    }

    .category-card h3 {
        margin-bottom: var(--space-xs);
    }

    .category-card p {
        color: var(--text-secondary);
        margin: 0;
    }

    /* Featured Books */
    .featured-books {
        padding: var(--space-xl) 0;
        text-align: center;
        background: linear-gradient(to bottom, var(--background), white);
    }

    .featured-books h2 {
        text-align: center;
        margin-bottom: var(--space-xl);
        font-size: 2.5rem;
        color: var(--text-primary);
    }

    .book-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: var(--space-lg);
        max-width: 1200px;
        margin: 0 auto;
        padding: var(--space-lg);
    }

    .book-card {
        background: var(--surface);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-sm);
        overflow: hidden;
        transition: var(--transition);
        position: relative;
    }

    .book-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-lg);
    }

    .book-image {
        width: 100%;
        aspect-ratio: 3/4;
        overflow: hidden;
        position: relative;
    }

    .book-image img {
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
        text-align: center;
    }

    .book-info h3 {
        font-size: 1.25rem;
        margin-bottom: var(--space-xs);
        color: var(--text-primary);
    }

    .book-info .author {
        color: var(--text-secondary);
        margin-bottom: var(--space-xs);
    }

    .book-info .price {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--primary);
        margin-bottom: var(--space-md);
    }

    .book-info a, .book-info h3, .book-info .author, .book-info .price {
        color: var(--text-primary);
        text-decoration: none;
    }

    .book-info a:hover {
        color: var(--primary);
        text-decoration: underline;
    }

    .center {
        text-align: center;
        margin-top: var(--space-xl);
    }

    /* Why Choose Us */
    .why-choose-us {
        padding: var(--space-xl) 0;
        background-color: var(--background);
        position: relative;
        overflow: hidden;
    }

    .why-choose-us::before {
        content: '';
        position: absolute;
        bottom: -50%;
        left: -20%;
        width: 80%;
        height: 200%;
        background: linear-gradient(45deg, rgba(74, 144, 226, 0.1) 0%, rgba(74, 144, 226, 0) 100%);
        transform: rotate(15deg);
        z-index: 0;
    }

    .features-grid {
        position: relative;
        z-index: 1;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: var(--space-lg);
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 var(--space-lg);
    }

    .feature-card {
        background-color: var(--surface);
        padding: var(--space-lg);
        border-radius: var(--radius-lg);
        text-align: center;
        box-shadow: var(--shadow-sm);
        transition: var(--transition);
    }

    .feature-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-lg);
    }

    .feature-icon {
        width: 56px;
        height: 56px;
        background-color: var(--primary);
        border-radius: var(--radius-md);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto var(--space-md);
        color: white;
        transition: var(--transition);
    }

    .feature-card:hover .feature-icon {
        transform: scale(1.1) rotate(5deg);
    }

    .feature-card h3 {
        margin-bottom: var(--space-xs);
    }

    .feature-card p {
        color: var(--text-secondary);
        margin: 0;
    }

    /* Newsletter Section */
    .newsletter-section {
        padding: var(--space-xl) 0;
        background: linear-gradient(45deg, var(--primary), var(--primary-dark));
        color: white;
        position: relative;
        overflow: hidden;
    }

    .newsletter-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('data:image/svg+xml,<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><circle cx="2" cy="2" r="1" fill="rgba(255,255,255,0.1)"/></svg>');
        opacity: 0.1;
    }

    .newsletter-content {
        position: relative;
        z-index: 1;
        max-width: 600px;
        margin: 0 auto;
        text-align: center;
        padding: 0 var(--space-lg);
    }

    .newsletter-content h2 {
        margin-bottom: var(--space-md);
    }

    .newsletter-content p {
        margin-bottom: var(--space-lg);
        color: #fff;
        font-weight: 500;
        font-size: 1.1rem;
        text-shadow: 0 2px 8px rgba(0,0,0,0.10);
    }

    .newsletter-form {
        display: flex;
        gap: var(--space-sm);
        margin-top: var(--space-lg);
    }

    .newsletter-form input {
        flex: 1;
        padding: 1rem;
        border: none;
        border-radius: var(--radius-md);
        font-family: var(--font-sans);
        font-size: 1rem;
        box-shadow: var(--shadow-sm);
    }

    .newsletter-form button {
        padding: 1rem 2rem;
        background-color: white;
        color: var(--primary);
        border: none;
        border-radius: var(--radius-md);
        font-weight: 500;
        cursor: pointer;
        transition: var(--transition);
    }

    .newsletter-form button:hover {
        background-color: var(--background);
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
    }

    /* Animations */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .hero {
            grid-template-columns: 1fr;
            text-align: center;
            padding: var(--space-lg) var(--space-md);
        }

        .hero-content h1 {
            font-size: 2.5rem;
        }

        .hero-buttons {
            justify-content: center;
        }

        .book-spread {
            height: 300px;
            margin-top: var(--space-lg);
        }

        .newsletter-form {
            flex-direction: column;
        }

        .newsletter-form button {
            width: 100%;
        }

        .category-grid,
        .book-grid,
        .features-grid {
            grid-template-columns: 1fr;
            padding: 0 var(--space-md);
        }
    }

    .why-choose-us h2 {
        text-align: center !important;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: var(--space-xl);
        font-size: 2.5rem;
        color: var(--text-primary);
        display: block;
        width: 100%;
    }
    </style>

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
            <img src="${book.imageUrl}" alt="${book.title}" class="book-img">
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
