package com.example.case_study_tour.service;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.TourListDTO;
import com.example.case_study_tour.model.TourPlace;

import java.util.List;

public interface ITourService {

    List<Tour> display();

    List<TourListDTO> displayDTO();


    void createTour(TourListDTO tourListDTO);
}
