package com.example.case_study_tour.model;

public class Tour {
    private int tourId;
    private String tourName;
    private String tourDesc;
    private String tourPrice;
    private int availableSeat;
    private String startDate;
    private String endDate;
    private String placeStart;
    private String placeEnd;
    private int tourPlaceId;
    private int employeeId;

    public Tour() {
    }

    public Tour(String tourName, String tourDesc, String tourPrice, int availableSeat, String startDate, String endDate, String placeStart, String placeEnd, int tourPlaceId, int employeeId) {
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceId = tourPlaceId;
        this.employeeId = employeeId;
    }

    public Tour(int tourId, String tourName, String tourDesc, String tourPrice, int availableSeat, String startDate, String endDate, String placeStart, String placeEnd, int tourPlaceId, int employeeId) {
        this.tourId = tourId;
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceId = tourPlaceId;
        this.employeeId = employeeId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getTourDesc() {
        return tourDesc;
    }

    public void setTourDesc(String tourDesc) {
        this.tourDesc = tourDesc;
    }

    public String getTourPrice() {
        return tourPrice;
    }

    public void setTourPrice(String tourPrice) {
        this.tourPrice = tourPrice;
    }

    public int getAvailableSeat() {
        return availableSeat;
    }

    public void setAvailableSeat(int availableSeat) {
        this.availableSeat = availableSeat;
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

    public String getPlaceStart() {
        return placeStart;
    }

    public void setPlaceStart(String placeStart) {
        this.placeStart = placeStart;
    }

    public String getPlaceEnd() {
        return placeEnd;
    }

    public void setPlaceEnd(String placeEnd) {
        this.placeEnd = placeEnd;
    }

    public int getTourPlaceId() {
        return tourPlaceId;
    }

    public void setTourPlaceId(int tourPlaceId) {
        this.tourPlaceId = tourPlaceId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "Tour{" +
                "tourId=" + tourId +
                ", tourName='" + tourName + '\'' +
                ", tourDesc='" + tourDesc + '\'' +
                ", tourPrice='" + tourPrice + '\'' +
                ", availableSeat=" + availableSeat +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", placeStart='" + placeStart + '\'' +
                ", placeEnd='" + placeEnd + '\'' +
                ", tourPlaceId=" + tourPlaceId +
                ", employeeId=" + employeeId +
                '}';
    }
}
