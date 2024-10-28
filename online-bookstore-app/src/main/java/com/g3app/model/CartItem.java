package com.g3app.model;

public class CartItem {
    private Book book;
    private int quantity;
    private int productId; 
    private double price; 

    public CartItem(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
        this.productId = book.getId(); 
        this.price = book.getPrice();
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
        this.productId = book.getId();
        this.price = book.getPrice();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public double getPrice() {
        return price;
    }

    // Calculate the total price for this item (price * quantity)
    public double getTotalPrice() {
        return price * quantity;
    }
}
