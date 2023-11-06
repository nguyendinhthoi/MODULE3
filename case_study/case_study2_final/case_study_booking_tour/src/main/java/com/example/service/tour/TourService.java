package com.example.service.tour;

import com.example.model.tour.Tour;
import com.example.model.tour.dto.TourListDTO;
import com.example.repository.tour.ITourRepo;
import com.example.repository.tour.TourRepo;

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

    @Override
    public int sumCountTour() {
        return tourRepo.sumCountTour();
    }


}
