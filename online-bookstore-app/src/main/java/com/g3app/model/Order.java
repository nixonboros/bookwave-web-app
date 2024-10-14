package com.g3app.model;

import java.time.LocalDate;
import java.util.*;

public class Order {
    private int id;
    private String firstName;
    private String lastName;
    private String address;
    private String city;
    private String zip;
    private String paymentMethod;
    private double totalAmount;
    private LocalDate order_date;

    // Getters and Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getFirstName() { 
        return firstName; 
    }
    public void setFirstName(String firstName) { 
        this.firstName = firstName; 
    }

    public String getLastName() { 
        return lastName; 
    }
    public void setLastName(String lastName) { 
        this.lastName = lastName; 
    }

    public String getAddress() { 
        return address; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }

    public String getCity() { 
        return city; 
    }
    public void setCity(String city) { 
        this.city = city; 
    }

    public String getZip() { 
        return zip; 
    }
    public void setZip(String zip) { 
        this.zip = zip; 
    }

    public String getPaymentMethod() { 
        return paymentMethod; 
    }
    public void setPaymentMethod(String paymentMethod) { 
        this.paymentMethod = paymentMethod; 
    }

    public double getTotalAmount() { 
        return totalAmount; 
    }
    public void setTotalAmount(double totalAmount) { 
        this.totalAmount = totalAmount; 
    }
    
    public LocalDate getOrderDate() {
        return order_date;
    }
    
    public void setOrderDate(LocalDate order_date) {
        this.order_date = order_date;
    }
}
