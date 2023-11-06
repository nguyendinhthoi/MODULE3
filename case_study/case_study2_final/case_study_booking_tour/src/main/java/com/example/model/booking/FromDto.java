package com.example.model.booking;


public class FromDto {
    private String tourName;
    private String startDate;
    private String endDate;
    private int quantity;
    private String price;
    private String sumPrice;
    private String[] img;

    public FromDto(String tourName, String startDate, String endDate, int quantity, String price, String sumPrice, String[] img) {
        this.tourName = tourName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
        this.price = price;
        this.sumPrice = sumPrice;
        this.img = img;
    }

    public FromDto() {
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(String sumPrice) {
        this.sumPrice = sumPrice;
    }

    public String[] getImg() {
        return img;
    }

    public void setImg(String[] img) {
        this.img = img;
    }
}
