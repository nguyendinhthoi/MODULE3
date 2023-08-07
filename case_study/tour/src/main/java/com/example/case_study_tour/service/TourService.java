package com.example.case_study_tour.service;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.dto.TourListDTO;
import com.example.case_study_tour.repository.ITourRepo;
import com.example.case_study_tour.repository.TourRepo;

import java.util.List;

public class TourService implements ITourService {
    ITourRepo tourRepo = new TourRepo();

    @Override
    public void createTour(Tour tour) {
        tourRepo.createTour(tour);
    }


    @Override
    public void deleteTour(int id) {
        tourRepo.deleteTour(id);
    }

    @Override
    public List<TourListDTO> displayUnDel() {
        return tourRepo.displayUnDel();
    }

    @Override
    public void editTour(int id, Tour tour) {
        tourRepo.editTour(id, tour);
    }

    @Override
    public Tour findTour(int id) {
        return tourRepo.findTour(id);
    }

    @Override
    public TourListDTO findTourDTO(int id) {
        return tourRepo.findTourDTO(id);
    }

}
