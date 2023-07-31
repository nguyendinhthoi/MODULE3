package com.example.case_study_tour.service;

import com.example.case_study_tour.repository.ITourRepo;
import com.example.case_study_tour.repository.TourRepo;

public class TourService implements ITourService {
    ITourRepo tourRepo = new TourRepo();

}
