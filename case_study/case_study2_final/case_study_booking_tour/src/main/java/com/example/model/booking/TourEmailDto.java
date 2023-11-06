package com.example.model.booking;


public class TourEmailDto {
    private String tourName;
    private String startDate;
    private String endDate;
    private int time;
    private int quantity;
    private String customerName;
    private String phone;
    private String price;
    private String email;

    public TourEmailDto() {
    }

    public TourEmailDto(String tourName, String startDate, String endDate, int time, int quantity, String customerName, String phone, String price, String email) {
        this.tourName = tourName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.time = time;
        this.quantity = quantity;
        this.customerName = customerName;
        this.phone = phone;
        this.price = price;
        this.email = email;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
