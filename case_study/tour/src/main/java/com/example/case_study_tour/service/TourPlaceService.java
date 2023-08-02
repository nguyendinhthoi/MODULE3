package com.example.case_study_tour.service;

import com.example.case_study_tour.model.TourPlace;
import com.example.case_study_tour.repository.ITourPlaceRepo;
import com.example.case_study_tour.repository.TourPlaceRepo;

import java.util.List;

public class TourPlaceService implements ITourPlaceService{
    ITourPlaceRepo tourPlaceRepo = new TourPlaceRepo();
    @Override
    public List<TourPlace> displayCateP() {
        return tourPlaceRepo.displayCateP();
    }
}
