package com.example.repository.customer.impl;

import com.example.model.customer.Customer;
import com.example.repository.customer.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    public static final String SELECT_ALL_CUSTOMER = "select * from customers ;";
    public static final String DISPLAY_DELETE_CUSTOMER = " select * from customers join customer_types on customer_types.customer_type_id = customers.customer_type_id\n" +
            "where customers.is_delete  = 0; ";
    public static final String DELETE_CUSTOMER = "delete from customers where customers.customer_id = ?;";
    //int customerId, String customerName, String customerIdCard, boolean customerGender,
//                    String customerEmail, String customerPhone, String customerAddress, int customerTypeId, int accountId
    public static final String UPDATE_DELETE_CUSTOMER = "update customers set customers.is_delete =1 \n" +
            "where customers.customer_id = ?;";
    public static final String SELECT_CUSTOMER_BY_ID = " select * from customers where customers.customer_id = ?; ";
    public static final String UPDATE_CUSTOMER = "update customers c set c.customer_name = ?, c.customer_id_card = ?, c.customer_gender = ?, c. customer_email = ?, c.customer_phone = ?, c.customer_address = ?\n" +
            "where c.customer_id = ?; ";
    public static final String INSERT_CUSTOMER = "INSERT INTO customers (customer_id, customer_name, customer_id_card, customer_gender, customer_email, customer_phone, customer_address, customer_type_id,is_delete,account_id) VALUES (?,?,?,?,?,?,?,1,0,3);";
    private static final String SELECT_DETAIL = "select * from customers where account_id = ?";
    private static final String SUM_COUNT_CUS = "select count(customer_id) as count from customers where is_delete = 0;";

    @Override
    public List<Customer> getAll() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement statement = BaseRepository.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery(DISPLAY_DELETE_CUSTOMER);
            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerIdCard(resultSet.getString("customer_id_card"));
                customer.setCustomerGender(resultSet.getBoolean("customer_gender"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setAccountId(resultSet.getInt("account_id"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;
    }

    @Override
    public boolean removeCustomerById(int idCustomer) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DELETE_CUSTOMER);
            preparedStatement.setInt(1, idCustomer);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowDelete;
    }

    //int customerId, String customerName, String customerIdCard, boolean customerGender,
//                    String customerEmail, String customerPhone, String customerAddress, int customerTypeId, int accountId
    @Override
    public Customer findCustomerById(int idCustomer) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, idCustomer);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String customerName = resultSet.getString("customer_name");
                String customerIdCard = resultSet.getString("customer_id_card");
                boolean customerGender = resultSet.getBoolean("customer_gender");
                String customerEmail = resultSet.getString("customer_email");
                String customerPhone = resultSet.getString("customer_phone");
                String customerAddress = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                int accountId = resultSet.getInt("account_id");
                boolean customerIsDel = resultSet.getBoolean("is_delete");
                customer = new Customer(idCustomer, customerName, customerIdCard, customerGender, customerEmail, customerPhone, customerAddress, customerTypeId, accountId, customerIsDel);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerIdCard());
            preparedStatement.setBoolean(3, customer.isCustomerGender());
            preparedStatement.setString(4, customer.getCustomerEmail());
            preparedStatement.setString(5, customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerAddress());
            preparedStatement.setInt(7, customer.getCustomerId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowUpdate;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomerId());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerIdCard());
            preparedStatement.setBoolean(4, customer.isCustomerGender());
            preparedStatement.setString(5, customer.getCustomerEmail());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerAddress());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    public Customer getDetail(int accountId) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DETAIL);
            preparedStatement.setInt(1, accountId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Customer(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getBoolean(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7),
                        resultSet.getInt(8), resultSet.getInt(9), resultSet.getBoolean(10));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public int sumCountCus() {
        Connection connection = BaseRepository.getConnection();
        int count = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUM_COUNT_CUS);
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
