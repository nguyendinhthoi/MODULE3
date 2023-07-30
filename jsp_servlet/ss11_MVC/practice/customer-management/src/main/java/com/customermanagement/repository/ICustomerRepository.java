package com.customermanagement.repository;

import com.customermanagement.model.Customer;

import java.util.Map;

public interface ICustomerRepository {
    void insertCustomer(Customer customer);
    void updateCustomer(int id, Customer customer);
    void deleteCustomer(int id,boolean available);
    Map<Integer,Customer> findAll();
    Customer findById(int id);
}
