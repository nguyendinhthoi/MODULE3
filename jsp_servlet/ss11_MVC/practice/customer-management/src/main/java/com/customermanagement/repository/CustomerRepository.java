package com.customermanagement.repository;

import com.customermanagement.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    public static final String INSERT = "insert into customer (name_customer, email_customer,address_customer) value (?,?,?);";
    public static final String SELECT_ALL = "select * from customer";
    public static final String DELETE = "update customer set status_customer = 1 where id_customer = ?";
    public static final String AVAILABLE = "update customer set status_customer = 0 where id_customer = ?";
    public static final String UPDATE = "update customer set " +
            "name_customer = ? ," +
            "email_customer = ? ," +
            "address_customer = ?," +
            "status_customer = ? " +
            "where id_customer = ?";

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCustomer(int id, Customer customer) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setInt(4, customer.getStatus());
            preparedStatement.setInt(5, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteCustomer(int id, boolean available) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement;
            if (available) {
                preparedStatement = connection.prepareStatement(DELETE);
                preparedStatement.setInt(1, id);
            } else {
                preparedStatement = connection.prepareStatement(AVAILABLE);
                preparedStatement.setInt(1, id);
            }
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public Map<Integer, Customer> findAll() {
        Map<Integer, Customer> customerMap = new HashMap<>();
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_customer");
                String name = resultSet.getString("name_customer");
                String email = resultSet.getString("email_customer");
                String address = resultSet.getString("address_customer");
                int status = resultSet.getInt("status_customer");

                customerMap.put(id, new Customer(id, name, email, address, status));
            }
            connection.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerMap;
    }

    @Override
    public Customer findById(int id) {
        return findAll().get(id);
    }
}
