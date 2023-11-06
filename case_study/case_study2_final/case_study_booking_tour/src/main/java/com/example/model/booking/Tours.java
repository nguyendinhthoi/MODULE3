package com.example.model.booking;


public class Tours {
    private int tourId;
    private String tourName;
    private String tourDescription;
    private double tourPrice;
    private int tourAvailableSeats;
    private String startDate;
    private String endDate;
    private int employeeId;
    private String placeStart;
    private String placeEnd;
    private int tourPlacesId;

    public Tours(int tourId, String tourName, String tourDescription, double tourPrice, int tourAvailableSeats, String startDate, String endDate, int employeeId, String placeStart, String placeEnd, int tourPlacesId) {
        this.tourId = tourId;
        this.tourName = tourName;
        this.tourDescription = tourDescription;
        this.tourPrice = tourPrice;
        this.tourAvailableSeats = tourAvailableSeats;
        this.startDate = startDate;
        this.endDate = endDate;
        this.employeeId = employeeId;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlacesId = tourPlacesId;
    }

    public Tours(String tourName, double tourPrice) {
        this.tourName = tourName;
        this.tourPrice = tourPrice;
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

    public String getTourDescription() {
        return tourDescription;
    }

    public void setTourDescription(String tourDescription) {
        this.tourDescription = tourDescription;
    }

    public double getTourPrice() {
        return tourPrice;
    }

    public void setTourPrice(double tourPrice) {
        this.tourPrice = tourPrice;
    }

    public int getTourAvailableSeats() {
        return tourAvailableSeats;
    }

    public void setTourAvailableSeats(int tourAvailableSeats) {
        this.tourAvailableSeats = tourAvailableSeats;
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

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
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

    public int getTourPlacesId() {
        return tourPlacesId;
    }

    public void setTourPlacesId(int tourPlacesId) {
        this.tourPlacesId = tourPlacesId;
    }
}
