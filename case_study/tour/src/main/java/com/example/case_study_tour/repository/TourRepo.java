package com.example.case_study_tour.repository;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.dto.TourListDTO;
import com.example.case_study_tour.repository.database.Base;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TourRepo implements ITourRepo {


    private static final String SELECT_BY_ID = "select * from tours where tour_id = ?";
    private static final String SELECT_BY_ID_DTO = "select tour_id, tour_name, tour_description, tour_price, tour_available_seats," +
            " start_date, end_date, employee_name, place_start, place_end, tour_places_name, image" +
            " from tours as t" +
            " join employees as ee" +
            " on t.employee_id = ee.employee_id" +
            " join tour_places as tp" +
            " on t.tour_places_id = tp.tour_places_id" +
            " where t.tour_id = ?";

    private static final String CREATE = "INSERT INTO `travel_tour_booking`.`tours` (`tour_name`, " +
            "`tour_description`" +
            ", `tour_price`" +
            ", `tour_available_seats`" +
            ", `start_date`" +
            ", `end_date`" +
            ", `employee_id`" +
            ", `place_start`" +
            ", `place_end`" +
            ", `tour_places_id` " +
            ", `image`) " +
            "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String DELETE = "update tours set is_delete = 1 where tour_id = ?;";
    private static final String SELECT_UNDEL = "select tour_id, tour_name, tour_description, tour_price, tour_available_seats," +
            " start_date, end_date, employee_name, place_start, place_end, tour_places_name, image" +
            " from tours as t" +
            " join employees as ee" +
            " on t.employee_id = ee.employee_id" +
            " join tour_places as tp" +
            " on t.tour_places_id = tp.tour_places_id" +
            " where t.is_delete = 0";

    private static final String UPDATE = "update tours set tour_name = ? ," +
            "tour_description = ? , " +
            "tour_price = ? , " +
            "tour_available_seats = ? ," +
            "start_date = ? ," +
            "end_date = ? ," +
            "employee_id = ? ," +
            "place_start = ? ," +
            "place_end = ? ," +
            "tour_places_id = ? ," +
            "image = ? " +
            "where tour_id = ?";

    @Override
    public void createTour(Tour tour) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);

            preparedStatement.setString(1, tour.getTourName());
            preparedStatement.setString(2, tour.getTourDesc());
            preparedStatement.setDouble(3, tour.getTourPrice());
            preparedStatement.setInt(4, tour.getAvailableSeat());
            preparedStatement.setString(5, tour.getStartDate());
            preparedStatement.setString(6, tour.getEndDate());
            preparedStatement.setInt(7, tour.getEmployeeId());
            preparedStatement.setString(8, tour.getPlaceStart());
            preparedStatement.setString(9, tour.getPlaceEnd());
            preparedStatement.setInt(10, tour.getTourPlaceId());


            String image = "";
            for (String s : tour.getImage()) {
                image += "," + s.trim();
            }
            preparedStatement.setString(11, image);

            preparedStatement.executeUpdate();
            connection.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void deleteTour(int id) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<TourListDTO> displayUnDel() {
        Connection connection = Base.getConnection();
        List<TourListDTO> tourList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_UNDEL);
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

                List<String> stringList = new ArrayList<>();
                String[] stringsImage = image.split(",");
                for (String s : stringsImage) {
                    stringList.add(s);
                }
                tourList.add(new TourListDTO(id, name, desc, price, seat, s_date, e_date, employee_name, s_place, e_place, tour_places_name, stringList));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tourList;
    }

    @Override
    public void editTour(int id, Tour tour) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, tour.getTourName());
            preparedStatement.setString(2, tour.getTourDesc());
            preparedStatement.setDouble(3, tour.getTourPrice());
            preparedStatement.setInt(4, tour.getAvailableSeat());
            preparedStatement.setString(5, tour.getStartDate());
            preparedStatement.setString(6, tour.getEndDate());
            preparedStatement.setInt(7, tour.getEmployeeId());
            preparedStatement.setString(8, tour.getPlaceStart());
            preparedStatement.setString(9, tour.getPlaceEnd());
            preparedStatement.setInt(10, tour.getTourPlaceId());

            String image = "";
            for (String s : tour.getImage()) {
                image += "," + s.trim();
            }
            preparedStatement.setString(11, image);
            preparedStatement.setInt(12, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Tour findTour(int id) {
        Connection connection = Base.getConnection();
        Tour tour = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("tour_id");
                String name = resultSet.getString("tour_name");
                String desc = resultSet.getString("tour_description");
                double price = resultSet.getDouble("tour_price");
                int seat = resultSet.getInt("tour_available_seats");
                String s_date = resultSet.getString("start_date");
                String e_date = resultSet.getString("end_date");
                int employee_id = resultSet.getInt("employee_id");
                String s_place = resultSet.getString("place_start");
                String e_place = resultSet.getString("place_end");
                int tour_places_id = resultSet.getInt("tour_places_id");
                String image = resultSet.getString("image");

                List<String> listImage = new ArrayList<>();
                String[] stringsImage = image.split(",");
                for (String s : stringsImage) {
                    listImage.add(s);
                }
                tour = new Tour(id1, name, desc, price, seat, s_date, e_date, employee_id, s_place, e_place, tour_places_id, listImage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tour;
    }

    @Override
    public TourListDTO findTourDTO(int id) {
        Connection connection = Base.getConnection();
        TourListDTO tourListDTO = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID_DTO);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("tour_id");
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

                List<String> stringList = new ArrayList<>();
                String[] stringsImage = image.split(",");
                for (String s : stringsImage) {
                    stringList.add(s);
                }
                tourListDTO = new TourListDTO(id1, name, desc, price, seat, s_date, e_date, employee_name, s_place, e_place, tour_places_name, stringList);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tourListDTO;
    }

}
