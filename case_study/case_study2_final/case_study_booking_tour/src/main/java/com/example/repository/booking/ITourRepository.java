package com.example.repository.booking;

import com.example.model.booking.Tours;

import java.sql.SQLException;
import java.util.List;

public interface ITourRepository {
    List<Tours> display() throws SQLException;
}
