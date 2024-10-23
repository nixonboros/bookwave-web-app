package com.g3app.model;

import java.util.Date;

public class Notification {
    private int notificationId;
    private String userEmail;
    private int ticketId;
    private String message;
    private String status;
    private Date dateSent;

    // Constructor
    public Notification(int notificationId, String userEmail, int ticketId, String message, String status, Date dateSent) {
        this.notificationId = notificationId;
        this.userEmail = userEmail;
        this.ticketId = ticketId;
        this.message = message;
        this.status = status;
        this.dateSent = dateSent;
    }

    // Getters
    public int getNotificationId() {
        return notificationId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public int getTicketId() {
        return ticketId;
    }

    public String getMessage() {
        return message;
    }

    public String getStatus() {
        return status;
    }

    public Date getDateSent() {
        return dateSent;
    }

    // Setters
    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setDateSent(Date dateSent) {
        this.dateSent = dateSent;
    }
}

