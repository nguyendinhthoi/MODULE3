package com.example.model.booking;

import java.util.List;

public class BookingDto {
    private int customerId;
    private String tourName;
    private double tourPrice;
    private int  quantity;
    private double tourSumPrice;
    private int status ;
    private int tourId;
    private String[] img ;

    public BookingDto(int customerId, String tourName, double tourPrice, int quantity, double tourSumPrice, int status, int tourId, String[] img) {
        this.customerId = customerId;
        this.tourName = tourName;
        this.tourPrice = tourPrice;
        this.quantity = quantity;
        this.tourSumPrice = tourSumPrice;
        this.status = status;
        this.tourId = tourId;
        this.img = img;
    }

    public BookingDto() {
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public double getTourPrice() {
        return tourPrice;
    }

    public void setTourPrice(double tourPrice) {
        this.tourPrice = tourPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTourSumPrice() {
        return tourSumPrice;
    }

    public void setTourSumPrice(double tourSumPrice) {
        this.tourSumPrice = tourSumPrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String[] getImg() {
        return img;
    }

    public void setImg(String[] img) {
        this.img = img;
    }
}
