package com.example.repository.employee.impl;



import com.example.model.employee.EmployeeType;
import com.example.repository.employee.IEmployeeTypeRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeTypeRepo implements IEmployeeTypeRepo {
    private static final String SELECT_TYPE = "select * from employee_types";

    @Override
    public List<EmployeeType> getAll() {
        List<EmployeeType> employeeTypeList = new ArrayList<>();
        Connection connection = BaseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_type_id");
                String name = resultSet.getString("employee_type_name");
                employeeTypeList.add(new EmployeeType(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeTypeList;
    }
}
