package com.example.case_study_tour.model.dto;

import java.util.List;

public class TourListDTO {
//    tour_name, tour_description, tour_price, tour_available_seats,
//    start_date, end_date, employee_name, place_start, place_end, tour_places_name
private int tourId;
    private String tourName;
    private String tourDesc;
    private double tourPrice;
    private int availableSeat;
    private String startDate;
    private String endDate;
    private String employeeName;
    private String placeStart;
    private String placeEnd;
    private String tourPlaceName;
    private List<String> image;

    public TourListDTO() {
    }

    public TourListDTO(String tourName, String tourDesc, double tourPrice, int availableSeat, String startDate,
                       String endDate, String employeeName, String placeStart, String placeEnd, String tourPlaceName, List<String> image) {
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.employeeName = employeeName;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceName = tourPlaceName;
        this.image = image;
    }

    public TourListDTO(int tourId, String tourName, String tourDesc, double tourPrice, int availableSeat,
                       String startDate, String endDate, String employeeName, String placeStart, String placeEnd, String tourPlaceName, List<String> image) {
        this.tourId = tourId;
        this.tourName = tourName;
        this.tourDesc = tourDesc;
        this.tourPrice = tourPrice;
        this.availableSeat = availableSeat;
        this.startDate = startDate;
        this.endDate = endDate;
        this.employeeName = employeeName;
        this.placeStart = placeStart;
        this.placeEnd = placeEnd;
        this.tourPlaceName = tourPlaceName;
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
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

    public String getTourPlaceName() {
        return tourPlaceName;
    }

    public void setTourPlaceName(String tourPlaceName) {
        this.tourPlaceName = tourPlaceName;
    }

    public List<String> getImage() {
        return image;
    }

    public void setImage(List<String> image) {
        this.image = image;
    }
}
