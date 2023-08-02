package com.example.case_study_tour.service;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.TourListDTO;
import com.example.case_study_tour.model.TourPlace;
import com.example.case_study_tour.repository.ITourRepo;
import com.example.case_study_tour.repository.TourRepo;

import java.util.List;

public class TourService implements ITourService {
    ITourRepo tourRepo = new TourRepo();

    @Override
    public List<Tour> display() {
        return tourRepo.display();
    }

    @Override
    public List<TourListDTO> displayDTO() {
        return tourRepo.displayDTO();
    }

    @Override
    public void createTour(TourListDTO tourListDTO) {
        tourRepo.createTour(tourListDTO);
    }
}
