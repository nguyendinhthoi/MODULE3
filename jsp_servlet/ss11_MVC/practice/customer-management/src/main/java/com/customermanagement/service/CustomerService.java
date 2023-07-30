package com.customermanagement.service;

import com.customermanagement.model.Customer;
import com.customermanagement.repository.CustomerRepository;
import com.customermanagement.repository.ICustomerRepository;


import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public Map<Integer, Customer> findAll() {
        return iCustomerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        iCustomerRepository.insertCustomer(customer);
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        iCustomerRepository.updateCustomer(id,customer);
    }

    @Override
    public void remove(int id, boolean available) {
        iCustomerRepository.deleteCustomer(id, available);
    }
}
