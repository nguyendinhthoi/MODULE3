package com.example.repository.employee.impl;


import com.example.model.employee.Employee;
import com.example.model.employee.dto.EmployeeListDto;
import com.example.repository.employee.IEmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {
    private static final String SELECT_DTO = "select employee_id, employee_name, employee_phone, employee_email, employee_gender, employee_status, employee_type_name " +
            "from employees e " +
            "join employee_types et on e.employee_type_id = et.employee_type_id " +
            "where is_delete = 0 " +
            "order by employee_id";
    private static final String INSERT_EMPLOYEE = "insert into employees (employee_name, employee_phone, employee_email, employee_gender, employee_type_id) " +
            "VALUES (?,?,?,?,?)";
    private static final String SELECT_BY_ID = "select * " +
            "from employees " +
            "where employee_id = ?";
    private static final String UPDATE_EMPLOYEE = "update employees set " +
            "employee_name = ? ," +
            "employee_phone = ? ," +
            "employee_email = ? ," +
            "employee_gender = ? ," +
            "employee_type_id = ? ," +
            "employee_status = ? " +
            "where employee_id = ? ";
    private static final String SUM_COUNT = "select count(employee_id) as count from employees where is_delete = 0;";
    private static final String DELETE_EMPLOYEE = "update employees set is_delete = 1 where employee_id = ?";



    @Override
    public List<EmployeeListDto> getAll() {
        return null;
    }

    @Override
    public void createEmployee(Employee employee) {
        try {
            Connection connection = BaseRepo.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeePhone());
            preparedStatement.setString(3, employee.getEmployeeEmail());
            preparedStatement.setInt(4, employee.getGender());
            preparedStatement.setInt(5, employee.getEmployeeTypeId());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void deleteEmployee(int id) {
        Connection connection = BaseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void editEmployee(int id, Employee employee) {
        Connection connection = BaseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeePhone());
            preparedStatement.setString(3, employee.getEmployeeEmail());
            preparedStatement.setInt(4, employee.getGender());
            preparedStatement.setInt(5, employee.getEmployeeTypeId());
            preparedStatement.setInt(6, employee.getStatus());
            preparedStatement.setInt(7, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Employee findEmployee(int id) {
        Connection connection = BaseRepo.getConnection();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                int gender = resultSet.getInt("employee_gender");
                int status = resultSet.getInt("employee_status");
                int typeId = resultSet.getInt("employee_type_id");
                employee = new Employee(id1, name, phone, email, gender, status, typeId);
            }
            connection.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employee;
    }


    @Override
    public List<EmployeeListDto> getAllDto() {
        Connection connection = BaseRepo.getConnection();
        List<EmployeeListDto> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DTO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                int gender = resultSet.getInt("employee_gender");
                int status = resultSet.getInt("employee_status");
                String typeName = resultSet.getString("employee_type_name");
                employeeList.add(new EmployeeListDto(id, name, phone, email, gender, status, typeName));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }

    @Override
    public int sumCount() {
        Connection connection = BaseRepo.getConnection();
        int count = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUM_COUNT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

}

