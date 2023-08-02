package com.example.case_study_tour.repository;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.TourListDTO;
import com.example.case_study_tour.repository.database.Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TourRepo implements ITourRepo {
    private static final String SELECT = "select * from tours";
    public static final String SELECT_DTO = "select tour_id, tour_name, tour_description, tour_price, tour_available_seats, " +
            "start_date, end_date, employee_name, place_start, place_end, tour_places_name, image " +
            "from tours as t " +
            "join employees as ee " +
            "on t.employee_id = ee.employee_id " +
            "join tour_places as tp " +
            "on t.tour_places_id = tp.tour_places_id;";
    private static final String CREATE = "INSERT INTO `travel_tour_booking`.`tours` (`tour_name`, `tour_description`" +
            ", `tour_price`, `tour_available_seats`, `start_date`, `end_date`, `employee_id`, `place_start`, `place_end`" +
            ", `tour_places_id` , `image`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";


    @Override
    public List<Tour> display() {
        Connection connection = Base.getConnection();
        List<Tour> tourList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("tour_id");
                String name = resultSet.getString("tour_name");
                String desc = resultSet.getString("tour_description");
                double price = resultSet.getDouble(" tour_price");
                int seat = resultSet.getInt(" tour_available_seats");
                String s_date = resultSet.getString("start_date");
                String e_date = resultSet.getString("end_date");
                int id_e = resultSet.getInt("employee_id");
                String s_place = resultSet.getString("place_start");
                String e_place = resultSet.getString("place_end");
                int id_place = resultSet.getInt("tour_places_id");
                String image = resultSet.getString("image");

                tourList.add(new Tour(id, name, desc, price, seat, s_date, e_date, id_e, s_place, e_place, id_place, image));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tourList;
    }

    @Override
    public List<TourListDTO> displayDTO() {
        Connection connection = Base.getConnection();
        List<TourListDTO> tourList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DTO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("tour_id");
                String name = resultSet.getString("tour_name");
                String desc = resultSet.getString("tour_description");
                double price = resultSet.getDouble("tour_price");
                int seat = resultSet.getInt("tour_available_seats");
                String s_date = resultSet.getString("start_date");
                String e_date = resultSet.getString("end_date");
                String employee_name = resultSet.getString("employee_name");
                String s_place = resultSet.getString("place_start");
                String e_place = resultSet.getString("place_end");
                String tour_places_name = resultSet.getString("tour_places_name");
                String image = resultSet.getString("image");

                tourList.add(new TourListDTO(id, name, desc, price, seat, s_date, e_date, employee_name, s_place, e_place, tour_places_name, image));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tourList;
    }

    @Override
    public void createTour(TourListDTO tourListDTO) {

    }
}
