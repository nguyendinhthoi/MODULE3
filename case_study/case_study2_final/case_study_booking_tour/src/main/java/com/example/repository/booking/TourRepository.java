package com.example.repository.booking;

import com.example.model.booking.Tours;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TourRepository implements ITourRepository{
    public static final String DISPLAY = "select*from tours ";
    @Override
    public List<Tours> display() throws SQLException {
        Connection connection = BaseRepository.getConnection();
        ArrayList<Tours> arraylist = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(DISPLAY);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int tourId = resultSet.getInt("tour_id");
            String tourName = resultSet.getString("tour_name");
            String tourDescription = resultSet.getString("tour_description");
            double tourPrice = resultSet.getDouble("tour_price");
            int tourAvailableSeats = resultSet.getInt("tour_available_seats");
            String startDate =resultSet.getString("start_date");
            String endDate =resultSet.getString("end_date");
            int employeeId=resultSet.getInt("employee_id");
            String placeStart =resultSet.getString("place_start");
            String placeEnd = resultSet.getString("place_end");
            int tourPlacesId = resultSet.getInt("tour_places_id");

            arraylist.add(new Tours(tourId,tourName,tourDescription,tourPrice,tourAvailableSeats,startDate,endDate,employeeId,placeStart,placeEnd,tourPlacesId));
        }
        return arraylist;
    }
}
