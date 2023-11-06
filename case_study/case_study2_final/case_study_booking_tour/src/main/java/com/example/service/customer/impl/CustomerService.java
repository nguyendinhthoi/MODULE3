package com.example.service.customer.impl;

import com.example.model.customer.Customer;
import com.example.repository.customer.ICustomerRepository;
import com.example.repository.customer.impl.CustomerRepository;
import com.example.service.customer.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> getAll() {
        List<Customer> customerList = customerRepository.getAll();
        return customerList;
    }

    @Override
    public void deleteCustomerById(int idCustomer) {
        customerRepository.removeCustomerById(idCustomer);
    }

    @Override
    public Customer getCustomerById(int idCustomer) {
        return customerRepository.findCustomerById(idCustomer);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public void addCustomer(Customer customer) {
        customerRepository.addCustomer(customer);
    }

    @Override
    public Customer getDetail(int accountId) {
        return customerRepository.getDetail(accountId);
    }

    @Override
    public int sumCountCus() {
        return customerRepository.sumCountCus();
    }
}
