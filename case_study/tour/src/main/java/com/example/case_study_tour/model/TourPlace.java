package com.example.case_study_tour.model;

public class TourPlace {
    private int tourPlaceId;
    private String placeName;

    public TourPlace() {
    }

    public TourPlace(String placeName) {
        this.placeName = placeName;
    }

    public TourPlace(int tourPlaceId, String placeName) {
        this.tourPlaceId = tourPlaceId;
        this.placeName = placeName;
    }

    public int getTourPlaceId() {
        return tourPlaceId;
    }

    public void setTourPlaceId(int tourPlaceId) {
        this.tourPlaceId = tourPlaceId;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    @Override
    public String toString() {
        return "TourPlace{" +
                "tourPlaceId=" + tourPlaceId +
                ", placeName='" + placeName + '\'' +
                '}';
    }
}