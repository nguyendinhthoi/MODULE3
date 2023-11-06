package com.example.service.tour;

import com.example.model.tour.TourPlace;
import com.example.repository.tour.ITourPlaceRepo;
import com.example.repository.tour.TourPlaceRepo;

import java.util.List;

public class TourPlaceService implements ITourPlaceService{
    ITourPlaceRepo tourPlaceRepo = new TourPlaceRepo();
    @Override
    public List<TourPlace> displayCateP() {
        return tourPlaceRepo.displayCateP();
    }
}
