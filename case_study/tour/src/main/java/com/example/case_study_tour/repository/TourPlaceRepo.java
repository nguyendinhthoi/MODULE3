package com.example.case_study_tour.repository;

import com.example.case_study_tour.model.TourPlace;
import com.example.case_study_tour.repository.database.Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TourPlaceRepo implements ITourPlaceRepo {
    private static final String SELECT_PLACE = "select * from tour_places";

    @Override
    public List<TourPlace> displayCateP() {
        List<TourPlace> tourPlaceList = new ArrayList<>();
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PLACE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("tour_places_id");
                String name = resultSet.getString("tour_places_name");

                tourPlaceList.add(new TourPlace(id,name));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tourPlaceList;
    }
}
