package com.example.service.tour;

import com.example.model.tour.Tour;
import com.example.model.tour.dto.TourListDTO;

import java.util.List;

public interface ITourService {


    void createTour(Tour tour);


    void deleteTour(int id);

    List<TourListDTO> displayUnDel();


    void editTour(int id, Tour tour);

    Tour findTour(int id);

    TourListDTO findTourDTO(int id);

    int sumCountTour();
}
