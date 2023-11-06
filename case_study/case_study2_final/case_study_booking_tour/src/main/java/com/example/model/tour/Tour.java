package com.example.model.tour;

import java.util.List;

public class Tour {
//tourList.add(new Tour(id, name, desc, price, seat, s_date, e_date, id_e, s_place, e_place, id_place, image));

    private int tourId;
    private String tourName;
    private String tourDesc;
    private double tourPrice;
    private int availableSeat;
    private String startDate;
    private String endDate;
    private int employeeId;
    private String placeStart;
    private String placeEnd;
    private int tourPlaceId;
    private List<String> image;

    public Tour() {
    }

    public Tour(String tourName, String tourDesc, double tourPrice, int availableSeat, String startDate, String endDate
            , int employeeId, String placeStart, String placeEnd, int tourPlaceId, List<String> image) {
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.employeeId = employeeId;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceId = tourPlaceId;
        this.image = image;
    }

    public Tour(int tourId, String tourName, String tourDesc, double tourPrice, int availableSeat, String startDate,
                String endDate, int employeeId, String placeStart, String placeEnd, int tourPlaceId, List<String> image) {
        this.tourId = tourId;
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.employeeId = employeeId;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceId = tourPlaceId;
        this.image = image;
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

    public double getTourPrice() {
        return tourPrice;
    }

    public void setTourPrice(double tourPrice) {
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

    public int getTourPlaceId() {
        return tourPlaceId;
    }

    public void setTourPlaceId(int tourPlaceId) {
        this.tourPlaceId = tourPlaceId;
    }

    public List<String> getImage() {
        return image;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }
}
