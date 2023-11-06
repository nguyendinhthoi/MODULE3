package com.example.service.customer;

import com.example.model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAll();

    void deleteCustomerById(int idCustomer);

    Customer getCustomerById(int idCustomer);

    void updateCustomer(Customer customer);

    void addCustomer(Customer customer);

    Customer getDetail(int accountId);

    int sumCountCus();
}
