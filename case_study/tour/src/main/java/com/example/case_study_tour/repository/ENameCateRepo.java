package com.example.case_study_tour.repository;


import com.example.case_study_tour.model.ENameCate;
import com.example.case_study_tour.repository.database.Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ENameCateRepo implements IENameCateRepo {
    private static final String SELECT_NAME = "select employee_id, employee_name " + "from employees ee " + "where employee_type_id = 1";
    private static final String SELECT_NOT_AVAILABLE1 = "select employee_id " + "from tours where employee_id = ? group by employee_id";
    private static final String SELECT_NOT_AVAILABLE = "select employee_id " +
            "from tours " +
            "where employee_id = ? and" +
            " ((? between start_date and end_date) or (? between start_date and end_date));";

    private static final String UPDATE_CATE = "update employees " + "set employee_status = 1 " + "where employees.employee_id " + "in " + "(select employee_id " + "from tours); ";

    @Override
    public List<ENameCate> displayCateN() {
        List<ENameCate> eNameCates = new ArrayList<>();
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                eNameCates.add(new ENameCate(id, name));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return eNameCates;
    }

    @Override
    public ENameCate getIdAvailable(int employee_id, String s_date, String e_date) {
        Connection connection = Base.getConnection();
        ENameCate eNameCate = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NOT_AVAILABLE);
            preparedStatement.setInt(1, employee_id);
            preparedStatement.setString(2, s_date);
            preparedStatement.setString(3,e_date);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                eNameCate = new ENameCate(id);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return eNameCate;
    }

    @Override
    public void updateCate() {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CATE);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}