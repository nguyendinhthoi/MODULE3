package com.example.service.booking;
import com.example.model.booking.Tours;

import java.sql.SQLException;
import java.util.List;

public interface ITourService {
    List<Tours> display() throws SQLException;
}
