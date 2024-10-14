package com.g3app.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public List<CartItem> getItems() {
        return items;
    }

    // Add an item to the cart
    public void addItem(Book book, int quantity) {
        // Check if the book is already in the cart
        for (CartItem item : items) {
            if (item.getBook().getId() == book.getId()) {
                // If the book is already in the cart, update the quantity
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }

        // If the book is not in the cart, add it as a new item
        items.add(new CartItem(book, quantity));
    }

    // Remove an item from the cart
    public void removeItem(int bookId) {
    // Iterate through the items and remove the one that matches the given bookId
    items.removeIf(item -> item.getBook().getId() == bookId);
}


    // Get the total number of items in the cart
    public int getTotalItems() {
        int totalItems = 0;
        for (CartItem item : items) {
            totalItems += item.getQuantity();
        }
        return totalItems;
    }

    // Get the total price of all items in the cart
    public double getTotal() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getTotalPrice();
        }
        return total;
    }

    // Clear all items from the cart
    public void clear() {
        items.clear();
    }
}
