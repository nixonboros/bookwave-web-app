package com.g3app.model;

public class OrderItem {
    private int id;          // Unique ID for the order item
    private int orderId;     // Reference to the order
    private int bookId;      // Reference to the book
    private int quantity;     // Quantity of the book ordered

    // Default constructor
    public OrderItem() {
    }

    // Parameterized constructor
    public OrderItem(int id, int orderId, int bookId, int quantity) {
        this.id = id;
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
