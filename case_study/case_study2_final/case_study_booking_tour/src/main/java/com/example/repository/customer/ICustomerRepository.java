package com.example.repository.customer;

import com.example.model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getAll();

    boolean removeCustomerById(int idCustomer);

    Customer findCustomerById(int idCustomer);

    boolean updateCustomer(Customer customer);

    void addCustomer(Customer customer);

    Customer getDetail(int accountId);

    int sumCountCus();
}
