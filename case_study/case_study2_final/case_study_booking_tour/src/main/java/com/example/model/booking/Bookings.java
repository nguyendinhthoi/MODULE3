package com.example.model.booking;


public class Bookings {
    private int bookingId;
    private String bookingDate;
    private int quantity;
    private double price;
    private String customerId;
    private int tourId;
    private int idDelete;
    private int status ;

    public Bookings(int bookingId, String bookingDate, int quantity, double price, String customerId, int tourId, int idDelete, int status) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.quantity = quantity;
        this.price = price;
        this.customerId = customerId;
        this.tourId = tourId;
        this.idDelete = idDelete;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getIdDelete() {
        return idDelete;
    }

    public void setIdDelete(int idDelete) {
        this.idDelete = idDelete;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
