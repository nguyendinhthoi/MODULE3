package com.example.service.booking;

import com.example.model.booking.Tours;
import com.example.repository.booking.ITourRepository;
import com.example.repository.booking.TourRepository;

import java.sql.SQLException;
import java.util.List;

public class TourService implements ITourService {
    ITourRepository repository = new TourRepository();
    @Override
    public List<Tours> display() throws SQLException {
        return repository.display() ;
    }
}
