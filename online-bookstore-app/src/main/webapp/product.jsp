<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.g3app.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Products - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
            <h1 class="formTitle">Book Catalog</h1>
            <p>Explore our collection of books from various genres.</p>

            <div class="book-selection">
                <div class="book">
                    <a href="book-details.jsp?id=1">
                        <img src="images/book1.jpg" alt="Book 1">
                        <div class="book-details">
                            <h3>The Flowers of Evil</h3>
                            <p>Author: Oshimi Shuuzo</p>
                            <p>Price: $19.99</p>
                        </div>
                    </a>
                </div>
                <div class="book">
                    <a href="book-details.jsp?id=2">
                        <img src="images/book2.jpg" alt="Book 2">
                        <div class="book-details">
                            <h3>The Picture of Dorian Gray</h3>
                            <p>Author: Oscar Wilde</p>
                            <p>Price: $24.99</p>
                        </div>
                    </a>
                </div>
                <div class="book">
                    <a href="book-details.jsp?id=3">
                        <img src="images/book3.jpg" alt="Book 3">
                        <div class="book-details">
                            <h3>Blood Meridian</h3>
                            <p>Author: Cormac McCarthy</p>
                            <p>Price: $15.99</p>
                        </div>
                    </a>
                </div>
            </div>
    </main>
    <jsp:include page="footer.jsp"/>
</body>
</html>
